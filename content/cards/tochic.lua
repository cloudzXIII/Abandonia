SMODS.Joker {
    key = 'tochic',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 4, y = 3 },
    soul_pos = { x = 5, y = 3},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { percent = 0, percentadd = 10, } },
    
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
        
        if G.jokers and G.jokers.cards then
            -- Simply get the total number of items in the jokers array
            local count = #G.jokers.cards
            
            -- Calculate percentage based on total Jokers owned
            card.ability.extra.percent = count * card.ability.extra.percentadd
        end
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind then
            local reduction_multiplier = math.max(0, (100 - card.ability.extra.percent) / 100)
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips * reduction_multiplier)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}