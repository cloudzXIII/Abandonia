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
            local rank = context.other_card.base.id
            if context.other_card.base.value == "abn_14" 
            or context.other_card.base.value == "abn_13"
            or context.other_card.base.value == "abn_12"
            or context.other_card.base.value == "abn_11"
            or context.other_card.base.value == "Ace" then 
                rank = context.other_card.base.nominal 
            end
            if rank <= 10 and rank >= 0 and rank % 2 == 1 then
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