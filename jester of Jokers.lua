SMODS.Joker{
    key = "jesterofjokers",
    name = "Jester of Jokers",

    atlas = "ABNJokerSheet27",
    pos = { x = 8, y = 4 },
    cost = 10,
    rarity = 3,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = {
            asc = 0,
            asc_gain = 0.25,
            amperage = 1,
            amperage_gain = 0.4
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.asc_gain,
                card.ability.extra.amperage,
                card.ability.extra.amperage_gain
            }
        }
    end,

    calculate = function(self, card, context)
        if context.buying_card
            and context.card
            and context.card.config.center.set == "Joker"
            and not context.card.config.center.mod then

            card.ability.extra.asc = card.ability.extra.asc + card.ability.extra.asc_gain
        end

        if context.joker_main then
            local has_joker = false

            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.key == "j_joker" then
                    has_joker = true
                    break
                end
            end

            if has_joker then
                local suits = {}

                for _, playing_card in ipairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Hearts", true) then suits.Hearts = true end
                    if playing_card:is_suit("Diamonds", true) then suits.Diamonds = true end
                    if playing_card:is_suit("Clubs", true) then suits.Clubs = true end
                    if playing_card:is_suit("Spades", true) then suits.Spades = true end
                end

                local suit_count = 0

                for _, _ in pairs(suits) do
                    suit_count = suit_count + 1
                end

                local amperage = card.ability.extra.amperage
                    + card.ability.extra.amperage_gain * suit_count

                return {
                    xamp = amperage,
                    colour = G.C.ABN_AMPERAGE
                }
            end
        end

        if context.other_joker
            and context.other_joker.config.center.key == "j_joker" then
            return {
                asc = card.ability.extra.asc
            }
        end
    end,

    abn_artist_credits = {
        artist = "Weasel.922"
    }
}