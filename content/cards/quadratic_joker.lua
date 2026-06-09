SMODS.Joker {
    key = 'quadratic_joker',
    rarity = 3, 
    atlas = 'ABNJokerSheet13',
    pos = { x = 8, y = 2 },   
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            stop = false
        }
    },
	
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
		info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent
		info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
		info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chromatic
    end,

    calculate = function(self, card, context)
        -- editions
        if context.before and not context.blueprint then
            if context.scoring_name == "Straight" then
                local unique_suits = {}
                for _, scoring_card in ipairs(context.scoring_hand) do
                    local suit = scoring_card.base.suit
                    unique_suits[suit] = true
                end
                
                local suit_count = 0
                for _ in pairs(unique_suits) do
                    suit_count = suit_count + 1
                end
                
                if suit_count == 4 then
                    local sorted_hand = {}
                    for i, scoring_card in ipairs(context.scoring_hand) do
                        sorted_hand[i] = scoring_card
                    end
                    
                    table.sort(sorted_hand, function(a, b)
                        return a.base.id < b.base.id
                    end)
                    
                    local target_editions = {
                        "abn_gloss",
                        "abn_iridescent",
                        "abn_pearlescent",
                        "abn_chromatic"
                    }
                    
                    for i = 1, math.min(#sorted_hand, #target_editions) do
                        local scoring_card = sorted_hand[i]
                        local edition_key = target_editions[i]
                        
                        scoring_card:set_edition({ [edition_key] = true }, true)
                    end
                end
            end
        end

        -- score cards
        if not card.ability.extra.stop and context.individual and context.cardarea == G.play then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                card.ability.extra.stop = true
                
                local scoring_ranks = {}
                local scoring_suits = {}
                for _, s_card in ipairs(context.scoring_hand) do
                    scoring_ranks[s_card.base.id] = true
                    scoring_suits[s_card.base.suit] = true
                end

                for i = 1, #G.hand.cards do
                    local hand_card = G.hand.cards[i]
                    
                    if scoring_ranks[hand_card.base.id] or scoring_suits[hand_card.base.suit] then
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