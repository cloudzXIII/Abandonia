-- Coded by Okronix
SMODS.Joker {
    key = 'nasreddin',
    rarity = 4,
    atlas = 'AbandoniaLegendary2',
    pos = { x = 4, y = 2 },
    soul_pos = { x = 5, y = 2 },
    cost = 20,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { emult = 1.2, echips = 1.2, asc = 0.05 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.emult,
                card.ability.extra.echips,
                card.ability.extra.asc
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_lucky") then
                local etype = pseudorandom_element({"emult", "echips", "asc"}, pseudoseed("nasreddin"))
                local ret = {}
                ret[etype] = card.ability.extra[etype]
                return ret
            end
        end
    end,

    abn_artist_credits = {
        artist = "Mini Bit",
    },
}