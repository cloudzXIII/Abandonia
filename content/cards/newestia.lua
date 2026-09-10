SMODS.Joker {
    key = 'newestia',
    rarity = "abn_SuperRare",
    atlas = 'ABNJokerSheet19',
    pos = { x = 1, y = 2 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { xchips = 1.3, xmult = 1.2, xasc = 1.1, asc_abn = 2 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS["j_abn_abandonia"]
        return { vars = { card.ability.extra.xchips, card.ability.extra.xmult, card.ability.extra.xasc, card.ability.extra.asc_abn } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local ret = {}
            ret.x_chips = card.ability.extra.xchips
            ret.x_mult = card.ability.extra.xmult
            if next(SMODS.find_card("j_abn_abandonia")) then
                ret.plus_asc = card.ability.extra.asc_abn
            end
            ret.x_asc = card.ability.extra.xasc
            ret.card = card
            return ret
        end
    end,


    abn_artist_credits = {
        artist = "comykel",
    },
}
