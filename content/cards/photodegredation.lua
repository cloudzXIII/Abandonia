SMODS.Joker {
  key = 'photodegradation',
  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 7, y = 2 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      chips = 0,
      mult = 0,
      x_mult = 1,
      chipsadd = 4,
      multadd = 2,
      xmultadd = 0.05
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.x_mult,
        card.ability.extra.chipsadd,
        card.ability.extra.multadd,
        card.ability.extra.xmultadd
      }
    }
  end,

  in_pool = function(self)
    return G.GAME.abn_any_spectrum_played --See main.lua
  end,

  calculate = function(self, card, context)
    -- scaling
    if context.before and not context.blueprint and next(context.poker_hands["abn_Spectrum"]) then
        -- count occurrences of each suit in the hand (not played cards)
        local suit_counts = {}
        local matches = 0

        for _, hc in ipairs(G.hand.cards) do
          -- Suitless and wild cards never "match" suits
          if not SMODS.has_no_suit(hc) and not SMODS.has_any_suit(hc) then
            local suit = hc.base.suit
            suit_counts[suit] = (suit_counts[suit] or 0) + 1
          end
        end

        for _, count in pairs(suit_counts) do
          if count > 1 then
            matches = matches + count
          end
        end

        -- scale if we have matching suits
        if matches > 0 then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "chips",
            scalar_value = "chipsadd",
            no_message = true,
            operation = function(ref_table, ref_value, initial, change)
              ref_table[ref_value] = initial + change * matches
            end
          })
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "mult",
            scalar_value = "multadd",
            no_message = true,
            operation = function(ref_table, ref_value, initial, change)
              ref_table[ref_value] = initial + change * matches
            end
          })

          -- edition check
          if card.edition then
            SMODS.scale_card(card, {
              ref_table = card.ability.extra,
              ref_value = "x_mult",
              scalar_value = "xmultadd",
              no_message = true,
              operation = function(ref_table, ref_value, initial, change)
                ref_table[ref_value] = initial + change * matches
              end
            })
          end

          return {message = localize("k_upgrade_ex")}
        end
    end

    -- SCORING LOGIC
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult,
        x_mult = card.ability.extra.x_mult
      }
    end
  end,

  abn_artist_credits = {
    artist = "Fridgemancer",
  },
}
