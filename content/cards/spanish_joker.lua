SMODS.Joker {
  key = 'spanish_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 5, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, multadd = 1} },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.multadd} }
  end,

  calculate = function(self, card, context)
  
    if context.joker_main then
      local triggered = false

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]
        
        if scoring_card:is_suit("Hearts") then
          scoring_card:change_suit("abn_Snow")
          triggered = true
        elseif scoring_card:is_suit("Spades") then
          scoring_card:change_suit("abn_Bow")
          triggered = true
        elseif scoring_card:is_suit("Diamonds") then
          scoring_card:change_suit("abn_Tie")
          triggered = true
        elseif scoring_card:is_suit("Clubs") then
          scoring_card:change_suit("abn_Penumbra")
          triggered = true
        end
      end
	  
	  return {
		mult = card.ability.extra.mult,
	  }
    end
	
	if context.change_suit and context.other_card then
	  if card.edition and card.edition.key == "e_abn_vintage" then
		card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
		card.ability.extra_value = card.ability.extra_value + card.ability.extra.multadd
		card:set_cost()
		return {
			message = localize('k_upgrade_ex'),
			colour = G.C.MULT,
			card = card
		}
	 end
    end
  end,

  abn_artist_credits = {
    artist = "Generic1110",
  },
}