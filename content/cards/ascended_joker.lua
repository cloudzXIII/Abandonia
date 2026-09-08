SMODS.Joker {
    key = 'ascended_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet19',
    pos = { x = 0, y = 5 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { asc = 4, asc_j = 0.25 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS["j_joker"]
        return { vars = { card.ability.extra.asc, card.ability.extra.asc_j } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local ret = {}
            ret.asc = card.ability.extra.asc
            return ret
        end
        if context.individual and context.cardarea == G.play then
            local ret = {}
            if next(SMODS.find_card("j_joker")) then
                ret.asc = card.ability.extra.asc_j
            end
            ret.card = card
            return ret
        end
    end,


    abn_artist_credits = {
        artist = "The Lovely Grommy",
    },
}
