-- Coded by Okronix
SMODS.Joker {
    key = 'joker_forge',
    rarity = 3,
    atlas = 'ABNJokerSheet21',
    pos = { x = 4, y = 6 },
    cost = 6,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = {}
    },

    loc_vars = function(self, info_queue, card)
        local all_sell_value = 0

        if G.jokers then
            for _, joker in ipairs(G.jokers.cards) do
                all_sell_value = all_sell_value + joker.sell_cost
            end
        end

        return {
            vars = { all_sell_value or 0 }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local all_sell_value = 0

            for _, joker in ipairs(G.jokers.cards) do
                all_sell_value = all_sell_value + joker.sell_cost
            end

            return {
                mult = all_sell_value,
                message_card = context.other_card,
            }
        end
    end,
    abn_artist_credits = {
        artist = "Okronix",
    },
}