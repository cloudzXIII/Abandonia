SMODS.Joker {
    key = 'id_staff',
    rarity = 1,
    atlas = 'ABNJokerSheet8',
    pos = { x = 7, y = 4 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
	
	loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_hazard
    end,

    calculate = function(self, card, context)
        -- Trigger when cards are destroyed or removed from the deck
        if context.remove_playing_cards then
            local face_removed = false
            
            -- Check if any of the removed cards were face cards
            for _, removed_card in ipairs(context.removed) do
                if removed_card:is_face() then 
                    face_removed = true
                    break 
                end
            end

            if face_removed then
                -- Target the leftmost card in hand
                if G.hand and G.hand.cards[1] then
                    local target_card = G.hand.cards[1]
                    
                    -- Apply the Hazard Enhancement
                    target_card:set_ability(G.P_CENTERS.m_abn_hazard, nil, true)
                    target_card:juice_up()

                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Gud",
    },
}