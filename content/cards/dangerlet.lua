SMODS.Joker {
    key = 'dangerlet',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 6, y = 1 },
    soul_pos = { x = 7, y = 1},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
	
	config = { extra = { mult = 10, chips = 80, xmult = 2, dollars = 2, odds = 3, } },
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
				card.ability.extra.xmult,
				card.ability.extra.dollars,
				G.GAME.probabilities.normal,
				card.ability.extra.odds,
            }
        }
    end,
    
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			local currentCard = context.other_card
            if currentCard then
				return {
                    mult = card.ability.extra.mult,
					chips = card.ability.extra.chips,
					xmult = card.ability.extra.xmult,
					dollars = card.ability.extra.dollars,
                }
			end
		end
		
		-- destroy odds
		if context.destroy_card then
			if context.cardarea == G.play then
				-- 1/3 destroy chance per card
				if pseudorandom('dangerlet' .. G.GAME.round_resets.ante) < G.GAME.probabilities.normal / card.ability.extra.odds then
					return {remove = true}
				end
			end
		end
    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}