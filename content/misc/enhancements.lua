SMODS.Enhancement({
	key = "petroleum",
	pos = { x = 0, y = 0 },
	replace_base_card = true,
	no_rank = true,
	no_suit = true,
	always_scores = true,
	weight = 0,
	config = { extra = { chips = 100, dollars = 2 } },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra		
		return { vars = { cae.chips, cae.dollars } }
	end,
	calculate = function(self, card, context, effect)
        local cae = card.ability.extra
		if context.main_scoring and context.cardarea == G.play then
			return {
				chips = cae.chips,
                dollars = cae.dollars
			}
		end
		if
			context.final_scoring_step
			and SMODS.calculate_round_score() > G.GAME.blind.chips
		then
            
            card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_abn_onfire") })
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up(0.3, 0.4)
                    card:set_ability("m_abn_oilfire")
                    card.ability.abn_just = true
                    return true
                end
            }))
		end
	end,
})

SMODS.Enhancement({
	key = "oilfire",
	pos = { x = 1, y = 0 },
	replace_base_card = true,
	no_rank = true,
	no_suit = true,
	always_scores = true,
	weight = 0,
	config = { extra = { mult = 10, dollars = 3, odds = 2 } },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra		
        local num, den = SMODS.get_probability_vars(card,1,cae.odds,"oilfire_abn")
		return { vars = { cae.mult, cae.dollars, num, den } }
	end,
	calculate = function(self, card, context, effect)
        local cae = card.ability.extra
        if context.before and card.ability.abn_just then
            card.ability.abn_just = nil
        end
		if context.main_scoring and context.cardarea == G.play then
			return {
				mult = cae.mult,
                dollars = -cae.dollars
			}
		end
		if
			context.destroying_card
			and SMODS.pseudorandom_probability(card,"oilfire_abn",1,card.ability.extra.odds)
            and not card.getting_sliced
            and context.destroying_card == card
            and not card.ability.abn_just 
		then
			return{
                remove = true
            }
		end
	end,
    in_pool = function(self)
        return false
    end
})