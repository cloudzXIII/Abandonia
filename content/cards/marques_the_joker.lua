SMODS.Joker {
    key = 'marques_the_joker',
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.chips } }
    end,

    rarity = 2,
    atlas = 'AbandoniaJokers',
    pos = { x = 5, y = 11 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,

    config = { extra = { x_mult=1, chips = 20 } },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card,"m_gold") then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus=context.other_card.ability.perma_bonus+card.ability.extra.chips
                context.other_card.ability.perma_x_mult=context.other_card.ability.perma_x_mult or 1
                context.other_card.ability.perma_x_mult=context.other_card.ability.perma_x_mult+card.ability.extra.x_mult
            else
                context.other_card:set_debuff(true)
            end
        end
    end,
    in_pool = function ()
        local gold_card_count = 0
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card,"m_gold") then
                gold_card_count=gold_card_count+1
                if gold_card_count >=3 then break end
            end
        end
        if gold_card_count >=3 then return true end
        return false
    end,

    abn_artist_credits = {
        artist = "StrokedFraMe",
    },
}