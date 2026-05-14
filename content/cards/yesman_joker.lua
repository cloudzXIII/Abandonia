SMODS.Joker {
    key = 'yesman_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet7',
    pos = { x = 4, y = 5 },
    soul_pos = { x = 5, y = 5 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { stop = false, mult = 0, chips = 0, multadd = 5, chipsadd = 3 } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.multadd, card.ability.extra.chipsadd } }
    end,
    
    in_pool = function(self)
        if not G.playing_cards then return false end
        local edition_count = 0
        for _, card in ipairs(G.playing_cards) do
            if card and card.edition then
                edition_count = edition_count + 1
            end
            if edition_count >= 3 then return true end
        end
        return false
    end,

    calculate = function(self, card, context)
        -- Scaling from Played Cards
        if context.individual and context.cardarea == G.play then
            if context.other_card.edition then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
                
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.ATTENTION})
            end
        end
        
        -- Scaling from Other Jokers
        if context.other_joker and context.other_joker.edition then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
            
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.ATTENTION})
        end
        
        -- Manual trigger logic for Hand Cards
        if not card.ability.extra.stop and context.individual and context.cardarea == G.play then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                card.ability.extra.stop = true
                for i = 1, #G.hand.cards do
                    local hand_card = G.hand.cards[i]
                    if hand_card.edition then
                        SMODS.calculate_effect(hand_card)
                        SMODS.score_card(hand_card, context)
                    end
                end
                card.ability.extra.stop = false
            end
        end

        -- Final scoring
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
            }
        end
    end,

    abn_artist_credits = {
        artist = "Podder",
    },
}