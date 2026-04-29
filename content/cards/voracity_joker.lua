SMODS.Joker {
    key = 'voracity_joker',
    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 6, y = 31 },
    cost = 3,
    discovered = false,
    blueprint_compat = true, 
	
	config = { extra = { odds = 3} },

	
	loc_vars = function(self, info_queue, card)
        local numerator,denominator = SMODS.get_probability_vars(card,1,card.ability.extra.odds)
        return {vars = {numerator,denominator }}
    end,
	
	--only appear if you have food
	in_pool = function(self)
        if not G.playing_cards or not G.jokers then return false end

        local has_food = false

        -- Check for Food Jokers
        for _, j in ipairs(G.jokers.cards) do
            if j.config.center.pools and j.config.center.pools.Food then
                has_food = true
                break
            end
        end

        -- Only return true if we have food
        return has_food
    end,


    calculate = function(self, card, context)
		-- retrigger food
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card and context.other_card.config.center and context.other_card.config.center.pools and context.other_card.config.center.pools.Food and not context.end_of_round and not context.main_eval then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
        end
		
		if context.mod_probability and not context.blueprint and not context.retrigger_joker then
			if context.trigger_obj and context.trigger_obj.config and context.trigger_obj.config.center and context.trigger_obj.config.center.pools and context.trigger_obj.config.center.pools.Food and not next(SMODS.find_card('j_abn_busybee')) then
				-- Only return the new denominator if the current one isn't already the target value
				if context.trigger_obj.ability.denominator ~= card.ability.extra.odds then
					return {
						denominator = card.ability.extra.odds
					}
				end
			end
		end
		
    end,

    abn_artist_credits = {
        artist = "Donut",
    },
}