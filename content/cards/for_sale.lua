SMODS.Joker {
    key = 'for_sale_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet11',
    pos = { x = 2, y = 4 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { chips = 0, } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,


    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local sell_cost = 0
            for _, j in ipairs(G.jokers.cards) do
                sell_cost = sell_cost + j.sell_cost
            end
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial + sell_cost
                end,
                no_message = true
            })
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { sell_cost } },
                colour = G.C.FILTER
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    abn_artist_credits = {
        artist = "Swizik",
    },
}
