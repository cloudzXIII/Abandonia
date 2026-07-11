SMODS.Joker {
    key = "ridiculous_joker",
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    atlas = 'ABNJokerSheet10',
    pos = { x = 5, y = 0 },
    abn_coder = "LasagnaFelidae",
    config = { extra = { chips = 0, mult = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local even_play = {}
            local even_held = {}
            local total = 0
            local ret = {}
            for _, c in ipairs(context.full_hand) do
                if ABN.is_even(c) then
                    even_play[#even_play + 1] = c
                end
                total = total + c.base.nominal
            end

            for _, c in ipairs(G.hand.cards) do
                if ABN.is_even(c) then
                    even_held[#even_held + 1] = c
                end
                total = total + c.base.nominal
            end

            if #even_play == #context.full_hand and #even_held == 0 then
                ret.message = localize("k_upgrade_ex")
                card.ability.extra.chips = card.ability.extra.chips + total
            end
            if #even_play == 0 and #even_held == #G.hand.cards then
                ret.message = localize("k_upgrade_ex")
                card.ability.extra.mult = card.ability.extra.mult + total
            end


            ret.chips = card.ability.extra.chips
            ret.mult = card.ability.extra.mult
            return ret
        end
    end,
    abn_artist_credits = {
        artist = "D.J.",
    },
}
