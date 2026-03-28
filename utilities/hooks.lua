local start_run_old = Game.start_run
function Game:start_run(args)
	start_run_old(self, args)
	if G.jokers and G.jokers.config then
		G.jokers.config.highlighted_limit = G.jokers.config.highlighted_limit + 1
	end
end

local create_card_old = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local ret = create_card_old(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	if not ret.edition and G.GAME.modifiers.abn_all_edition and ret.ability and ret.ability.set == "Joker" then
		ret:set_edition(poll_edition(nil, nil, nil, true))
	end

	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.1,
		func = function()
			if SMODS.OPENED_BOOSTER and SMODS.OPENED_BOOSTER.config.center.kind == "Arcana" and G.GAME.modifiers.abn_guarantee_spectral_in_tarot then
				print("trig")
				local go, av = true, 0
				for k, v in pairs(G.pack_cards.cards) do
					if v.ability.set == "Spectral" then
						go = false
						print("nogo")
					end
				end

				local to_replace  = pseudorandom_element(G.pack_cards.cards, pseudoseed("brr"))
				print(to_replace)
				if go and to_replace then
					print("replacing")
					if #SMODS.get_clean_pool("Spectral") > 0 then
						to_replace:set_ability(
							pseudorandom_element(SMODS.get_clean_pool("Spectral"), pseudoseed("brr"))
						)
					end
				end
			end
			return true
		end,
	}))

	if G.GAME.abn_guarantee_double_modif and (ret.ability.set == "Default" or ret.ability.set == "Enhanced") then
		local a = pseudorandom_element({1,2}, pseudoseed("shuf"))
		if a == 1 then
			ret:set_seal(SMODS.poll_seal({ guaranteed = true}))
			ret:set_edition(poll_edition(nil, nil, nil, true))
		else
			ret:set_ability(SMODS.poll_enhancement({ guaranteed = true}))
			ret:set_edition(poll_edition(nil, nil, nil, true))
		end
	end

	return ret
end

local calc_reroll_cost_old = calculate_reroll_cost
function calculate_reroll_cost(skip_increment)
    if G.GAME.modifiers.abn_no_reroll_increase then
		calc_reroll_cost_old(true)
	else
		calc_reroll_cost_old(skip_increment)
	end
end

local get_chip_bonus_old = Card.get_chip_bonus
function Card:get_chip_bonus()
	if G.GAME.blind and (G.GAME.blind.config.blind.key ~= "bl_abn_azure_circle" or G.GAME.blind.disabled )then
		return get_chip_bonus_old(self)
	end
    if self.ability.extra_enhancement then return self.ability.bonus end

    if self.ability.effect == 'Stone Card' or self.config.center.replace_base_card then
        return self.ability.bonus + (self.ability.perma_bonus or 0)
    end
    return (self.base.nominal + self.ability.bonus + (self.ability.perma_bonus or 0) )/ 4
end

local get_blind_amount_ref = get_blind_amount
function get_blind_amount(ante)
    local amount = get_blind_amount_ref(ante)
    return ABN:calculate_blind_size_modify(amount,ante)
end
