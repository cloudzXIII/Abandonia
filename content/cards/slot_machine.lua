local old_prob = SMODS.pseudorandom_probability
function SMODS.pseudorandom_probability(trigger_obj, seed, base_numerator, base_denominator, identifier, no_mod)
    local cards = SMODS.find_card("j_abn_slot_machine")

    -- Check if slot machine exists
    if next(SMODS.find_card("j_abn_slot_machine")) then
        if not next(SMODS.find_card("j_golden")) then
            ease_dollars(-5)
        end
        return true -- Force succeed
    end

    -- Otherwise, do normal probabilities
    return old_prob(trigger_obj, seed, base_numerator, base_denominator, identifier, no_mod)
end

SMODS.Joker {
    key = 'slot_machine',
    rarity = 3,
    atlas = 'ABNJokerSheet7',
    pos = { x = 2, y = 4 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { repetitions = 1, IsRoyalFlush = false } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_golden
        return { vars = { card.ability.extra.repetitions, localize("Royal Flush", "poker_hands") } }
    end,

    in_pool = function(self)
        return G.GAME.consumeable_usage['c_wheel_of_fortune'] and
            G.GAME.consumeable_usage['c_wheel_of_fortune'].count > 0
    end,

    calculate = function(self, card, context)
        -- Level up
        if context.evaluate_poker_hand then
            card.ability.extra.IsRoyalFlush = context.display_name == localize("Royal Flush", "poker_hands")
        end
        if context.before and card.ability.extra.IsRoyalFlush then
            return {
                level_up = true,
                message = localize('k_level_up_ex'),
            }
        end

        -- Retrigger
        if context.repetition and context.cardarea == G.play and card.ability.extra.IsRoyalFlush then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Littleroot",
    },
}
