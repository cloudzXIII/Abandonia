-- Coded by Okronix
SMODS.Joker {
    key = 'all_star_cereal',
    rarity = 1,
    atlas = 'ABNJokerSheet26',
    pos = { x = 8, y = 5 },
    cost = 5,
    discovered = false,
    blueprint_compat = true,
    attributes = { "food" },

    config = {
        extra = { mult = 20 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local valid_scored, valid_full = true, false

            for _, c in ipairs(context.scoring_hand) do
                if not c:is_suit("abn_Star") then
                    valid_scored = false
                end
            end
            for _, c in ipairs(context.full_hand) do
                if c:is_suit("abn_Star") then
                    valid_full = true
                end
            end

            if not valid_full then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            elseif valid_scored then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "IIye",
    },
}