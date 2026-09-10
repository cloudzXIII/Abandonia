-- Coded by Okronix
SMODS.Joker {
    key = 'dagonet',
    rarity = 4,
    atlas = 'AbandoniaLegendary2',
    pos = { x = 6, y = 1 },
    soul_pos = { x = 7, y = 1 },
    cost = 20,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { asc = 0.5 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.asc
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, "m_steel") then
                local ret = {}
                ret.asc = card.ability.extra.asc
                return ret
            end
        end
    end,

    abn_artist_credits = {
        artist = "Mini Bit",
    },
}