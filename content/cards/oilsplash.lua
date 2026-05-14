SMODS.Joker {
    key = 'oilsplash',
    rarity = 2,
    atlas = 'ABNJokerSheet9',
    pos = { x = 9, y = 1 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_petroleum
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local converted_any = false
            
            -- Iterate through all played cards
            for i = 1, #context.full_hand do
                local is_scoring = false
                local target_card = context.full_hand[i]
                
                -- Check if this specific card is in the scoring hand
                for j = 1, #context.scoring_hand do
                    if target_card == context.scoring_hand[j] then
                        is_scoring = true
                        break
                    end
                end

                -- If the card is NOT scoring and isn't already Petroleum
                if not is_scoring and target_card.config.center ~= G.P_CENTERS.m_abn_petroleum then
                    converted_any = true
                    
                    -- Turn into petroleum
                    target_card:set_ability(G.P_CENTERS.m_abn_petroleum)
                    
                    -- Visual feedback on the card being changed
                    target_card:juice_up()
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Inky",
    },
}