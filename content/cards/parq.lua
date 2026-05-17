SMODS.Joker {
    key = 'parq',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 2, y = 8 },
    soul_pos = { x = 3, y = 8},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { percent = 0, percentadd = 10, requirement = 0, } },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentadd,
                card.ability.extra.percent,
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
            
            -- Calculate percentage
            card.ability.extra.percent = count * card.ability.extra.percentadd
			
			if card.area == G.jokers and card.ability.extra.percent >= 1 and card.ability.extra.requirement >= 1 and G.GAME.chips and G.GAME.blind.chips and G.GAME.blind.chips >= 1 then
				--remove percentage of blind requirement
				local reduction_multiplier = math.max(0, (100 - card.ability.extra.percent) / 100)
                G.GAME.blind.chips = math.floor(card.ability.extra.requirement * reduction_multiplier)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			elseif card.area == G.jokers and card.ability.extra.percent == 0 and card.ability.extra.requirement >= 1 and G.GAME.chips and G.GAME.blind.chips and G.GAME.blind.chips >= 1 then
				G.GAME.blind.chips = card.ability.extra.requirement
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
        else
            card.ability.extra.percent = 0
        end
    end,
    
    calculate = function(self, card, context)
        if context.first_hand_drawn then
			card.ability.extra.requirement = G.GAME.blind.chips
        end
		if context.end_of_round then
			card.ability.extra.requirement = 0
		end
    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}