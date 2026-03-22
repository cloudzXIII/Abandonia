SMODS.Joker {
    key = 'vitamin_joker',
    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 1, y = 10 },
    cost = 4,
    discovered = false,
    blueprint_compat = true,
    eternal_compat=false,
    config={
    extra={
        chips=50,
        mult=5,
        chance=6,
    },
    },
    pools={
        ["Food"] = true,
    },
    loc_vars = function(self, info_queue, card)
        local numerator,denominator=SMODS.get_probability_vars(card,1,card.ability.extra.chance)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult,numerator,denominator } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
           if context.other_card.seal then
               context.other_card.ability.perma_bonus=context.other_card.ability.perma_bonus or 0
               context.other_card.ability.perma_bonus=context.other_card.ability.perma_bonus+card.ability.extra.chips
               context.other_card.ability.perma_mult=context.other_card.ability.perma_mult or 0
               context.other_card.ability.perma_mult=context.other_card.ability.perma_mult+card.ability.extra.mult
           end 
        end
        if context.joker_main then
            if SMODS.pseudorandom_probability(card,"abn_vitamin_joker",1,card.ability.extra.chance) then
                SMODS.destroy_cards({card})
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end,
    in_pool = function ()
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card.seal then
                return true
            end
        end
        return false
    end,

    abn_artist_credits = {
        artist = "Booleven",
    },
}