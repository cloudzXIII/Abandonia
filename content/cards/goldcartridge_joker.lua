SMODS.Joker {
    key = 'goldcartridge_joker',
    rarity = 3,
    atlas = 'AbandoniaJokers',
    pos = { x = 1, y = 24 },
    cost = 8,
    discovered = false,
    blueprint_compat = true, 
	
	config = { extra = { xmult = 2, dollars = 4 } },
	
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.dollars } }
	end,


    calculate = function(self, card, context)
		--gain value
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra_value = card.ability.extra_value + card.ability.extra.dollars
            card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
		
		if context.other_joker and context.other_joker ~= card and context.other_joker.sell_cost < card.sell_cost then
            return {
                xmult = card.ability.extra.xmult,  -- Apply multiplier to the current card
                card = card
            }
        end
		
    end,

    abn_artist_credits = {
        artist = "Fridgecup",
    },
}