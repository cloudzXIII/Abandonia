
SMODS.Joker {
    key = 'strickland_joker',
    abn_coder = "LasagnaFelidae",
    
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.multadd, card.ability.extra.mult } 
        }
    end,
    
    rarity = 2,
    atlas = 'ABNJokerSheet4',
    pos = { x = 1, y = 0 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { mult = 0, multadd = 2 } },
    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.multadd * #context.full_hand)
            return {
				message = localize('k_upgrade_ex'),
			}
        end
		
		if context.final_scoring_step then
			if SMODS.calculate_round_score() > G.GAME.blind.chips then
                if card.ability.extra.mult > 0 then
                    card.ability.extra.mult = 0
                    return {
                        message = localize('k_reset')
                    }
                end
            end
		end
		
        if context.joker_main then
            return {mult = card.ability.extra.mult}
        end
    
    end,
    abn_artist_credits = {
        artist = "Matheo000",
    },
}
