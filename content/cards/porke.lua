SMODS.Joker {
    key = 'porke',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 6, y = 8 },
    soul_pos = { x = 7, y = 8},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { xchipsadd = 2, xchips = 0 } },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchipsadd,
                card.ability.extra.xchips,
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
            
            -- Calculate total chips: 2x per unique consumable
            card.ability.extra.xchips = count * card.ability.extra.xchipsadd
			if count == 0 then
				card.ability.extra.xchips = 1
			end
        else
            card.ability.extra.xchips = 1
        end
    end,
    
    calculate = function(self, card, context)
        if context.other_joker and card.ability.extra.xchips >= 1 then
            return {
                xchips = card.ability.extra.xchips, 
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}