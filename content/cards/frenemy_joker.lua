SMODS.Joker {
    key = 'frenemy_joker',
    rarity = "abn_SuperRare",
    atlas = 'ABNJokerSheet17', 
    pos = { x = 0, y = 0 }, 
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { percent_per_rarity = 10, percent = 0, requirement = 0 } },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent_per_rarity,
                card.ability.extra.percent,
            }
        }
    end,
    
    update = function(self, card)
        -- Only run during an active game run
        if G.STAGE ~= G.STAGES.RUN then return end

        if G.jokers and G.jokers.cards then
            local unique_rarities = {}
            local count = 0
            
            for _, j in ipairs(G.jokers.cards) do
                if j.config and j.config.center and j.config.center.rarity then
                    local r = j.config.center.rarity
                    if not unique_rarities[r] then
                        unique_rarities[r] = true
                        count = count + 1
                    end
                end
            end
           
            card.ability.extra.percent = count * card.ability.extra.percent_per_rarity
            
            if card.area == G.jokers and card.ability.extra.requirement >= 1 and G.GAME.blind and G.GAME.blind.chips then
                if card.ability.extra.percent >= 1 then
                    local reduction_multiplier = math.max(0, (100 - card.ability.extra.percent) / 100)
                    G.GAME.blind.chips = math.floor(card.ability.extra.requirement * reduction_multiplier)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                else
                    G.GAME.blind.chips = card.ability.extra.requirement
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                end
            end
        else
            card.ability.extra.percent = 0
        end
    end,
	
	remove_from_deck = function(self, card)
        if card.ability.extra.requirement ~= 0 then
			G.GAME.blind.chips = card.ability.extra.requirement
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
    end,
    
    calculate = function(self, card, context)
	
        if context.first_hand_drawn then
			card.ability.extra.requirement = G.GAME.blind.chips
        end
		
        if context.end_of_round and not context.blueprint and not context.repetition then
            card.ability.extra.requirement = 0
        end
		
    end,

    abn_artist_credits = {
        artist = "Comykel",
    },
}