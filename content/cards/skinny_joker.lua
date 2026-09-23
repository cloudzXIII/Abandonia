-- Coded by Okronix
SMODS.Joker {
    key = 'skinny_joker',
    rarity = 1,
    atlas = 'ABNJokerSheet15',
    pos = { x = 4, y = 3 },
    cost = 4,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { chips = 0, mult = 0, chips_gain = 10, mult_gain = 3 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.chips_gain,
                card.ability.extra.mult_gain,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end

        if context.setting_blind and not context.blueprint then
            local current_consumables = G.consumeables and #G.consumeables.cards or 0

            if current_consumables == 0 then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return { message = localize("k_upgrade_ex"), colour = G.C.MULT }
            end
        end
    end,

    abn_artist_credits = {
        artist = "IPreferCheddar",
    },
}