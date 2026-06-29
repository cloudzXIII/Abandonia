SMODS.Joker {
    key = 'advertisement_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet2',
    pos = { x = 7, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    unlocked = true,
    config = { extra = { x_mult = 1, chips = 0, x_mult_gain = 0.25, chips_gain = 10 } },


    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.chips, card.ability.extra.x_mult_gain, card.ability.extra.chips_gain } }
    end,

    in_pool = function(self)
        if not (G.GAME and G.GAME.hands) then return false end

        local solid_state_card_used = G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.solid_state and
            G.GAME.consumeable_usage_total.solid_state > 0

        local program_card_used = G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.program_pack and
            G.GAME.consumeable_usage_total.program_pack > 0

        return solid_state_card_used or program_card_used
    end,

    calculate = function(self, card, context)
        -- If using a solid state card
        if context.using_consumeable and context.consumeable.ability.set == "solid_state" and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "x_mult",
                scalar_value = "x_mult_gain",
                operation = '+',
                message_key = 'a_x_mult',
            })
        end

        if context.using_consumeable and context.consumeable.ability.set == "program_pack" and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_value = "chips_gain",
                operation = '+',
                message_key = 'a_chips',
            })
        end

        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult,
                chips = card.ability.extra.chips
            }
        end
    end,

    abn_artist_credits = {
        artist = "Vlambambo",
    },
}
