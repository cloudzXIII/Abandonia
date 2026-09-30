-- Coded by Okronix
SMODS.Joker {
    key = 'red_shift',
    rarity = 2,
    atlas = 'ABNJokerSheet15',
    pos = { x = 0, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = { active = true }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            if context.scoring_name == "High Card" then return end

            if G.GAME.current_round.hands_played == 0 then
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if ABN.is_modded_suit(scoring_card) and ABN.is_dark(scoring_card) then
                        card.ability.extra.active = false
                    end
                end
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    local eval = function() return card.ability.extra.active and G.GAME.current_round.hands_played == 1 and not G.RESET_JIGGLES end
                    juice_card_until(card, eval, true)
                    return true
                end
            }))

            if G.GAME.current_round.hands_played == 1 and card.ability.extra.active then
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if not ABN.is_modded_suit(scoring_card) and ABN.is_dark(scoring_card) then
                        card.ability.extra.active = false
                    end
                end

                for _, scored_card in ipairs(context.scoring_hand) do
                    scored_card:set_seal("abn_brown")
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            scored_card:set_edition("e_abn_pearlescent")
                            scored_card:juice_up(0.3, 0.3)
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end

                card.ability.extra.active = true
            end
        end
    end,

    abn_artist_credits = {
        artist = "Toyrapple",
    },
}