SMODS.Joker {
    key = "even_stephen",
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    atlas = 'ABNJokerSheet15',
    pos = { x = 1, y = 4 },
    abn_coder = "LasagnaFelidae",
    config = { extra = { mult = 8 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if ABN.is_even(context.other_card) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "The Majin00",
    },
}
