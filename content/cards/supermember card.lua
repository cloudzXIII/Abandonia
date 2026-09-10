-- Coded by Okronix (my first joker in this mod lol)
SMODS.Joker {
    key = 'supermember_card',
    rarity = 2,
    atlas = 'ABNJokerSheet18',
    pos = { x = 9, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = {}
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,

    calculate = function(self, card, context)
        if context.other_joker and context.other_joker ~= card then
            local sell_cost = context.other_joker.sell_cost

            if sell_cost > 0 then
                return {
                    mult = sell_cost,
                    card = card
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Shepcicle",
    },
}