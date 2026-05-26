SMODS.Joker {
  key = 'painyatta',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 5 },
  soul_pos = { x = 3, y = 5 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { vouchers = 2 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.vouchers } }
  end,
  
  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    -- Trigger when any voucher is purchased, BUT ONLY if we aren't currently processing a Painyatta trigger
    if context.buying_card and context.card and context.card.config.center.set == "Voucher" and not card.ability.processing_painyatta then
      
      -- Set the gate flag to true so recursive redeems don't trigger this again
      card.ability.processing_painyatta = true
      
      for i = 1, card.ability.extra.vouchers do
        G.E_MANAGER:add_event(Event({
          trigger = 'before',
          delay = 0.4,
          func = function()
            local _pool = get_current_pool('Voucher')
            local _voucher_key = nil

            if #_pool > 0 then
              local iv = 1
              -- Added round resets and index to seed to make it dynamic per instance
              _voucher_key = pseudorandom_element(_pool, pseudoseed('painyatta_vouch' .. (G.GAME.round_resets.ants or 1) .. i))

              -- Safety loop for Tier 2 requirements
              while _voucher_key == 'UNAVAILABLE' or (
                  G.P_CENTERS[_voucher_key] and
                  G.P_CENTERS[_voucher_key].requires and
                  (not G.P_CENTERS[G.P_CENTERS[_voucher_key].requires] or not G.P_CENTERS[G.P_CENTERS[_voucher_key].requires].redeemed)
                ) do
                iv = iv + 1
                _voucher_key = pseudorandom_element(_pool, pseudoseed('painyatta_vouch' .. (G.GAME.round_resets.ants or 1) .. i .. '_resample' .. iv))
                if iv > 100 then
                  _voucher_key = 'v_blank'; break
                end
              end
            end

            -- Fallback to Blank if nothing was found
            if not _voucher_key or _voucher_key == 'UNAVAILABLE' then
              _voucher_key = 'v_blank'
            end

            -- Calculate side-by-side spawn positions in the center of G.play
            local spawn_pos = {
              x = G.play.T.x + G.play.T.w * 0.5 + (i - 1.5) * 1.2,
              y = G.play.T.y + G.play.T.h * 0.5
            }

            -- Create the voucher card
            local voucher_card = create_card('Voucher', G.play, nil, nil, nil, nil, _voucher_key, 'pai')
            voucher_card.T.x = spawn_pos.x
            voucher_card.T.y = spawn_pos.y
            
            -- Visual pop and instant redemption
            voucher_card:juice_up(0.3, 0.5)
			G.GAME.dollars = G.GAME.dollars + 10
            voucher_card:redeem()

            -- Clean up the spawned card asset
            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.5,
              func = function()
                voucher_card:remove()
                return true
              end
            }))
            return true
          end
        }))
      end

      -- Reset the flag after all voucher events have safely queued up
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
          card.ability.processing_painyatta = nil
          return true
        end
      }))

    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}