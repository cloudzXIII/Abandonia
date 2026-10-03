-- Coded by Okronix
SMODS.Joker {
    key = 'midnight_hour',
    rarity = 2,
    atlas = 'ABNJokerSheet27',
    pos = { x = 9, y = 2 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { mult = 10, chips = 35, asc = 0.25 }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_darkner
        info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_opaque
	    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
                card.ability.extra.asc
            }
        }
    end,

    calculate = function(self, card, context)        
        if context.individual and context.cardarea == G.play then
            local scored_card = context.other_card

            if ABN.is_modded_suit(scored_card) and ABN.is_dark(scored_card) then
                local ret = {}

                if card.edition and card.edition.key == 'e_abn_opaque' then
                    ret.mult = card.ability.extra.mult
                    ret.chips = card.ability.extra.chips
                end
                if SMODS.has_enhancement(scored_card, "m_abn_darkner") then
                    ret.asc = card.ability.extra.asc
                end

                return ret
            end
        end
    end,

    abn_artist_credits = {
        artist = "Aphi.s.soos",
    },
}