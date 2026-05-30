SMODS.Joker {
    key = 'jimbos_love_letter',
    rarity = 2, 
    atlas = 'ABNJokerSheet7',
    pos = { x = 2, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { stop = false, triggered = false } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        
        -- Hearts held in hand count in scoring (Occurs during individual card scoring)
        if not card.ability.extra.stop and context.individual and context.cardarea == G.play then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                card.ability.extra.stop = true
                for i = 1, #G.hand.cards do
                    local hand_card = G.hand.cards[i]
                    if hand_card:is_suit('Hearts') then
                        SMODS.calculate_effect(hand_card)
                        SMODS.score_card(hand_card, context)
                    end
                end
                card.ability.extra.stop = false
            end
        end

        -- Upgrade logic
        if context.before and not card.ability.extra.triggered then
            -- Check if the played hand is a flush
            if context.scoring_name == "Flush" or context.scoring_name == "Straight Flush" or context.scoring_name == "Royal Flush" or context.scoring_name == "Flush Five" or context.scoring_name == "Flush House" then
                local is_all_hearts = true
                
                for i = 1, #context.scoring_hand do
                    local scoring_card = context.scoring_hand[i]
                    local is_wild = scoring_card.config.center == G.P_CENTERS.m_wild
                    
                    if scoring_card.base.suit ~= 'Hearts' or is_wild then
                        is_all_hearts = false
                        break
                    end
                end

                -- If it's all hearts
                if is_all_hearts then
                    card.ability.extra.triggered = true
                    
                    for i = 1, #context.scoring_hand do
                        local scoring_card = context.scoring_hand[i]
                        local card_rank = scoring_card.base.value
                        
                        if G.GAME.abn_rank_upgrades and G.GAME.abn_rank_upgrades[card_rank] then
                            ABN.level_up_rank(card, card_rank, 1)
                        end
                    end

                    return {
                        card = card,
                        message = localize('k_level_up_ex'),
                    }
                end
            end
        end
        
        -- Reset
        if context.end_of_round and not context.repetition and not context.blueprint then
            card.ability.extra.triggered = false
        end

    end,

    abn_artist_credits = {
        artist = "Littleroot",
    },
}