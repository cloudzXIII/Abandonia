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
				local go, av = true, 0
				for k, v in pairs(G.pack_cards.cards) do
					if v.ability.set == "Spectral" then
						go = false
					end
				end

				local to_replace = pseudorandom_element(G.pack_cards.cards, pseudoseed("brr"))
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

local card_remove_ref = Card.remove
function Card:remove()
	if (self.added_to_deck or (self.area and (self.area == G.hand or self.area == G.deck))) then
		SMODS.calculate_context {
			abn_card_destroyed = true,
			card = self,
		}
	end
	return card_remove_ref(self)
end

-- Hook to display perma bonus underneath jokers (code borrowed from Final Mix's unreleased update :>)
local generate_UIBox_ability_table_ref = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table(vars_only)
	self.abn_extra_chips = nil
	self.abn_extra_mult = nil
	self.abn_extra_xmult = nil
	self.abn_extra_xchips = nil
	self.abn_extra_dollars = nil
	self.abn_extra_rep = nil

	-- Perma chips
	if self.ability.abn_perma_bonus and self.ability.abn_perma_bonus ~= 0 then
		local chip_op = self.ability.abn_perma_bonus > 0 and "+" or ""
		self.abn_extra_chips = (self.area and self.area == G.jokers) and {
			{
				n = G.UIT.C,
				config = { align = "bm", minh = 0.4 },
				nodes = {
					{
						n = G.UIT.C,
						config = { ref_table = self, align = "m", colour = G.C.CLEAR, r = 0.05, padding = 0.06 },
						nodes = {
							{ n = G.UIT.T, config = { text = chip_op .. self.ability.abn_perma_bonus, colour = G.C.BLUE, scale = 0.32 } },
							{ n = G.UIT.T, config = { text = "", colour = G.C.BLUE, scale = 0.1 } },
							{ n = G.UIT.T, config = { text = localize("abn_joker_chip"), colour = G.C.L_BLACK, scale = 0.32, padding = 0.1 } }
						}
					} }
			}
		} or nil
	end

	-- Perma Mult
	if self.ability.abn_perma_mult and self.ability.abn_perma_mult ~= 0 then
		local mult_op = self.ability.abn_perma_mult > 0 and "+" or ""
		self.abn_extra_mult = (self.area and self.area == G.jokers) and {
			{
				n = G.UIT.C,
				config = { align = "bm", minh = 0.4 },
				nodes = {
					{
						n = G.UIT.C,
						config = { ref_table = self, align = "m", colour = G.C.CLEAR, r = 0.05, padding = 0.06 },
						nodes = {
							{ n = G.UIT.T, config = { text = mult_op .. self.ability.abn_perma_mult, colour = G.C.RED, scale = 0.32 } },
							{ n = G.UIT.T, config = { text = "", colour = G.C.RED, scale = 0.1 } },
							{ n = G.UIT.T, config = { text = localize("abn_joker_mult"), colour = G.C.L_BLACK, scale = 0.32, padding = 0.1 } }
						}
					} }
			}
		} or nil
	end

	-- Perma Xmult
	if self.ability.abn_perma_xmult and self.ability.abn_perma_xmult ~= 1 then
		self.abn_extra_xmult = (self.area and self.area == G.jokers) and {
			{
				n = G.UIT.C,
				config = { align = "bm", minh = 0.4 },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cm", colour = G.C.MULT, r = 0.05, minw = 0.4, padding = 0.03, res = 0.15 },
						nodes = {
							{ n = G.UIT.T, config = { text = "X" .. self.ability.abn_perma_xmult, colour = G.C.WHITE, scale = 0.32 } },
						}
					},
					{
						n = G.UIT.C,
						config = { ref_table = self, align = "m", colour = G.C.CLEAR, r = 0.05, padding = 0.06 },
						nodes = {
							{ n = G.UIT.T, config = { text = localize("abn_joker_xmult"), colour = G.C.L_BLACK, scale = 0.32, padding = 0.1 } }
						}
					} }
			}
		} or nil
	end

	-- Perma XChips
	if self.ability.abn_perma_xchips and self.ability.abn_perma_xchips ~= 1 then
		self.abn_extra_xchips = (self.area and self.area == G.jokers) and {
			{
				n = G.UIT.C,
				config = { align = "bm", minh = 0.4 },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cm", colour = G.C.CHIPS, r = 0.05, minw = 0.4, padding = 0.03, res = 0.15 },
						nodes = {
							{ n = G.UIT.T, config = { text = "X" .. self.ability.abn_perma_xchips, colour = G.C.WHITE, scale = 0.32 } },
						}
					},
					{
						n = G.UIT.C,
						config = { ref_table = self, align = "cm", colour = G.C.CLEAR, r = 0.05, padding = 0.06 },
						nodes = {
							{ n = G.UIT.T, config = { text = localize("abn_joker_xchips"), colour = G.C.L_BLACK, scale = 0.32, padding = 0.1 } }
						}
					}
				}
			}
		} or nil
	end

	-- Perma Dollars
	if self.ability.abn_perma_dollars and self.ability.abn_perma_dollars ~= 0 then
		local dol_op = self.ability.abn_perma_dollars > 0 and "+" or ""
		self.abn_extra_dollars = (self.area and self.area == G.jokers) and {
			{
				n = G.UIT.C,
				config = { align = "bm", minh = 0.4 },
				nodes = {
					{
						n = G.UIT.C,
						config = { ref_table = self, align = "m", colour = G.C.CLEAR, r = 0.05, padding = 0.06 },
						nodes = {
							{ n = G.UIT.T, config = { text = dol_op .. "$" .. self.ability.abn_perma_dollars, colour = G.C.MONEY, scale = 0.32 } },
							{ n = G.UIT.T, config = { text = "", colour = G.C.MONEY, scale = 0.1 } },
							{ n = G.UIT.T, config = { text = localize("abn_joker_dollars"), colour = G.C.L_BLACK, scale = 0.32, padding = 0.1 } }
						}
					} }
			}
		} or nil
	end

	-- Perma Repetitions
	if self.ability.abn_perma_rep and self.ability.abn_perma_rep ~= 0 then
		local rep_op = self.ability.abn_perma_rep > 0 and "+" or ""
		self.abn_extra_rep = (self.area and self.area == G.jokers) and {
			{
				n = G.UIT.C,
				config = { align = "bm", minh = 0.4 },
				nodes = {
					{
						n = G.UIT.C,
						config = { ref_table = self, align = "m", colour = G.C.CLEAR, r = 0.05, padding = 0.06 },
						nodes = {
							{ n = G.UIT.T, config = { text = rep_op .. self.ability.abn_perma_rep, colour = G.C.ORANGE, scale = 0.32 } },
							{ n = G.UIT.T, config = { text = "", colour = G.C.ORANGE, scale = 0.1 } },
							{ n = G.UIT.T, config = { text = localize("abn_joker_rep"), colour = G.C.L_BLACK, scale = 0.32, padding = 0.1 } }
						}
					} }
			}
		} or nil
	end

	return generate_UIBox_ability_table_ref(self, vars_only)
end

local generate_card_ui_ref = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
	local UI_table = generate_card_ui_ref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start,
		main_end, card)

	if card and UI_table.main then
		if card.abn_extra_chips then
			UI_table.main[#UI_table.main + 1] = card.abn_extra_chips
		end
		if card.abn_extra_mult then
			UI_table.main[#UI_table.main + 1] = card.abn_extra_mult
		end
		if card.abn_extra_xmult then
			UI_table.main[#UI_table.main + 1] = card.abn_extra_xmult
		end
		if card.abn_extra_xchips then
			UI_table.main[#UI_table.main + 1] = card.abn_extra_xchips
		end
		if card.abn_extra_dollars then
			UI_table.main[#UI_table.main + 1] = card.abn_extra_dollars
		end
		if card.abn_extra_rep then
			UI_table.main[#UI_table.main + 1] = card.abn_extra_rep
		end
	end

	if card then
		card.abn_extra_chips = nil
		card.abn_extra_mult = nil
		card.abn_extra_xmult = nil
		card.abn_extra_xchips = nil
		card.abn_extra_dollars = nil
		card.abn_extra_rep = nil
	end

	return UI_table
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
