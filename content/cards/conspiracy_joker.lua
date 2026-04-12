SMODS.Joker {
    key = 'conspiracy_joker',
    rarity = 2,
    atlas = 'AbandoniaJokers',
    pos = { x = 1, y = 30 },
    cost = 6,
    discovered = false,
    blueprint_compat = true, 
    
    config = { extra = { chips = 0, mult = 0, multadd = 5, chipsadd = 10 } },

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.multadd, card.ability.extra.chipsadd }}
    end,
    
    in_pool = function(self)
        if G.jokers and G.jokers.cards then
			for _, card in ipairs(G.jokers.cards) do
				if card.ability.abn_perma_flipped then
					return true
				end
			end
		end
		return false
    end,
	
	update = function(self, card)
		if card.area == G.jokers then
			for _, v in ipairs(G.jokers.cards) do
				-- if hands played is even
				if G.GAME.current_round.hands_played % 2 == 0 then
					if v.facing == 'front' then
						v:flip()
						v.ability.abn_perma_flipped = true
						G.jokers:shuffle('aajk')
					end
				-- if hands played is odd
				else
					if v.facing == 'back' then
						-- remove perma flip so that they can be flipped
						v.ability.abn_perma_flipped = false
						v:flip()
						G.jokers:shuffle('aajk')
					end
				end
			end
		end
	end,

    calculate = function(self, card, context)

        -- Trigger for other holo Jokers
		if context.post_trigger and context.other_card and not context.blueprint then
            local target = context.other_card
            
            -- face up jokers
            if target ~= card and type(target) == 'table' and target.ability and target.ability.set == 'Joker' and target.facing == "front" then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.BLUE,
                    card = card
                }
            end
			
			-- face down jokers
			if target ~= card and type(target) == 'table' and target.ability and target.ability.set == 'Joker' and target.facing == "back" then
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.RED,
                    card = card
                }
            end
        end
		
		if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
		
    end,

    abn_artist_credits = {
        artist = "Lackymackswanky",
    },
}