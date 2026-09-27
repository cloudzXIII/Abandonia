-- Coded by Okronix
SMODS.Joker {
    key = 'overbreach_joker',
    rarity = 3,
    atlas = 'ABNOverbreachJoker',
    pixel_size = { w = 99, h = 151 },
    display_size = { w = 99 * 0.7, h = 151 * 0.7 },
    pos = { x = 0, y = 0 },
    cost = 8,
    discovered = false,
    blueprint_compat = false,

    config = {
        extra = {}
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == "unscored" and not context.blueprint then
            local hand_chips = G.GAME.hands[context.scoring_name].chips or 0
            local hand_mult = G.GAME.hands[context.scoring_name].mult or 0

            return {
                mult = hand_mult,
                chips = hand_chips
            }
        end
    end,

    abn_artist_credits = {
        artist = "Null",
    },
}