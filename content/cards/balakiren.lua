SMODS.Joker {
  key = 'balakiren',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 4, y = 6 }, 
  soul_pos = { x = 5, y = 6 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,
  config = { extra = { xmult= 1, xchips = 1, xmultadd = 0.05, xchipsadd = 0.05 } },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xchips,
		card.ability.extra.xmultadd,
		card.ability.extra.xchipsadd,

      }
    }
  end,

  calculate = function(self, card, context)
    -- Trigger for every card in the scoring hand individually
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card

      -- Check if the individual scoring card is ODD
      if ABN.is_odd(target_card) then
        
        -- Increase the value
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
        
        return {
          xmult = card.ability.extra.xmult,
		  message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end

      -- Check if the individual scoring card is EVEN
      if ABN.is_even(target_card) then
        
        -- Increase the value
        card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsadd
        
        return {
          xchips = card.ability.extra.xchips,
		  message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "lilboyaka",
  },
}