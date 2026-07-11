SMODS.Joker {
    key = 'joker_note',
    rarity = 2,
    atlas = 'ABNJokerSheet13',
    pos = { x = 5, y = 2 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { mult_mod = 5, chips_mod = 20, chips = 0, mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_mod, card.ability.extra.chips_mod, card.ability.extra.mult, card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.other_card:is_face() then
            if context.other_card.seal then
                if ABN.is_even(context.other_card) then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "mult",
                        scalar_value = "mult_mod",
                        operation = '+',
                        message_key = "a_mult",
                        message_colour = G.C.RED
                    })
                else
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "chips",
                        scalar_value = "chips_mod",
                        operation = '+',
                        message_key = "a_chips",
                        message_colour = G.C.CHIPS
                    })
                end
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        for i, playing_card in ipairs(G.playing_cards or {}) do
            if (not playing_card:is_face()) and playing_card.seal then
                return true
            end
        end
        return false
    end,



    abn_artist_credits = {
        artist = "Sustato",
    },
}
