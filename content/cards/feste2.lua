-- Coded by Okronix
SMODS.Joker {
    key = 'feste2',
    rarity = 4,
    atlas = 'AbandoniaLegendary2',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    cost = 20,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { emult = 1.5, echips = 1.5 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.emult,
                card.ability.extra.echips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_wild") then
                local etype = pseudorandom_element({"emult", "echips"}, pseudoseed("feste2"))
                return {
                    [etype] = card.ability.extra[etype]
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Mini Bit",
    },
}