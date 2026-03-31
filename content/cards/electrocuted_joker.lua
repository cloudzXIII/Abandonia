-- Electrocuted Joker
-- Coded by J8-Bit
-- Retrigger all Gold Cards and Steel Cards; 1 in 4 chance to destroy Gold Cards and Steel Cards when scored


SMODS.Joker {
    key = 'electrocuted_joker',

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        extra = {
            enhancements = { "m_steel", "m_gold" },
            repetitions = 1,
            odds = 4
        },
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
            'abn_electrocuted_joker')
        return {
            vars = {
                card.ability.extra.enhancements[1] and
                localize({ type = 'name_text', set = "Enhanced", key = card.ability.extra.enhancements[1] }) or
                'Gold Card',
                card.ability.extra.enhancements[2] and
                localize({ type = 'name_text', set = "Enhanced", key = card.ability.extra.enhancements[2] }) or
                'Steel Card',
                numerator, denominator
            }
        }
    end,
    rarity = 2,
    cost = 6,
    atlas = 'AbandoniaJokers',
    pos = { x = 8, y = 8 },
    discovered = false,
    calculate = function(self, card, context)
        -- retriggers
        if context.repetition then
            local has_enhancement = false
            for _, enhancement in ipairs(card.ability.extra.enhancements) do
                if SMODS.has_enhancement(context.other_card, enhancement) then
                    has_enhancement = true
                    break
                end
            end
            if has_enhancement then
                --print("Has enhancement for repetition")
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
        -- destroying
        if context.individual and context.cardarea == G.play then
            local has_enhancement = false
            for _, enhancement in ipairs(card.ability.extra.enhancements) do
                if SMODS.has_enhancement(context.other_card, enhancement) then
                    --print("Has enhancement for potential destruction")
                    has_enhancement = true
                    break
                end
            end
            if has_enhancement and SMODS.pseudorandom_probability(card, 'abn_electrocuted_joker', 1, card.ability.extra.odds) then
                return {
                    message = localize("k_abn_destroyed"),
                    func = function()
                        SMODS.destroy_cards(context.other_card, nil, nil, true)
                        return true
                    end
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "Bird_but_bread"
    },
}
