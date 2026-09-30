-- Coded by Okronix
SMODS.Joker {
    key = 'kojer',
    rarity = 1,
    atlas = 'ABNJokerSheet26',
    pos = { x = 9, y = 6 },
    cost = 6,
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
        if context.joker_main then
            local new_hand_chips = math.ceil(hand_chips / #context.scoring_hand) * #context.scoring_hand
            local new_mult = math.ceil(mult / #context.scoring_hand) * #context.scoring_hand

            return {
                abn_set_chips = new_hand_chips,
                abn_set_mult = new_mult,
            }
        end
    end,

    abn_artist_credits = {
        artist = "Okronix & Heart of Crow",
    },
}