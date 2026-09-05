-- Coded by Okronix
SMODS.Joker {
    key = 'galactic_night',
    rarity = 3,
    atlas = 'ABNJokerSheet21',
    pos = { x = 6, y = 2 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = {}
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {}
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local hand_level = G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].level or 1

            return {
                xmult = hand_level
            }
        end
    end,
    abn_artist_credits = {
        artist = "Super Thing",
    },
}