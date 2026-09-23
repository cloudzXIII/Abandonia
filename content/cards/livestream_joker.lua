-- Coded by Okronix
SMODS.Joker {
    key = 'livestream_joker',
    rarity = 1,
    atlas = 'ABNJokerSheet15',
    pos = { x = 5, y = 3 },
    cost = 4,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = { chips_mod = 4 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.blueprint then
            local v = context.other_card

            if ABN.is_modded_rank(v) then
                return {
                    chips = v.base.nominal * card.ability.extra.chips_mod,
                    message_card = v
                }
            end
        end
    end,

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if ABN.is_modded_rank(playing_card) then
                return true
            end
        end
        return false
    end,

    abn_artist_credits = {
        artist = "IPreferCheddar",
    },
}