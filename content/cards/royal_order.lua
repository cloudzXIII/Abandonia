SMODS.Joker {
  key = 'royal_order',
  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 6, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xmult = 4,
	  level = 2,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.level,
        card.ability.extra.xmult,
      },
    }
  end,
  
  
  calculate = function(self, card, context)
	if context.before then
	
		local first_card = context.scoring_hand[1]
		local second_card = context.scoring_hand[2]
		local third_card = context.scoring_hand[3]
		local fourth_card = context.scoring_hand[4]
		
		if first_card and first_card:is_suit("Hearts") and second_card and second_card:is_suit("Diamonds") and third_card and third_card:is_suit("Clubs") and fourth_card and fourth_card:is_suit("Spades") then 
			return {
				level_up = card.ability.extra.level,
				message = localize('k_level_up_ex')
			}
		end
	end
	
	if context.joker_main then
		local first_card = context.scoring_hand[1]
		local second_card = context.scoring_hand[2]
		local third_card = context.scoring_hand[3]
		local fourth_card = context.scoring_hand[4]
		
		if first_card and first_card:is_suit("Hearts") and second_card and second_card:is_suit("Diamonds") and third_card and third_card:is_suit("Clubs") and fourth_card and fourth_card:is_suit("Spades") then 
			return {
				xmult = card.ability.extra.xmult,
			}
		end
	end
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}
