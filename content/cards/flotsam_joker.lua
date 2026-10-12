SMODS.Joker {
    key = 'flotsam_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet9',
    pos = { x = 4, y = 4 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { stop = false } },

    in_pool = function(self)
        -- Only available if played a Flush
        if G.GAME and G.GAME.hands and G.GAME.hands['Flush'] then
            return G.GAME.hands['Flush'].played > 0
        end
        return false
    end,

    calculate = function(self, card, context)
        if not card.ability.extra.stop and context.individual and context.cardarea == G.play and next(context.poker_hands["Flush"]) then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                card.ability.extra.stop = true

                -- Get the first suit
                local flush_suit = context.scoring_hand[1].base.suit
				local new_context = {}

				for k, v in pairs(context) do
					new_context[k] = v
				end

                for i = 1, #G.hand.cards do
                    local hand_card = G.hand.cards[i]
                    if hand_card and hand_card:is_suit(flush_suit) then
                        --SMODS.calculate_effect(hand_card)
                        SMODS.score_card(hand_card, new_context)
                    end
                end

				G.E_MANAGER:add_event(Event({
					func = function()
                		card.ability.extra.stop = false
						return true
					end
				}))
            end
        end
    end,

    abn_artist_credits = {
        artist = "Muddz",
    },
}
