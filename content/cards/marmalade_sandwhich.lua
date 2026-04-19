SMODS.Joker {
    key = 'marmalade_sandwhich',
    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 6, y = 30 },
    cost = 4,
    discovered = false,
    blueprint_compat = true, 
	pools = { ["Food"] = true,},
	
	config = { extra = { xmult = 0.05, odds = 5} },

	
	loc_vars = function(self, info_queue, card)
        local numerator,denominator = SMODS.get_probability_vars(card,1,card.ability.extra.odds)
        return {vars = {numerator,denominator, card.ability.extra.xmult }}
    end,


    calculate = function(self, card, context)
		
		-- check for post_trigger and ensure other_card is a valid object
        if context.post_trigger and context.other_card and not context.blueprint then
            local target = context.other_card
            
            -- Ensure the target is actually a Joker
            if target ~= card and type(target) == 'table' and target.ability and target.ability.set == 'Joker' and target.config.center.key and target.config.center.key ~= 'j_abn_voracity_joker' and target.config.center.key ~= 'j_abn_busybee' then
                
                -- Apply the permanent chips
                target.ability.abn_perma_xmult = (target.ability.abn_perma_xmult or 1) + card.ability.extra.xmult
				
                card:juice_up()
				
                -- Visual Feedback
                return {
                    message = ("Tasty!"),
                    colour = G.C.ATTENTION
                }
                
                
            end
        end
		
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if SMODS.pseudorandom_probability(card,'abn_marmalade',1,card.ability.extra.odds) then
				SMODS.destroy_cards(card, nil, nil, true)
				return {
                    message = ("Tasty!"),
                    colour = G.C.ATTENTION
                }
			else
                return {
                    message = localize('k_safe_ex')
                }
			end
		end
    end,

    abn_artist_credits = {
        artist = "Camostar34",
    },
}