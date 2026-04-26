SMODS.Joker {
    key = 'interminable_joker',
    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 1, y = 16 },
    cost = 4,
    discovered = false,
    blueprint_compat = true,
    config={
        extra={
            x_mult=3,
        },
    },
    calculate = function(self, card, context)
        if context.other_joker and #G.jokers.cards >=6 then
            return {
                x_mult=card.ability.extra.x_mult
            }
        end
    end,
    in_pool = function ()
        if #G.jokers.cards >=6 then return true end
        return false
    end,

    abn_artist_credits = {
        artist = "TanTinch",
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                card.ability.extra.x_mult,
            },
        }
    end,
}