SMODS.Joker {
    key = 'identigram_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet9',
    pos = { x = 5, y = 2 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { x_mult_mod = 0.01, x_chips_mod = 0.1, x_mult = 1, x_chips = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult_mod, card.ability.extra.x_chips_mod, card.ability.extra.x_mult, card.ability.extra.x_chips, } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local current = context.other_card

            local has_different_edition = false

            for _, other in ipairs(context.scoring_hand) do
                if other ~= current then
                    if other.edition and current.edition and (current.edition.key ~= other.edition.key) then
                        has_different_edition = true
                        break
                    end
                end
            end

            if has_different_edition then
                if ABN.is_odd(context.other_card) then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "x_chips",
                        scalar_value = "x_chips_mod",
                        operation = '+',
                    })
                end
                if ABN.is_even(context.other_card) then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "x_mult",
                        scalar_value = "x_mult_mod",
                        operation = '+',
                    })
                end
            end
        end
        if context.joker_main then
            return {
                x_chips = card.ability.extra.x_chips,
                x_mult = card.ability.extra.x_mult,
            }
        end
    end,
    in_pool = function(self, args)
        local editions = {}

        for _, card in pairs(G.playing_cards or {}) do
            if card and card.edition and card.edition.key then
                editions[card.edition.key] = true
            end
        end

        local count = 0
        for _ in pairs(editions) do
            count = count + 1
            if count >= 2 then
                return true
            end
        end

        return false
    end,


    abn_artist_credits = {
        artist = "Technotoad64",
    },
}
