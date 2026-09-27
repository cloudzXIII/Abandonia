-- Coded by Okronix
SMODS.Joker {
    key = 'okronix',
    rarity = 3,
    atlas = 'AbandoniaTeamJokers',
    pos = { x = 7, y = 0 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = { xmult = 1 }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    is_modded_hand = function(self, hand)
        if SMODS.PokerHands[hand] and SMODS.PokerHands[hand].mod then   
            return true
        end
        return false
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local play_amount = G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played or 1

            if self:is_modded_hand(context.scoring_name) then
                return {
                    xmult = card.ability.extra.xmult + play_amount
                }
            else
                return {
                    xchips = play_amount
                }
            end
        end

        local standard_hands = {
            ["High Card"] = true,
            ["Pair"] = true,
            ["Two Pair"] = true,
            ["Three of a Kind"] = true,
            ["Straight"] = true,
            ["Flush"] = true,
            ["Full House"] = true,
            ["Four of a Kind"] = true,
            ["Straight Flush"] = true,
        }
        if context.poker_hand_changed and context.new_level > context.old_level
        and not card.ability.processing_level_up and not context.blueprint then
            if not standard_hands[context.scoring_name] then
                card.ability.extra.xmult = card.ability.extra.xmult + context.new_level
            end
        end
    end,

    abn_artist_credits = {
        artist = "Comykel",
    },
}