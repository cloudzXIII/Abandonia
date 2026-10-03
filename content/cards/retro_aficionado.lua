-- Coded by Okronix
SMODS.Joker {
    key = 'retro_aficionado',
    rarity = 2,
    atlas = 'ABNJokerSheet27',
    pos = { x = 7, y = 1 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { xchips = 1, xchips_gain = 0.25 }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_throwback
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.xchips_gain,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            if next(SMODS.find_card("j_throwback")) then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xchips",
                    scalar_table = "xchips_gain",
                    operation = '+',
                    message_colour = G.C.CHIPS
                })
            end
        end

        if context.joker_main and card.ability.extra.xchips > 1 then
            return {
                xchips = card.ability.extra.xchips
            }
        end
    end,

    abn_artist_credits = {
        artist = "Gamer9Ts",
    },
}