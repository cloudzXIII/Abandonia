SMODS.Joker{
    key = "equationerror",
    atlas = "ABNJokerSheet15",
    pos = { x = 2, y = 5 },

    rarity = 2,
    cost = 4.5,

    config = {
        extra = {
            chips = 0,
            mult = 0,
            last_joker_count = nil
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if math.random(4) == 1 then
                card.ability.extra.chips = card.ability.extra.chips + 1
                card.ability.extra.mult = card.ability.extra.mult + 1
            end
        end

        if context.joker_main then
            local current_count = G.jokers and G.jokers.cards and #G.jokers.cards or 0

            if card.ability.extra.last_joker_count == nil then
                card.ability.extra.last_joker_count = current_count
            elseif current_count < card.ability.extra.last_joker_count
                and not G.CONTROLLER.locks.selling_card then
                card.ability.extra.chips = card.ability.extra.chips * 2
                card.ability.extra.mult = card.ability.extra.mult * 2
            end

            card.ability.extra.last_joker_count = current_count

            local result = {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }

 if context.scoring_name
    and context.scoring_name ~= 'High Card'
    and math.random(4) == 1 then

    local hand_chips = (
        G.GAME.current_round.current_hand
        and G.GAME.current_round.current_hand.chips
    ) or 0

    result.chips = result.chips + hand_chips
end

            return result
        end
    end
} 