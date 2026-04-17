SMODS.Joker {
  key = 'insolvent_comedian',
  rarity = "abn_SuperRare",
  atlas = 'AbandoniaJokers',
  pos = { x = 0, y = 17 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 100,
	  mult = 10,
      hand = "None", -- Stores the last played hand
      required_hand = "None", -- Stores the required hand for the current round
    }
  },
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
		card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.hand,  -- Last played hand
        card.ability.extra.required_hand,  -- Required hand
      }
    }
  end,
  
  update = function(self, card)
    if card.area == G.shop_jokers then
		card.cost = 30
	end
  end,
  
  calculate = function(self, card, context)
    local extra = card.ability.extra
    local scoring_name = context.scoring_name
    
    if context.end_of_round and not context.repetition and not context.individual then
      extra.required_hand = extra.hand
    end
    
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      -- Update the last played hand
      if scoring_name then
        extra.hand = scoring_name
      end
    end
	
	-- Only apply the multiplier if the scoring name matches the required hand
    if context.joker_main and context.scoring_name == extra.required_hand then
		for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
			
			-- Gain chips and mult
            j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.chips
			j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + card.ability.extra.mult
        end
	end
  end
}