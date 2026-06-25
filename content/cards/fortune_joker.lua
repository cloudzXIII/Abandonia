SMODS.Joker {
    key = 'fortune_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet4',
    pos = { x = 6, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
    end,
    in_pool = function(self, args)
        if G.playing_cards then
            for _, v in ipairs(G.playing_cards) do
                -- Check if the card is an Ace and has the Lucky enhancement
                if v:get_id() == 14 and SMODS.has_enhancement(v, "m_lucky") then
                    return true
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        -- Level up (Unchanged, operates before scoring)
        if context.before and not context.blueprint then
            local has_lucky = false

            for i = 1, #context.scoring_hand do
                local scoring_card = context.scoring_hand[i]

                if SMODS.has_enhancement(scoring_card, "m_lucky") then
                    has_lucky = true
                    local card_rank = scoring_card.base.value

                    if G.GAME.abn_rank_upgrades and G.GAME.abn_rank_upgrades[card_rank] then
                        ABN.level_up_rank(scoring_card, card_rank, 1)
                    end
                end
            end

            if has_lucky then
                return {
                    card = card,
                    message = localize('k_level_up_ex'),
                }
            end
        end

        -- Retriggers
        if context.individual and context.cardarea == G.play then
            -- Cap the retriggers to 2
            if context.fortune_depth and context.fortune_depth >= 2 then return end

            local scoring_card = context.other_card

            if SMODS.has_enhancement(scoring_card, "m_lucky") then
                if scoring_card.lucky_trigger then
                    scoring_card.lucky_trigger = false

                    card:juice_up(0.7, 0.5)

                    SMODS.calculate_effect({ message = localize("k_again_ex") }, scoring_card)

                    -- Retrigger
                    SMODS.calculate_effect(scoring_card)
                    SMODS.score_card(scoring_card, {
                        cardarea = G.play,
                        full_hand = context.full_hand,
                        scoring_hand = context.scoring_hand,
                        scoring_name = context.scoring_name,
                        poker_hands = context.poker_hands,
                        fortune_depth = (context.fortune_depth or 0) + 1
                    })
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "HyperReal63",
    },
}
