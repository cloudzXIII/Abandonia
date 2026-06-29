SMODS.Joker {
    key = "anxious_gimbo",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    atlas = 'ABNJokerSheet15',
    pos = { x = 4, y = 5 },
    abn_coder = "LasagnaFelidae",
    config = { extra = { xchips = 1.25, mult = 11 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local id = context.other_card:get_id()
            local value = context.other_card.base.value
            if id == 2 or id == 3 or id == 5 or id == 7 or value == "abn_11" or value == "abn_14" then
                return {
                    xchips = card.ability.extra.xchips,
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "MarioFan597 & Bunnet",
    },
}