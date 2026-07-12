SMODS.Joker {
    key = 'nicotine_joker',
    rarity = 1,
    atlas = 'ABNJokerSheet7',
    pos = { x = 4, y = 3 },
    cost = 3,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { chips_mod = 2, chips = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local ret = {}
            ret.chips = card.ability.extra.chips
            if SMODS.calculate_round_score() > G.GAME.blind.chips then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        SMODS.calculate_effect({
                            message = localize("k_abn_doubled_ex"),
                            colour = G.C.BLUE,
                        }, card)
                        return true
                    end
                }))
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "chips",
                    scalar_value = "chips_mod",
                    operation = 'X',
                })
            end
            return ret
        end
    end,


    abn_artist_credits = {
        artist = "Littleroot",
    },
}
