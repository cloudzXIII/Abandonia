SMODS.Joker {
    key = 'j_jimbob',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 0, y = 4 },
    soul_pos = { x = 1, y = 4},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
	
	config = { extra = { xmult = 2, xchips = 2 } },
	
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
            if currentCard.config.center == G.P_CENTERS.m_stone or currentCard.config.center == G.P_CENTERS.m_glass or currentCard.config.center == G.P_CENTERS.m_lucky or currentCard.config.center == G.P_CENTERS.m_mult then
				return {
					xchips = card.ability.extra.xchips,
                }
			elseif currentCard.config.center == G.P_CENTERS.m_steel or currentCard.config.center == G.P_CENTERS.m_bonus or currentCard.config.center == G.P_CENTERS.m_gold or currentCard.config.center == G.P_CENTERS.m_wild then
				return {
					xmult = card.ability.extra.xmult,
                }
			end
		end
    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}