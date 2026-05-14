SMODS.Joker {
    key = 'oiled_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet7',
    pos = { x = 0, y = 3 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
	config = { extra = { dollars = 5, mult = 0, chips = 0, multadd = 2, chipsadd = 5 } },
    
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollars, card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.multadd, card.ability.extra.chipsadd} }
	end,
	
	
	in_pool = function(self)
        if not G.playing_cards then return false end
            
        for _, card in ipairs(G.playing_cards) do
            if card and card.config and card.config.center then
                if card.config.center == G.P_CENTERS.m_abn_petroleum then
                    return true
                end
            end
        end
        return false
    end,


    calculate = function(self, card, context)
	
		if context.pre_discard and not context.blueprint then
            local has_petroleum = false
            -- full_hand contains all cards selected for the discard
            for i = 1, #context.full_hand do
                if context.full_hand[i].config.center == G.P_CENTERS.m_abn_petroleum then
                    has_petroleum = true
                    break
                end
            end

            if has_petroleum then
                -- Give the discard back
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
            end
        end
	
        if context.individual and context.cardarea == G.play then
			if context.other_card.config.center and context.other_card.config.center == G.P_CENTERS.m_abn_petroleum then
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
				return {
                    message = localize('k_upgrade_ex'),
					dollars = card.ability.extra.dollars,
                    colour = G.C.ATTENTION,
					card = card
                }
			end
		end
		
		if context.joker_main then
            return {
                mult = card.ability.extra.mult,
				chips = card.ability.extra.chips,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}