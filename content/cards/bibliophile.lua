-- Bibliophile (coded by cloudzXIII)
SMODS.Joker {
    key = 'bibliophile',
    rarity = 3,
    atlas = 'ABNJokerSheet9',
    pos = { x = 8, y = 5 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { x_mult = 1, mult = 0, x_chips = 1, chips = 0, x_mult_gain = 0.3, mult_gain = 10, x_chips_gain = 1, chips_gain = 20 } },

    loc_vars = function(self, info_queue, card)
        local cae = card.ability.extra
        return { vars = { cae.x_mult, cae.mult, cae.x_chips, cae.chips, cae.x_mult_gain, cae.mult_gain, cae.x_chips_gain, cae.chips_gain } }
    end,

    add_to_deck = function(self, card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + 2
    end,

    remove_from_deck = function(self, card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - 2
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint and context.beat_boss then
            local upgraded = false
            local sets_found = {}

            for _, consumeable in pairs(G.consumeables.cards) do
                local set = consumeable.ability.set

                if set == "lexica" and not sets_found["lexica"] then
                    card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain
                    sets_found["lexica"] = true
                    upgraded = true
                elseif set == "program_pack" and not sets_found["program_pack"] then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                    sets_found["program_pack"] = true
                    upgraded = true
                elseif set == "weather_report" and not sets_found["weather_report"] then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
                    sets_found["weather_report"] = true
                    upgraded = true
                elseif set == "calamity_cards" and not sets_found["calamity_cards"] then
                    card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.x_chips_gain
                    sets_found["calamity_cards"] = true
                    upgraded = true
                end
            end

            if upgraded then
                return {
                    message = localize('k_upgrade_ex'),
                }
            end
        end

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
        artist = "Gan",
    },
}
