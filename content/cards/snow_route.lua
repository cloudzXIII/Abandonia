SMODS.Joker {
  key = 'snow_route',
  rarity = 1,
  atlas = 'ABNJokerSheet8',
  pos = { x = 4, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      odds = 13
    }
  },
  
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
    return { vars = { numerator, denominator, } }
  end,
  
  -- Only appear if have snow suit
  in_pool = function(self)
    if not G.playing_cards then return false end
    local count = 0
    for _, card in ipairs(G.playing_cards) do
      if card:is_suit("abn_Snow") then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    -- Individual card triggers
    if context.individual and context.cardarea == G.play then
		local currentCard = context.other_card
        if currentCard and currentCard:is_suit("abn_Snow") then
			if SMODS.pseudorandom_probability(card, 'prenatural_vouch', 1, card.ability.extra.odds) then
				return {
					level_up = true,
					message = localize('k_level_up_ex')
				}
			else
				card_eval_status_text(card, 'extra', nil, nil, nil, {
					message = localize('k_nope_ex'),
					colour = G.C.SECONDARY_SET.Tarot,
				})
			end
		end
    end
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}
