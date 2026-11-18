
local abn_calculate_effect_ref = SMODS.calculate_effect
local abn_calculate_effect_depth = 0
function SMODS.calculate_effect(effect, scored_card, from_edition, pre_jokers)
    abn_calculate_effect_depth = abn_calculate_effect_depth + 1
    local result = abn_calculate_effect_ref(effect, scored_card, from_edition, pre_jokers)
    abn_calculate_effect_depth = abn_calculate_effect_depth - 1

    if abn_calculate_effect_depth == 0 and not ABN.educated_score_active and G.STATE == G.STATES.HAND_PLAYED
        and type(effect) == 'table' and next(effect)
        and scored_card and scored_card.ability and scored_card.ability.set == 'Joker' then
        for _, educated_joker in ipairs(SMODS.find_card('j_abn_educated_joker')) do
            if educated_joker ~= scored_card and educated_joker.edition and educated_joker.edition.key == 'e_abn_reversal' then
                ABN.educated_score_active = true
                SMODS.calculate_effect({
                    score = math.abs(scored_card.sell_cost) * educated_joker.ability.extra.score,
                    message_card = scored_card,
                }, educated_joker)
                ABN.educated_score_active = false
            end
        end
    end
    return result
end

SMODS.Joker {
    key = "educated_joker",
    atlas = "ABNJokerSheet25",
    pos = { x = 7, y = 1 },
    rarity = 3,
    cost = 8,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = {
            score = 100,
        },
    },

    abn_artist_credits = {
        artist = "Yahooyowza",
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.score } }
    end,

    calculate = function(self, card, context)
        local has_reversal = card.edition and card.edition.key == 'e_abn_reversal'

        if context.joker_main then
            return {
                chips = G.GAME.hands[context.scoring_name].mult,
                mult = G.GAME.hands[context.scoring_name].chips,
            }
        end

        if context.individual and context.cardarea == G.play
            and context.other_card.edition and context.other_card.edition.key == 'e_abn_reversal' then
            return {
                mult = context.other_card.base.nominal / 2,
            }
        end
    end,
}