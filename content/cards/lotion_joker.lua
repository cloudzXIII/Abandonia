SMODS.Joker {
    key = 'lotion_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet9',
    pos = { x = 9, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
	config = { extra = {chips = 0, chipsadd = 10 } },
    
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chipsadd} }
	end,
	
	in_pool = function(self)
        if not G.playing_cards then return false end
            
        for _, card in ipairs(G.playing_cards) do
            if card and card.config and card.config.center then
                if card.config.center == G.P_CENTERS.m_abn_petroleum or card.config.center == G.P_CENTERS.m_stone then
                    return true
                end
            end
        end
        return false
    end,


    calculate = function(self, card, context)
	
		if context.pre_discard and not context.blueprint then
            if context.full_hand then
                for i = 1, #context.full_hand do
                    local discarded_card = context.full_hand[i]
                    if discarded_card.config.center == G.P_CENTERS.m_abn_petroleum or discarded_card.config.center == G.P_CENTERS.m_stone then
                        -- add chips
                        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
                        -- remove enhancement
                        discarded_card:set_ability(G.P_CENTERS.c_base)
						
						
                    end
                end
            end
        end
	
        if context.individual and context.cardarea == G.play then
			if context.other_card.config.center and context.other_card.config.center == G.P_CENTERS.m_abn_petroleum or context.other_card.config.center and context.other_card.config.center == G.P_CENTERS.m_stone then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
				context.other_card:set_ability(G.P_CENTERS.c_base)
				return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
					card = card
                }
			end
		end
		
		if context.joker_main then
            return {
				chips = card.ability.extra.chips,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Null",
    },
}