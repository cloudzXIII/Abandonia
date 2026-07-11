SMODS.Joker {
    key = "oddball_todd",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    config = { extra = { chips = 63 } },
    atlas = 'ABNJokerSheet15',
    pos = { x = 3, y = 4 },
    abn_coder = "LasagnaFelidae",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if ABN.is_odd(context.other_card) then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "The Majin00",
    },
}
