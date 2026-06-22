SMODS.Joker {
  key = 'celestial_joker',
  rarity = 3, 
  atlas = 'ABNJokerSheet17',
  pos = { x = 3, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 20,
    }
  },
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,
  
  calculate = function(self, card, context)
    if context.setting_blind then
		for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
			j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.chips
			card_eval_status_text(card, 'extra', nil, nil, nil, {
				message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
            })
		end
	end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}
