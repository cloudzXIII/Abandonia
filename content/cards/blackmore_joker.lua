function ABN.blackmore_isnt_fragile(card)
	if card.config and card.config.center and card.config.center.key == "j_abn_blackmore_joker" then
		for _, c in ipairs(G.consumeables.cards) do
			if c.ability and c.ability.set == "weather_report" then
				return true
			end
		end
	end
	return false
end

SMODS.Joker {
  key = 'blackmore_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet4',
  pos = { x = 0, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  set_ability = function(self, card, initial)
    card:add_sticker("abn_fragile", true)
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.scoring_hand[1] == context.other_card then
        return {x_mult = context.other_card.base.nominal}
	elseif context.check_eternal and context.other_card == card and ABN.blackmore_isnt_fragile(card) then
		return {no_destroy = true}
	end
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}
