SMODS.Joker {
  key = 'origiri_triplets',
  rarity = 1,
  atlas = 'ABNJokerSheet17',
  pos = { x = 2, y = 5 }, 
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = { 
    extra = { 
      mult = 0, 
      chips = 0, 
      multadd = 3, 
      chipsadd = 3,
      moneyadd = 3
    } 
  },
  
  loc_vars = function(self, info_queue, card)
    return { 
      vars = { 
        card.ability.extra.mult,     
        card.ability.extra.chips,    
        card.ability.extra.multadd, 
        card.ability.extra.chipsadd,
        card.ability.extra.moneyadd
      } 
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local hand_sum = 0
      if context.scoring_hand then
        for i = 1, #context.scoring_hand do
          hand_sum = hand_sum + context.scoring_hand[i].base.nominal
        end
      end

      if hand_sum > 0 and hand_sum % 3 == 0 then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
        
        card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.moneyadd
        card:set_cost()

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.ATTENTION,
        }
      end
    end

    if context.joker_main then
      if card.ability.extra.mult > 0 or card.ability.extra.chips > 0 then
        return {
          mult = card.ability.extra.mult,
          chips = card.ability.extra.chips,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Yume",
  },
}