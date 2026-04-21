SMODS.Joker {
    key = 'ancient_prophet',
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
    end,
    rarity = 2,
    atlas = 'AbandoniaJokers',
    pos = { x = 0, y = 2 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = 10, chips = 10, repetitions = 1 } },
    calculate = function(self, card, context)
        -- Remove debuff from debuffed cards before scoring
        if context.before and not context.blueprint then
            for _, playing_card in ipairs(context.scoring_hand) do
                if playing_card.debuff then
                    playing_card.debuff = false
                    playing_card.ancient_prophet_undebuffed = true
                end
            end
        end
        -- Retrigger debuffed and flipped cards
        if context.repetition and context.cardarea == G.play then
            if context.other_card.ancient_prophet_undebuffed or context.other_card.facing == 'back' then
                return { repetitions = card.ability.extra.repetitions, card = card }
            end
        end
        -- Debuffed and flipped cards give +10 mult and +10 chips when played
        if context.individual and context.cardarea == G.play then
            if context.other_card.ancient_prophet_undebuffed or context.other_card.facing == 'back' then
                return { mult = card.ability.extra.mult, chips = card.ability.extra.chips, card = card }
            end
        end
        -- Clean up tracking after scoring
        if context.after and not context.blueprint then
            for _, playing_card in ipairs(context.scoring_hand) do
                playing_card.ancient_prophet_undebuffed = nil
            end
        end
    end,
    in_pool = function(self, args)
        if not G.playing_cards then return false end
        for _, playing_card in ipairs(G.playing_cards) do
            if playing_card.debuff or playing_card.facing == 'back' then
                return true
            end
        end
        return false
    end,
    abn_artist_credits = { artist = "HyperReal63" },
}
