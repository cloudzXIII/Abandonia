-- Coded by Okronix
SMODS.Joker {
    key = 'losers_dice',
    rarity = 1,
    atlas = 'ABNJokerSheet22',
    pos = { x = 2, y = 5 },
    cost = 2,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { mult = 10 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (card.ability.extra.mult * count_common_jokers()) or 0,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
        context.other_card:get_id() == 2 then
            return {
                mult = card.ability.extra.mult * count_common_jokers()
            }
        end
    end,
    abn_artist_credits = {
        artist = "Omicra",
    },
}

function count_common_jokers()
    local ret = 0

    if G.jokers and G.jokers.cards then
        for _, joker in ipairs(G.jokers.cards) do
            if joker.config.center.rarity == 1 then
                ret = ret + 1
            end
        end
    end

    return ret
end