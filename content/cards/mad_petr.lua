SMODS.Joker {
    key = 'mad_petr',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 4, y = 5 },
    soul_pos = { x = 5, y = 5},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
	
	config = { extra = { repetitions = 0, } },
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.repetitions,
            }
        }
    end,
	
	update = function(self, card)
        -- Only run during a game run
        if G.STAGE ~= G.STAGES.RUN then return end
        
        if G.consumeables and G.consumeables.cards then
            local unique_consumables = {}
            local count = 0
            
            for _, c in ipairs(G.consumeables.cards) do
                -- Track by the specific card key
                if c.config and c.config.center and c.config.center.key then
                    local key = c.config.center.key
                    if not unique_consumables[key] then
                        unique_consumables[key] = true
                        count = count + 1
                    end
                end
            end
            
            card.ability.extra.repetitions = count
        else
            card.ability.extra.repetitions = 0
        end
    end,
    
    calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and card.ability.extra.repetitions >= 1 then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.repetitions,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Stellars Blue",
    },
}