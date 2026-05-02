SMODS.Joker {
    key = 'york',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 4, y = 4 },
    soul_pos = { x = 5, y = 4},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
	
	config = { extra = { xmult = 2, xchips = 2, } },
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
				card.ability.extra.xchips,
            }
        }
    end,
    
    calculate = function(self, card, context)
	
		if context.individual and context.cardarea == G.play then
			local currentCard = context.other_card
            if currentCard then
				return {
					xmult = card.ability.extra.xmult,
                }
			end
		end
		
		if context.cardarea == G.hand and context.individual and not context.end_of_round then
            return {
				xchips = card.ability.extra.xchips,
            }
        end

    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}