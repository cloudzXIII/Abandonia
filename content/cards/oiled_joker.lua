-- Oiled Joker (reworked by cloudzXIII)
SMODS.Joker {
    key = 'oiled_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet7',
    pos = { x = 0, y = 3 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { dollars = 5, mult = 2, chips = 5, } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_petroleum
        return { vars = { card.ability.extra.dollars, card.ability.extra.mult, card.ability.extra.chips, } }
    end,

    calculate = function(self, card, context)
        if context.pre_discard and not context.blueprint then
            local has_petroleum = false
            -- full_hand contains all cards selected for the discard
            for i = 1, #context.full_hand do
                if SMODS.has_enhancement(context.full_hand[i], "m_abn_petroleum") then
                    has_petroleum = true
                    break
                end
            end

            if has_petroleum then
                -- Give the discard back
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
            end
        end

        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_abn_petroleum") then
                return {
                    dollars = card.ability.extra.dollars,
                    mult = card.ability.extra.mult,
                    chips = card.ability.extra.chips,
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },

    in_pool = function(self)
        for _, card in ipairs(G.playing_cards or {}) do
            if card and card.config and card.config.center then
                if SMODS.has_enhancement(card, "m_abn_petroleum") then
                    return true
                end
            end
        end
        return false
    end,
}
