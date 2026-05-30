SMODS.Joker {
    key = 'flotsam_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet9',
    pos = { x = 4, y = 4 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { stop = false } },
    
    in_pool = function(self)
        -- Only available if played a Flush
        if G.GAME and G.GAME.hands and G.GAME.hands['Flush'] then
            return G.GAME.hands['Flush'].played > 0
        end
        return false
    end,

    calculate = function(self, card, context)
        local is_flush_hand = context.scoring_name == "Flush" or 
                              context.scoring_name == "Straight Flush" or 
                              context.scoring_name == "Royal Flush" or 
                              context.scoring_name == "Flush Five" or 
                              context.scoring_name == "Flush House"

        if not card.ability.extra.stop and is_flush_hand and context.individual and context.cardarea == G.play then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                card.ability.extra.stop = true
                
                -- Get the first suit
                local flush_suit = context.scoring_hand[1].base.suit
                
                for i = 1, #G.hand.cards do
                    local hand_card = G.hand.cards[i]
                    if hand_card and hand_card:is_suit(flush_suit) then
                        SMODS.calculate_effect(hand_card)
                        SMODS.score_card(hand_card, context)
                    end
                end
                
                card.ability.extra.stop = false
            end
        end
    end,

    abn_artist_credits = {
        artist = "Muddz",
    },
}