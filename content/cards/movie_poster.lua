-- Coded by Okronix
SMODS.Joker {
    key = 'movie_poster',
    rarity = 2,
    atlas = 'ABNJokerSheet26',
    pos = { x = 9, y = 3 },
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

    update = function(self, card, dt)
        if G.STATE == G.STATES.SELECTING_HAND then
            local steel_count = 0
            for _, v in ipairs(G.hand.cards) do
                if v.config.center == G.P_CENTERS.m_steel then
                    steel_count = steel_count + 1
                end
            end

            local old_mod = card.ability.h_size_mod or 0
            if steel_count ~= old_mod then
                G.hand:change_size(steel_count - old_mod)
                card.ability.h_size_mod = steel_count
            end
        end
    end,

    remove = function(self, card, from_debuff)
        if card.ability.h_size_mod and card.ability.h_size_mod > 0 then
            G.hand_size = G.hand_size - card.ability.h_size_mod
            card.ability.h_size_mod = 0
        end
    end,

    abn_artist_credits = {
        artist = "Vlambambo",
    },

    enhancement_gate = "m_steel"
}