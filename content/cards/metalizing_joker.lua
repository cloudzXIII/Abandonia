SMODS.Joker {
    key = 'metalizing_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet10',
    pos = { x = 5, y = 4},
    cost = 15,
    discovered = false,
    blueprint_compat = true,
    
    config = { 
        extra = { 
            hands_played = 0,
            hands_required = 6,
            asc_add = 0.50,
        } 
    },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands_played, card.ability.extra.hands_required, card.ability.extra.asc_add } }
    end,

    in_pool = function(self, args)
        local steel_count = 0
        if G and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center == G.P_CENTERS.m_steel then
                    steel_count = steel_count + 1
                end
            end
        end
        return steel_count >= 6
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-1)
    end,

    calculate = function(self, card, context)
        if context.before then
            local all_steel = true
            if context.scoring_name ~= "High Card" then
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card.config.center ~= G.P_CENTERS.m_steel then
                        all_steel = false
                        break
                    end
                end
            else
                all_steel = false
            end

            if all_steel then
                local scaled_asc = card.ability.extra.asc_add * #context.scoring_hand
                
                if #context.scoring_hand >= 6 then
                    card.ability.extra.hands_played = card.ability.extra.hands_played + 1
                end
                
                for _, scored_card in ipairs(context.scoring_hand) do
                    scored_card.ability.abn_perma_asc = (scored_card.ability.abn_perma_asc or 0) + scaled_asc
                end
                
                if card.ability.extra.hands_played >= card.ability.extra.hands_required then
                    G.hand.config.card_limit = G.hand.config.card_limit * 2
                    card:start_dissolve()
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Comykel",
    },
}