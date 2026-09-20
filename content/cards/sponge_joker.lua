-- Coded by Okronix
SMODS.Joker {
    key = 'sponge_joker',
    rarity = 1,
    atlas = 'ABNJokerSheet26',
    pos = { x = 6, y = 4 },
    cost = 4,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { perma_mult = 6, perma_chips = 8 }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
        info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
        return {
            vars = {
                card.ability.extra.perma_mult,
                card.ability.extra.perma_chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, "m_abn_bubble") then
                if ABN.is_light(context.other_card) then
                    context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0)
                        + card.ability.extra.perma_mult
                    return {
                        message = localize("k_upgrade_ex"),
                        colour = G.C.MULT
                    }
                elseif ABN.is_dark(context.other_card) then
                    context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0)
                        + card.ability.extra.perma_chips
                    return {
                        message = localize("k_upgrade_ex"),
                        colour = G.C.CHIPS
                    }
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Okronix",
    },
}