SMODS.Joker {
    key = 'richard',
	loc_txt = {
        ['en-us'] = {
			unlock = {
				"?????",
			},
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,
    rarity = 4,
    atlas = 'AbandoniaJokers',
    pos = { x = 5, y = 34 },
    soul_pos = { x = 6, y = 34 },
    cost = 20,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { xmult = 4 } },
	unlocked = false,
  
	add_to_deck = function(self, card)
		unlock_card(self)
	end,

    calculate = function(self, card, context)
        -- Logic to force a selection when cards are drawn
        if not context.blueprint and context.hand_drawn then
            local any_forced = false
            for _, c in ipairs(G.hand.cards) do
                if c.ability.forced_selection then any_forced = true end
            end

            if not any_forced and #G.hand.cards > 0 then
                G.hand:unhighlight_all()
                local forced_card = pseudorandom_element(G.hand.cards, pseudoseed('richard_choice'))
                forced_card.ability.forced_selection = true
                forced_card.ability.richard = true
                G.hand:add_to_highlighted(forced_card)
            end
        end

        -- determine repetitions
        if context.repetition and context.cardarea == G.play then
            if context.other_card.ability.forced_selection or context.other_card.ability.richard then
                local target_suit = context.other_card.base.suit
                local suit_count = 0
                for _, c in ipairs(G.hand.cards) do
                    if c:is_suit(target_suit) then
                        suit_count = suit_count + 1
                    end
                end
                
                
                if suit_count > 0 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = suit_count,
                        card = card
                    }
                end
            end
        end

        -- xmult 
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.forced_selection or context.other_card.ability.richard then
                return {
                    x_mult = card.ability.extra.xmult,
                    card = card,
                }
            end
        end
        
        -- remove force selection
        if context.after and context.cardarea == G.play then
             if context.other_card.ability.forced_selection or context.other_card.ability.richard then
                context.other_card.ability.forced_selection = nil
                context.other_card.ability.richard = nil
             end
        end
    end,

    abn_artist_credits = {
        artist = "Long Rooster",
    },
}