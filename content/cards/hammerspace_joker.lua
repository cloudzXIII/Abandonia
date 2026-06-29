SMODS.Joker {
    key = 'hammerspace_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet5',
    pos = { x = 7, y = 2 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { x_mult = 1, mult = 0, x_chips = 1, chips = 0, x_mult_gain = 0.3, mult_gain = 10, x_chips_gain = 0.3, chips_gain = 20 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.mult, card.ability.extra.x_chips, card.ability.extra.chips, card.ability.extra.x_mult_gain, card.ability.extra.mult_gain, card.ability.extra.x_chips_gain, card.ability.extra.chips_gain } }
    end,

    add_to_deck = function(self, card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + 2
    end,

    remove_from_deck = function(self, card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - 2
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.blind.boss then
            local upgraded = false
            local sets_found = {} -- Track which sets we've already processed this round

            for _, v in pairs(G.consumeables.cards) do
                local set = v.config.center.set

                -- Sigils -> x_mult
                if set == "sigils" and not sets_found["sigils"] then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "x_mult",
                        scalar_value = "x_mult_gain",
                        operation = '+',
                        no_message = true
                    })
                    sets_found["sigils"] = true
                    upgraded = true

                    -- Astro Cards -> Mult
                elseif set == "astro_cards" and not sets_found["astro_cards"] then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "mult",
                        scalar_value = "mult_gain",
                        operation = '+',
                        no_message = true
                    })
                    sets_found["astro_cards"] = true
                    upgraded = true

                    -- Tarot -> Chips
                elseif set == "Tarot" and not sets_found["Tarot"] then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "chips",
                        scalar_value = "chips_gain",
                        operation = '+',
                        no_message = true
                    })
                    sets_found["Tarot"] = true
                    upgraded = true

                    -- Spectral -> x_chips
                elseif set == "Spectral" and not sets_found["Spectral"] then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "x_chips",
                        scalar_value = "x_chips_gain",
                        operation = '+',
                        no_message = true
                    })
                    sets_found["Spectral"] = true
                    upgraded = true
                end
            end

            if upgraded then
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.Mult,
                    card = card
                }
            end
        end

        -- Scoring Logic
        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult,
                mult = card.ability.extra.mult,
                x_chips = card.ability.extra.x_chips,
                chips = card.ability.extra.chips,
            }
        end
    end,

    abn_artist_credits = {
        artist = "Null",
    },
}
