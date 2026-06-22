SMODS.Joker {
  key = 'snow_comedian',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
        card.ability.extra.mult_add,
        card.ability.extra.chips_add
      }
    }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet6',
  pos = { x = 6, y = 0 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { 
    extra = { 
      mult = 0, 
      chips = 0, 
      mult_add = 8, 
      chips_add = 23 
    } 
  },
  pools = { ["Comedians"] = true, },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local pure_even_hand = true
      local pure_odd_hand = true
      local strict_snow_flush = true
      
      local is_flush_hand = context.scoring_name == "Flush" or 
                            context.scoring_name == "Straight Flush" or 
                            context.scoring_name == "Royal Flush" or 
                            context.scoring_name == "Flush Five" or 
                            context.scoring_name == "Flush House"

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]
        local is_snow_suit = scoring_card.base.suit == 'abn_Snow'

        if is_snow_suit then
          local is_even = ABN.is_even(scoring_card)
          local is_odd = ABN.is_odd(scoring_card)

          if not is_even then
            pure_even_hand = false
          end

          if not is_odd then
            pure_odd_hand = false
          end
        else
          pure_even_hand = false
          pure_odd_hand = false
          strict_snow_flush = false
        end
      end

      local triggered = false

      if pure_even_hand and #context.scoring_hand > 0 then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_add
        triggered = true
      end

      if pure_odd_hand and #context.scoring_hand > 0 then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_add
        triggered = true
      end

      if is_flush_hand and strict_snow_flush and #context.scoring_hand > 0 then
        for i = 1, #context.scoring_hand do
          local target_rank = context.scoring_hand[i].base.value
          
          ABN.level_up_rank(card, target_rank, 1)
        end
        
        triggered = true
      end

      if triggered then
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.ATTENTION,
          card = card
        }
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "RadicaAprils & Meladaptive",
  },
}