SMODS.Joker {
    key = 'hunter_license',
	
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollars } }
	end,
	
    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 8, y = 14 },
    cost = 1,
    discovered = false,
    blueprint_compat = true,
	
	config = { extra = { dollars = 25 } },
	
	in_pool = function(self)
		return not G.GAME.HunterDied
    end,
	
	
	add_to_deck = function(self, card)
        ease_dollars(card.ability.extra.dollars)
		card.sell_cost = 0
    end,
	
    calculate = function(self, card, context)
        if G.GAME.dollars <= 0 then
			card:start_dissolve()
			G.GAME.HunterDied = true
			G.GAME.HunterAnte = G.GAME.round_resets.ante
		end
    end,

    abn_artist_credits = {
        artist = "Gelopsys"
    },
}
