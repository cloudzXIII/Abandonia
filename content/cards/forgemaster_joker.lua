SMODS.Joker {
    key = 'forgemaster_joker',
    rarity = 2,
    atlas = 'AbandoniaJokers',
    pos = { x = 3, y = 32 },
    cost = 6,
    discovered = false,
    blueprint_compat = true, 
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_hot_iron
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        -- Trigger before scoring starts
        if context.cardarea == G.jokers and context.before then
            local scoringSet = {}
            for _, played_card in ipairs(context.scoring_hand or {}) do
                scoringSet[played_card] = true
            end

            -- Loop through all played cards and find the ones NOT in the scoring set
            for _, thisCard in ipairs(context.full_hand or {}) do
                if not scoringSet[thisCard] then
                    thisCard:set_ability(G.P_CENTERS.m_abn_hot_iron, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            thisCard:juice_up()
                            return true
                        end,
                    }))
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "IPreferCheddar",
    },
}