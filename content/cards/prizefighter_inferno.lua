-- Coded by Okronix
SMODS.Joker {
    key = 'prizefighter_inferno',
    rarity = 3,
    atlas = 'ABNJokerSheet22',
    pos = { x = 7, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { xchips = 1, xmult = 1, xchips_gain = 0.25, xmult_gain = 0.5 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.xmult,
                card.ability.extra.xchips_gain,
                card.ability.extra.xmult_gain,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips,
                xmult = card.ability.extra.xmult
            }
        end

        if context.tag_triggered and context.tag_triggered.key and not context.blueprint then
            if string.find(context.tag_triggered.key, "hazard") then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "xmult_gain",
                    message_key = "a_xmult",
                    message_colour = G.C.MULT
                })
            else
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xchips",
                    scalar_value = "xchips_gain",
                    message_key = "a_xchips",
                    message_colour = G.C.CHIPS
                })
            end
        end
    end,
    abn_artist_credits = {
        artist = "Nice Cream",
    },
}