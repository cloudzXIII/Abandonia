-- Coded by Okronix
SMODS.Joker {
    key = 'blue_shift',
    rarity = 2,
    atlas = 'ABNJokerSheet26',
    pos = { x = 6, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = { active = true }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_abn_red_shift
        info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
        info_queue[#info_queue + 1] = G.P_CENTERS.abn_violet_seal
        return {
            vars = {}
        }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            if context.scoring_name == "High Card" then return end

            -- first hand contains only vanilla light suits
            if G.GAME.current_round.hands_played == 0 then
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if ABN.is_modded_suit(scoring_card) or ABN.is_light(scoring_card) then
                        card.ability.extra.active = false
                    end
                end

                if next(SMODS.find_card("j_abn_red_shift")) and not ABN.is_modded_hand(context.scoring_name) then
                    SMODS.smart_level_up_hand(card, context.scoring_name, nil, 1)
                end
            end

            -- jiggle if active
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    local eval = function() return card.ability.extra.active and G.GAME.current_round.hands_played == 1 and not G.RESET_JIGGLES end
                    juice_card_until(card, eval, true)
                    return true
                end
            }))

            -- second hand contains only modded light suits
            if G.GAME.current_round.hands_played == 1 and card.ability.extra.active then
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if not ABN.is_modded_suit(scoring_card) or ABN.is_light(scoring_card) then
                        card.ability.extra.active = false
                    end
                end

                if card.ability.extra.active then
                    for _, scored_card in ipairs(context.scoring_hand) do
                        scored_card:set_seal("abn_violet")
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.2,
                            func = function()
                                scored_card:set_edition("e_abn_pearlescent")
                                scored_card:juice_up(0.3, 0.3)
                                return true
                            end
                        }))
                    end

                    if next(SMODS.find_card("j_abn_red_shift")) then
                        for _, played_card in ipairs(context.full_hand) do
                            if not played_card.debuff then
                                local card_rank = played_card.base.value
                                if G.GAME.abn_rank_upgrades[card_rank] then
                                    ABN.level_up_rank(card, card_rank, 1)
                                    return {
                                        message = localize('k_level_up_ex'),
                                        card = played_card
                                    }
                                end
                            end
                        end
                    end
                end
            end
        end

        if context.setting_blind then
            card.ability.extra.active = true
        end
    end,

    abn_artist_credits = {
        artist = "Toyrapple & Okronix",
    },
}