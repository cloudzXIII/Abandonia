-- Coded by Okronix
SMODS.Joker {
    key = 'sticky_fingers',
    rarity = 1,
    atlas = 'ABNJokerSheet22',
    pos = { x = 0, y = 4 },
    cost = 5,
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
        
    end,
    abn_artist_credits = {
        artist = "Omicra",
    },
}