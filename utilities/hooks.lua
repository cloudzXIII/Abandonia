local start_run_old = Game.start_run
function Game:start_run(args)
	start_run_old(self, args)
	if G.jokers and G.jokers.config then
		G.jokers.config.highlighted_limit = G.jokers.config.highlighted_limit + 1
	end
end

local create_card_old = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	if _type == "Joker" and G.GAME and G.GAME.abn_legendary_rate and G.GAME.abn_legendary_rate > 0 and not legendary then
		if pseudorandom("abn_legendary") < (G.GAME.abn_legendary_rate or 0) then
			legendary = true
			_rarity = 4
		end
	elseif _type == "Joker" and G.GAME and G.GAME.abn_superrare_rate and G.GAME.abn_superrare_rate > 0 then
		if pseudorandom("abn_superrare") < (G.GAME.abn_superrare_rate or 0) then
			legendary = false
			_rarity = "abn_SuperRare"
		end
	elseif _type == "Joker" and G.GAME and G.GAME.abn_parallelrare_rate and G.GAME.abn_parallelrare_rate > 0 then
		if pseudorandom("abn_parallelrare") < (G.GAME.abn_parallelrare_rate or 0) then
			legendary = false
			_rarity = "abn_ParallelRare"
		end
	elseif _type == "Joker" and G.GAME and G.GAME.abn_virusrare_rate and G.GAME.abn_virusrare_rate > 0 then
		if pseudorandom("abn_virusrare") < (G.GAME.abn_virusrare_rate or 0) and (G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor) then
			legendary = false
			_rarity = "abn_VirusRare"
		end
	end

	local ret = create_card_old(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)

	if not ret.edition and G.GAME.modifiers.abn_all_edition and ret.ability and ret.ability.set == "Joker" then
		ret:set_edition(poll_edition(nil, nil, nil, true))
	end

	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.1,
		func = function()
			if SMODS.OPENED_BOOSTER and SMODS.OPENED_BOOSTER.config.center.kind == "Arcana" and G.GAME.modifiers.abn_guarantee_spectral_in_tarot then
				local go, av = true, 0
				for k, v in pairs(G.pack_cards and G.pack_cards.cards or {}) do
					if v.ability.set == "Spectral" then
						go = false
					end
				end

				local to_replace = pseudorandom_element(G.pack_cards and G.pack_cards.cards or {}, pseudoseed("brr"))
				if go and to_replace then
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
		local a = pseudorandom_element({ 1, 2 }, pseudoseed("shuf"))
		if a == 1 then
			ret:set_seal(SMODS.poll_seal({ guaranteed = true }))
			ret:set_edition(poll_edition(nil, nil, nil, true))
		else
			ret:set_ability(SMODS.poll_enhancement({ guaranteed = true }))
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
	if self.ability.extra_enhancement then return self.ability.bonus end

	if self.ability.effect == 'Stone Card' or self.config.center.replace_base_card then
		return self.ability.bonus + (self.ability.perma_bonus or 0)
	end
	if G.GAME.blind.config.blind.key == "bl_abn_azure_circle" then
		return (self.base.nominal + self.ability.bonus + (self.ability.perma_bonus or 0)) / 4
	elseif G.GAME.blind.config.blind.key == "bl_abn_hazard_crown" and self:is_face() then
		return (self.base.nominal + self.ability.bonus + (self.ability.perma_bonus or 0)) / 2
	elseif G.GAME.blind.config.blind.key == "bl_abn_hazard_circle" then
		return 0
	else
		return get_chip_bonus_old(self)
	end
end

local cardSetCostHook = Card.set_cost
function Card:set_cost()
	local ret = cardSetCostHook(self)
	if next(SMODS.find_card("j_abn_baba_joker")) and self.config.center.consumeable and self.config.center.set == "weather_report" then
		self.sell_cost = 5
	end
	return ret
end

local get_blind_amount_ref = get_blind_amount
function get_blind_amount(ante)
	local amount = get_blind_amount_ref(ante)
	return ABN:calculate_blind_size_modify(amount, ante)
end

local card_can_sell_card_ref = Card.can_sell_card
function Card:can_sell_card(context, ...)
	local ret = card_can_sell_card_ref(self, context, ...)

	if next(SMODS.find_card("j_abn_golden_apple")) and SMODS.is_eternal(self, { from_sell = true }) and self.area and self.area.config.type == 'joker' then
		return true
	end

	return ret
end

-- Remove use button from continent cards, weather cards or lexica cards where necessary
local use_and_sell_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
	local buttons = use_and_sell_ref(card)
	if card.ability and (card.ability.set == "continent" or card.ability.set == "weather_report" or card.ability.set == "lexica") and not card.config.center.use and card.area == G.pack_cards and G.pack_cards then
		return {
			n = G.UIT.ROOT,
			config = { padding = 0, colour = G.C.CLEAR },
			nodes = {
				{
					n = G.UIT.R,
					config = { ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5 * card.T.w - 0.15, maxw = 0.9 * card.T.w - 0.15, minh = 0.3 * card.T.h, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_select_from_booster' },
					nodes = {
						{ n = G.UIT.T, config = { text = localize('b_select'), colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true } }
					}
				},
			}
		}
	end
	if card.ability and (card.ability.set == "continent" or card.ability.set == "weather_report" or card.ability.set == "lexica") and not card.config.center.use then
		local sell = {
			n = G.UIT.ROOT,
			config = { padding = 0, colour = G.C.CLEAR },
			nodes = {
				{
					n = G.UIT.C,
					config = { padding = 0.15, align = 'cl' },
					nodes = {
						buttons.nodes[1].nodes[1]
					}
				},
			}
		}
		return sell
	end

	return buttons
end

-- Credits under card
local card_h_popup_ref = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card, ...)
	local ret = card_h_popup_ref(card, ...)
	if ABN.config.show_credits and card.config and card.config.center and card.config.center.abn_artist_credits then
		local credits = card.config.center.abn_artist_credits
		table.insert(ret.nodes[1].nodes[1].nodes, {
			n = G.UIT.R,
			config = { align = "cm", padding = 0.03 },
			nodes = {
				{ n = G.UIT.T, config = { colour = G.C.UI.TEXT_DARK, scale = 0.3, text = "Art by " } },
				{ n = G.UIT.T, config = { colour = credits.colour or G.C.UI.TEXT_DARK, scale = 0.3, text = credits.artist } }
			}
		})
	end
	return ret
end

-- Add info tooltip on Plagued Jokers
local generate_card_ui_ref = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
	local UI_table = generate_card_ui_ref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start,
		main_end, card)

	if card and card.config and card.config.center and card.config.center.pools and card.config.center.pools["Plagued"] then
		generate_card_ui_ref({ key = "abn_plagued_joker_info", set = "Other" }, UI_table)
	end
	if card and card.ability and card.ability.set == "calligraphy" then
		generate_card_ui_ref({ key = "abn_calligraphy_info", set = "Other" }, UI_table)
	end

	return UI_table
end
