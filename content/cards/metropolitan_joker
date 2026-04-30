-- Metropolitan Joker
-- Coded by J8-Bit
-- X0.1 Mult for each Rankless card in your deck


SMODS.Joker {
    key = 'metropolitan_joker',

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        extra = {
            xmult = 0.1
        },
    },
    loc_vars = function(self, info_queue, card)
        local rankless_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_no_rank(playing_card) then rankless_tally = rankless_tally + 1 end
            end
        end
        return {
            vars = {
                card.ability.extra.xmult, localize("k_abn_rankless"), 1 + card.ability.extra.xmult * rankless_tally
            }
        }
    end,
    rarity = 2,
    cost = 6,
    atlas = 'ABNJokerSheet2',
    pos = { x = 4, y = 0 },
    discovered = false,
    calculate = function(self, card, context)
        -- add xmult
        if context.joker_main then
            local rankless_tally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if SMODS.has_no_rank(playing_card) then rankless_tally = rankless_tally + 1 end
                end
            end
            return {
                x_mult = 1 + card.ability.extra.xmult * rankless_tally
            }
        end
    end,
    in_pool = function()
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_no_rank(playing_card) then
                return false
            end
        end
        return false
    end,
    abn_artist_credits = {
        artist = "Tisisrealnow"
    },
}
