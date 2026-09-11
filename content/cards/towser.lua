-- Coded by Okronix
SMODS.Joker {
    key = 'towser',
    rarity = 4,
    atlas = 'AbandoniaLegendary2',
    pos = { x = 4, y = 0 },
    soul_pos = { x = 5, y = 0 },
    cost = 20,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { echips = 1, echips_gain = 0.05 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.echips,
                card.ability.extra.echips_gain
            }
        }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Spectral" and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "echips",
                scalar_value = "echips_gain",
                operation = '+',
                message_colour = G.C.CHIPS,
            })
        end

        if context.joker_main then
            if card.ability.extra.echips > 1 then
                return {
                    echips = card.ability.extra.echips
                }
            end
        end

        if context.starting_shop and not context.blueprint then
            if G.shop_booster.cards[1] then
                G.shop_booster.cards[1]:set_ability(G.P_CENTERS.p_spectral_mega_1)
            end
        end
    end,

    abn_artist_credits = {
        artist = "Mini Bit",
    },
}