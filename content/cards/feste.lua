SMODS.Joker {
    key = 'feste',
    rarity = 4,
    atlas = 'AbandoniaJokers',
    pos = { x = 9, y = 34 },
	soul_pos = { x = 0, y = 35 },
    cost = 20,
    discovered = false,
    blueprint_compat = true, 
    

    calculate = function(self, card, context)
		if context.setting_blind then
			local new_card = create_card('nightshift_cards', G.consumeables)
			new_card:add_to_deck()
			new_card:set_edition({negative = true}, true)
			G.consumeables:emplace(new_card)
		end
    end,

    abn_artist_credits = {
        artist = "Grass",
    },
}