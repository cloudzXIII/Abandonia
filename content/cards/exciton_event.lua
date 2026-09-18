SMODS.Joker {
    key = "exciton_event",
    name = "Exciton Event",
    rarity = 3,
    cost = 6,
    atlas = "ABNJokerSheet26",
    pos = {x = 7, y = 2},

    config = {
        extra = {}
    },

    loc_vars = function(self, info_queue, card)
        card.ability.extra = card.ability.extra or {}

        return {
            vars = {
                card.ability.extra.hand or ""
            }
        }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Planet" then
            local hands = {}

            for hand, data in pairs(G.GAME.hands) do
                if data.visible then
                    hands[#hands + 1] = hand
                end
            end

            if #hands > 0 then
                local hand = pseudorandom_element(hands, pseudoseed("exciton_event"))

                card.ability.extra = card.ability.extra or {}
                card.ability.extra.hand = hand

                level_up_hand(card, hand, nil, 2)
            end

            if pseudorandom("exciton_destroy") < 1 / 6 then
                local deck_cards = {}

                for _, c in ipairs(G.deck.cards) do
                    deck_cards[#deck_cards + 1] = c
                end

                for i = 1, math.floor(#deck_cards * 0.75) do
                    if #deck_cards > 0 then
                        local index = pseudorandom("exciton_destroy_card", 1, #deck_cards)
                        local c = table.remove(deck_cards, index)
                        c:start_dissolve()
                    end
                end
            end
        end
    end
}