-- Coded by Okronix
SMODS.Joker {
    key = 'unfamiliar_joker',
    rarity = 1,
    atlas = 'ABNJokerSheet8',
    pos = { x = 1, y = 1 },
    cost = 4,
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
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local v = context.other_card

            if SMODS.has_no_rank(v) and v.config and v.config.center and v.config.center.mod then
                return {
                    chips = v:get_chip_bonus(),
                    message_card = v
                }
            end
        end
    end,

    in_pool = function(self, args)
        for _, v in ipairs(G.playing_cards or {}) do
            if SMODS.has_no_rank(v) and v.config and v.config.center and v.config.center.mod then
                return true
            end
        end
        return false
    end,

    abn_artist_credits = {
        artist = "F.L.U.X.",
    },
}