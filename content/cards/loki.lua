SMODS.Joker {
  key = 'loki',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 2 },
  soul_pos = { x = 3, y = 2 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,
  config = { extra = { mult = 100 } },
  pools = { ["Comedians"] = true, },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  
  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,
  
  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    -- Fire during Steamodded's post_trigger context
    if context.post_trigger and context.other_card then
      local other = context.other_card
      
      -- Verify the triggering card is a Joker and is currently in the Joker slots
      if other.ability and other.config and other.config.center and other.area == G.jokers then
        
        -- Ignore this check if the card triggering is Loki itself
        if other.config.center.key ~= 'j_abn_loki' then
          local pools = other.config.center.pools
          
          -- If the triggered joker belongs to the Comedians pool
          if pools and pools.Comedians then
            local hit_any = false

            -- Loop through and buff all non-comedians
            if G.jokers and G.jokers.cards then
              for _, j in ipairs(G.jokers.cards) do
                local j_pools = j.config.center.pools
                
                -- Target jokers that are NOT Comedians
                if not (j_pools and j_pools.Comedians) then
                  j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + card.ability.extra.mult
                  hit_any = true
                  
                  -- Provide standard Balatro visual card pop flare
                  j:juice_up(0.6, 0.1)
                end
              end
            end

            -- If any targets were found and scaled, display the overhead textbook popup
            if hit_any then
              return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                card = card
              }
            end
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Ruby",
  },
}