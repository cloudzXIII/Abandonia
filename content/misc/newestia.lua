local size = 0.6
local ratio = 390 / 58
local scale = nil
local button_cache = nil

local old_shop_ui = G.UIDEF.shop
function G.UIDEF.shop()
	--Target: t.nodes[1].nodes[1].nodes[1].nodes = inner_table -> inner_table[1].nodes[1].nodes[1].nodes
	local t = old_shop_ui()
	local subtable = t.nodes[1].nodes[1].nodes[1].nodes[1].nodes[1].nodes[1].nodes
	scale = #subtable / (#subtable+1)
	subtable[1].config.minh = subtable[1].config.minh * scale
	subtable[2].config.minh = subtable[2].config.minh * scale
	button_cache = {n=G.UIT.R,config={id = 'abn_toggle_newestia', align = "cm", minw = 2.8, minh = 1.5 * scale, r=0.15,colour = G.C.BLACK, button = 'abn_toggle_newestia', hover = true, shadow = true}, nodes = {
		{n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'y', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
			{n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
				{n=G.UIT.O, config = {object = Sprite(0, 0, size * ratio * scale, size * scale, G.ASSET_ATLAS.abn_Newestia, {x = 0, y = G.GAME.abn_newestia and 0 or 1})}}
			}}
		}},
	}}
	table.insert(subtable, button_cache)

	return t
end

G.FUNCS.abn_toggle_newestia = function(e)
	G.GAME.abn_newestia = not G.GAME.abn_newestia
	button_cache.nodes[1].nodes[1].nodes[1].config.object:set_sprite_pos({x = 0, y = G.GAME.abn_newestia and 0 or 1})
	for blindtype in pairs(G.GAME.round_resets.blind_choices) do
		if G.GAME.round_resets.blind_states[blindtype] == "Upcoming" and G.GAME.abn_newestia_current_blinds[blindtype] then
			G.GAME.round_resets.blind_choices[blindtype] = (G.GAME.abn_newestia and G.GAME.abn_newestia_current_blinds or G.GAME.abn_newestia_original_blinds)[blindtype]
		end
	end
end

ABN.NewestiaBlinds = {}
ABN.NewestiaBlind = SMODS.Blind:extend({
	register = function(self)
		self.atlas = self.atlas ~= "blind_chips" and self.atlas or "abn_NewestiaBlinds"
		if self.in_pool then
			self.in_new_pool = self.in_pool
		end
		self.in_pool = function()
			return false
		end
		ABN.NewestiaBlind.super.register(self)
	end,
	inject = function(self, i)
		ABN.NewestiaBlind.super.inject(self, i)
		ABN.NewestiaBlinds[self.key] = self
	end
})

function ABN.new_newestia_boss()
	local pool = G.GAME.round_resets.ante % G.GAME.win_ante == 0 and "abn_newestia_showdown_pool" or "abn_newestia_boss_pool"
	if not G.GAME[pool] or #G.GAME[pool] == 0 then
		G.GAME[pool] = {}
		for key, def in pairs(ABN.NewestiaBlinds) do
			if def.boss and (not def.boss.showdown) == (G.GAME.round_resets.ante % G.GAME.win_ante ~= 0) and (not def.in_new_pool or def:in_new_pool()) then
				table.insert(G.GAME[pool], key)
			end
		end
	end
	return table.remove(G.GAME[pool], pseudorandom("abn_new_newestia_boss", 1, #G.GAME[pool]))
end

local old_reset_blind_choices = SMODS.reset_blind_choices
function SMODS.reset_blind_choices(choices)
	old_reset_blind_choices(choices)
	G.GAME.abn_newestia_original_blinds = G.GAME.abn_newestia_original_blinds or {}
	G.GAME.abn_newestia_current_blinds = G.GAME.abn_newestia_current_blinds or {}
	for _, k in ipairs(G.GAME.round_resets.blind_order) do
		if k == "Small" or k == "Big" then
			G.GAME.abn_newestia_original_blinds[k] = choices[k]
			G.GAME.abn_newestia_current_blinds[k] = "bl_abn_new_"..k:lower()
		elseif k == "Boss" then
			G.GAME.abn_newestia_original_blinds[k] = choices[k]
			G.GAME.abn_newestia_current_blinds[k] = ABN.new_newestia_boss()
		end
	end
	if G.GAME.abn_newestia then
		for _, k in ipairs(G.GAME.round_resets.blind_order) do
			choices[k] = G.GAME.abn_newestia_current_blinds[k] or choices[k]
		end
	end
end

local get_old_boss = get_new_boss
function get_new_boss()
	local boss = nil
	if G.GAME.abn_newestia then
		boss = ABN.new_newestia_boss()
		G.GAME.abn_newestia_current_blinds.Boss = boss
	else
		boss = get_old_boss()
		G.GAME.abn_newestia_original_blinds.Boss = boss
	end
	return boss
end

local old_card_chips = Card.get_chip_bonus
function Card:get_chip_bonus()
	local chips = old_card_chips(self)
	local only_suit = G.GAME.blind.config.blind.abn_newestia_only_suit
	if only_suit and not G.GAME.blind.disabled then
		if self:is_suit(only_suit) then
			chips = chips * 2
		else 
			chips = 1
		end
	end
	return chips
end

local old_generate_ui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
	local only_suit = G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind and G.GAME.blind.config.blind.abn_newestia_only_suit
	if specific_vars and specific_vars.nominal_chips and only_suit and not G.GAME.blind.disabled then
		local new_vars = {}
		for k, var in pairs(specific_vars) do
			if k == "nominal_chips" then
				if card and card:is_suit(only_suit) then
					new_vars[k] = var * 2
				else
					new_vars[k] = 1
				end
			elseif k == "bonus_chips" then
				if card and card:is_suit(only_suit) then
					new_vars[k] = var * 2
				elseif _c.name == 'Stone Card' or _c.replace_base_card then
					new_vars[k] = 1
				else
					new_vars[k] = 0
				end
			else
				new_vars[k] = var
			end
		end
		specific_vars = new_vars
	end

	return old_generate_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
end

function ABN.shorten_money_text(nodes)
	if not nodes then return end
	if nodes.nodes then nodes = nodes.nodes end
	for _, node in ipairs(nodes) do
		if node.config and node.config.text and node.config.text:len() >= 15 and node.config.text == string.rep(localize("$"), node.config.text:len()-1).."+" then
			node.config.text = localize("$")..(node.config.text:len()-1).."+"
		elseif node.config and node.config.object and type(node.config.object.string) == "string" and node.config.object.string:len() >= 15 and node.config.object.string == string.rep(localize("$"), node.config.object.string:len()) then
			node.config.object = DynaText({string = {localize("$")..node.config.object.string:len()}, colours = {G.C.MONEY}, rotate = true, bump = true, silent = true, scale = 0.45})
		end
		if node.nodes then
			ABN.shorten_money_text(node.nodes)
		end
	end
end

local old_ui_blind_choice = create_UIBox_blind_choice
function create_UIBox_blind_choice(type, run_info)
	local t = old_ui_blind_choice(type, run_info)
	ABN.shorten_money_text(t)
	return t
end

local old_ui_blind_popup = create_UIBox_blind_popup
function create_UIBox_blind_popup(blind, discovered, vars)
	local t = old_ui_blind_popup(blind, discovered, vars)
	ABN.shorten_money_text(t)
	return t
end

local old_set_blind = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
	old_set_blind(self, blind, reset, silent)
	if G.GAME.current_round.dollars_to_be_earned:len() >= 15 then
		G.GAME.current_round.dollars_to_be_earned = localize("$")..G.GAME.current_round.dollars_to_be_earned:len()
	end
end

local old_blind_load = Blind.load
function Blind:load(blindTable)
	old_blind_load(self, blindTable)
	if G.GAME.current_round.dollars_to_be_earned:len() >= 15 then
		G.GAME.current_round.dollars_to_be_earned = localize("$")..G.GAME.current_round.dollars_to_be_earned:len()
	end
end

ABN.NewestiaBlind({
	key = "new_small",
	dollars = 6,
	mult = 2,
	pos = {x = 0, y = 0},
	small = {},
	boss_colour = G.C.SECONDARY_SET.Spectral
})

ABN.NewestiaBlind({
	key = "new_big",
	dollars = 8,
	mult = 2.5,
	pos = {x = 1, y = 0},
	big = {},
	boss_colour = G.C.FILTER
})

ABN.NewestiaBlind({
	key = "new_yak",
	dollars = 10,
	mult = 4,
	pos = {x = 2, y = 0},
	boss = {},
	boss_colour = HEX("b95b08"),
	loc_vars = function(self)
		return {vars = {ABN.most_played_hand()}}
	end,
	collection_loc_vars = function(self)
		return {key = self.key.."_collection"}
	end,
	calculate = function(self, blind, context)
		if blind.disabled then return end
		if context.debuff_hand then
			blind.triggered = context.scoring_name ~= ABN.most_played_hand(not context.check and context.scoring_name)
			if blind.triggered then
				return {debuff = true}
			end
		elseif context.after and ABN.most_played_hand(context.scoring_name) ~= ABN.most_played_hand() then
			G.E_MANAGER:add_event(Event({
				func = function()
					blind:set_text()
					return true
				end
			}))
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_residence",
	dollars = 10,
	mult = 4,
	pos = {x = 3, y = 0},
	boss = {},
	boss_colour = HEX("5186a8"),
	calculate = function(self, blind, context)
		if context.blind_disabled then
			for _, card in ipairs(G.hand.cards) do
				if card.facing == 'back' and card.ability.abn_new_residence_flipped then
					card:flip()
				end
			end
		end
		if context.blind_disabled or context.blind_defeated then
			for _, card in pairs(G.playing_cards) do
				card.ability.abn_new_residence_flipped = nil
			end
		end
		if not blind.disabled and context.stay_flipped and context.to_area == G.hand and G.GAME.current_round.hands_played > 0 then
			context.other_card.ability.abn_new_residence_flipped = true
			return {
				stay_flipped = true
			}
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_guild",
	dollars = 12,
	mult = 5,
	pos = {x = 4, y = 0},
	boss = {},
	boss_colour = HEX("b9cb92"),
	abn_newestia_only_suit = "Clubs",
	calculate = function(self, blind, context)
		if #G.play.cards > 0 and context.before and not blind.disabled then
			blind.triggered = true
		end
	end
})

ABN.NewestiaBlind({
	key = "new_trawl",
	dollars = 10,
	mult = 4,
	pos = {x = 5, y = 0},
	boss = {},
	boss_colour = HEX("5186a8"),
	calculate = function(self, blind, context)
		if #G.play.cards > 1 and context.before and not blind.disabled then
			G.play:shuffle("bl_abn_new_trawl")
			play_sound('cardSlide1', 0.85)
			blind.triggered = true
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_aperture",
	dollars = 12,
	mult = 5,
	pos = {x = 0, y = 1},
	boss = {},
	boss_colour = HEX("a9a295"),
	abn_newestia_only_suit = "Diamonds",
	calculate = function(self, blind, context)
		if #G.play.cards > 0 and context.before and not blind.disabled then
			blind.triggered = true
		end
	end
})

ABN.NewestiaBlind({
	key = "new_grapple",
	dollars = 10,
	mult = 4,
	pos = {x = 1, y = 1},
	boss = {},
	boss_colour = HEX("a84024"),
	modifies_draw = true,
	calculate = function(self, blind, context)
		if blind.disabled then return end
		if context.before then
			blind.triggered = true
			G.GAME.bl_abn_new_grapple_draw_modifier = true
		elseif context.drawing_cards and G.GAME.bl_abn_new_grapple_draw_modifier then
			G.GAME.bl_abn_new_grapple_draw_modifier = nil
			return {cards_to_draw = 2}
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_shakes",
	dollars = 10,
	mult = 4,
	pos = {x = 2, y = 1},
	boss = {},
	boss_colour = HEX("575757"),
	calculate = function(self, blind, context)
		if context.setting_blind and not blind.disabled then
			G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - 1
			G.GAME.bl_abn_new_shakes_active = true
		elseif (context.blind_disabled or context.blind_defeated) and G.GAME.bl_abn_new_shakes_active then
			G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + 1
			G.GAME.bl_abn_new_shakes_active = nil
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_blockade",
	dollars = 12,
	mult = 2,
	pos = {x = 3, y = 1},
	boss = {},
	boss_colour = HEX("8a59a5"),
	calculate = function(self, blind, context)
		if context.modify_hand and not blind.disabled and #context.full_hand > 1 then
			blind.triggered = true
			while #context.scoring_hand > 1 do
				table.remove(context.scoring_hand, #context.scoring_hand)
			end
			context.scoring_hand[1] = context.full_hand[1]
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_pulley",
	dollars = 10,
	mult = 4,
	pos = {x = 4, y = 1},
	boss = {},
	boss_colour = HEX("50bf7c"),
	loc_vars = function(self)
		return {vars = {SMODS.get_probability_vars(self, 6, 7)}}
	end,
	collection_loc_vars = function(self)
		return {vars = {6, 7}}
	end,
	calculate = function(self, blind, context)
		if context.blind_disabled then
			for _, card in ipairs(G.hand.cards) do
				if card.facing == 'back' and card.ability.abn_new_residence_flipped then
					card:flip()
				end
			end
		end
		if context.blind_disabled or context.blind_defeated then
			for _, card in pairs(G.playing_cards) do
				card.ability.abn_new_residence_flipped = nil
			end
		end
		if not blind.disabled and context.stay_flipped and context.to_area == G.hand and SMODS.pseudorandom_probability(blind, "bl_abn_new_pulley", 6, 7) then
			context.other_card.ability.abn_new_residence_flipped = true
			return {
				stay_flipped = true
			}
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_limb",
	dollars = 10,
	mult = 4,
	pos = {x = 5, y = 1},
	boss = {},
	boss_colour = HEX("6865f3"),
	calculate = function(self, blind, context)
		if context.debuff_hand and not blind.disabled then
			blind.triggered = G.GAME.hands[context.scoring_name].level <= 1
			if blind.triggered then
				return {debuff = true}
			end
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_telepath",
	dollars = 10,
	mult = 4,
	pos = {x = 0, y = 2},
	boss = {},
	boss_colour = HEX("efc03c"),
	calculate = function(self, blind, context)
		if context.debuff_hand and not blind.disabled then
			if context.check then
				local scoring_name, _, _, scoring_hand = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
				if #context.scoring_hand < #G.hand.highlighted or context.scoring_name == "High Card" then
					return {debuff = true}
				end
			else
				blind.triggered = #context.scoring_hand < #context.full_hand or context.scoring_name == "High Card"
				if blind.triggered then
					return {debuff = true}
				end
			end
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_provoke",
	dollars = 12,
	mult = 5,
	pos = {x = 1, y = 2},
	boss = {},
	boss_colour = HEX("b95c96"),
	abn_newestia_only_suit = "Spades",
	calculate = function(self, blind, context)
		if #G.play.cards > 0 and context.before and not blind.disabled then
			blind.triggered = true
		end
	end
})

ABN.NewestiaBlind({
	key = "new_liquid",
	dollars = 10,
	mult = 4,
	pos = {x = 2, y = 2},
	boss = {},
	boss_colour = HEX("c6e0eb"),
	calculate = function(self, blind, context)
		if context.debuff_hand and not blind.disabled and G.GAME.current_round.hands_played == 0 then
			blind.triggered = context.check and #G.hand.highlighted ~= 1 or #context.full_hand ~= 1
			if blind.triggered then
				return {debuff = true}
			end
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_snake",
	dollars = 10,
	mult = 4,
	pos = {x = 3, y = 2},
	boss = {},
	boss_colour = HEX("439a4f"),
	modifies_draw = true,
	loc_vars = function(self)
		local ret = {vars = {G.GAME.current_round.hands_played + 1}}
		if ret.vars[1] > 1 then
			ret.key = self.key.."_plural"
		end
		return ret
	end,
	collection_loc_vars = function(self)
		return {1}
	end,
	calculate = function(self, blind, context)
		if blind.disabled then return end
		if context.before then
			blind.triggered = true
			G.GAME.bl_abn_new_snake_draw_modifier = true
		elseif context.drawing_cards and G.GAME.bl_abn_new_snake_draw_modifier then
			G.GAME.bl_abn_new_snake_draw_modifier = nil
			G.E_MANAGER:add_event(Event({
				func = function()
					blind:set_text()
					return true
				end
			}))
			return {cards_to_draw = G.GAME.current_round.hands_played}
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_column",
	dollars = 10,
	mult = 4,
	pos = {x = 4, y = 2},
	boss = {},
	boss_colour = HEX("7e6752"),
	calculate = function(self, blind, context)
		if not blind.disabled and context.debuff_card and context.debuff_card.area ~= G.jokers and not context.debuff_card.ability.played_this_ante then
			return {debuff = true}
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_oculus",
	dollars = 10,
	mult = 4,
	pos = {x = 5, y = 2},
	boss = {},
	boss_colour = HEX("4b71e4"),
	loc_vars = function(self)
		if G.GAME and G.GAME.bl_abn_new_oculus_previous_hand then
			return {
				key = self.key..'_'..G.GAME.bl_abn_new_oculus_mode,
				vars = {G.GAME.bl_abn_new_oculus_previous_hand}
			}
		end
	end,
	calculate = function(self, blind, context)
		if context.setting_blind and not blind.disabled then
			G.GAME.bl_abn_new_oculus_mode = "change"
		elseif context.debuff_hand and not blind.disabled and
				((G.GAME.bl_abn_new_oculus_mode == "change" and G.GAME.bl_abn_new_oculus_previous_hand == context.scoring_name) or
				(G.GAME.bl_abn_new_oculus_mode == "repeat" and G.GAME.bl_abn_new_oculus_previous_hand ~= context.scoring_name)) then
			blind.triggered = true
			return {debuff = true}
		elseif context.after and not blind.disabled and not blind.triggered then
			G.GAME.bl_abn_new_oculus_previous_hand = context.scoring_name
			if G.GAME.bl_abn_new_oculus_mode == "change" then
				G.GAME.bl_abn_new_oculus_mode = "repeat"
			else
				G.GAME.bl_abn_new_oculus_mode = "change"
			end
			G.E_MANAGER:add_event(Event({
				func = function()
					blind:set_text()
					return true
				end
			}))
		elseif context.blind_defeated then
			G.GAME.bl_abn_new_oculus_previous_hand = nil
			G.GAME.bl_abn_new_oculus_mode = nil
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_maw",
	dollars = 10,
	mult = 4,
	pos = {x = 0, y = 3},
	boss = {},
	boss_colour = HEX("ae718e"),
	loc_vars = function(self)
		if G.GAME and G.GAME.bl_abn_new_maw_previous_hand then
			return {
				key = self.key.."_change",
				vars = {G.GAME.bl_abn_new_maw_previous_hand}
			}
		end
	end,
	calculate = function(self, blind, context)
		if context.debuff_hand and not blind.disabled and G.GAME.bl_abn_new_maw_previous_hand == context.scoring_name then
			blind.triggered = true
			return {debuff = true}
		elseif context.after and not blind.disabled and not blind.triggered then
			G.GAME.bl_abn_new_maw_previous_hand = context.scoring_name
			G.E_MANAGER:add_event(Event({
				func = function()
					blind:set_text()
					return true
				end
			}))
		elseif context.blind_defeated then
			G.GAME.bl_abn_new_maw_previous_hand = nil
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_flora",
	dollars = 10,
	mult = 4,
	pos = {x = 1, y = 3},
	boss = {},
	boss_colour = HEX("709284"),
	loc_vars = function(self)
		if G.GAME and G.GAME.bl_abn_new_flora_value then
			return {
				key = self.key.."_rank",
				vars = {localize(G.GAME.bl_abn_new_flora_value, "ranks")}
			}
		end
	end,
	calculate = function(self, blind, context)
		if not blind.disabled and context.debuff_card and context.debuff_card.area ~= G.jokers and context.debuff_card:get_id() == G.GAME.bl_abn_new_flora_id then
			return {debuff = true}
		elseif not blind.disabled and (context.after or context.pre_discard or context.setting_blind) then
			local cards = {}
			for _, card in ipairs(G.playing_cards) do
				if not SMODS.has_no_rank(card) and card:get_id() ~= G.GAME.bl_abn_new_flora_id then
					table.insert(cards, card)
				end
			end
			local card = pseudorandom_element(cards, "bl_abn_new_flora_rank")
			if card then
				G.GAME.bl_abn_new_flora_id = card.base.id
				G.GAME.bl_abn_new_flora_value = card.base.value
			end
			for _, card in ipairs(G.playing_cards) do
				SMODS.recalc_debuff(card)
			end
			G.E_MANAGER:add_event(Event({
				func = function()
					blind:set_text()
					return true
				end
			}))
		elseif context.blind_defeated then
			G.GAME.bl_abn_new_flora_id = nil
			G.GAME.bl_abn_new_flora_value = nil
		end
	end
})

ABN.NewestiaBlind({
	key = "new_syringe",
	dollars = 10,
	mult = 4,
	pos = {x = 2, y = 3},
	boss = {},
	boss_colour = HEX("5c6e31"),
	loc_vars = function(self)
		if G.GAME and G.GAME.bl_abn_new_syringe_hand then
			return {
				key = self.key.."_hand",
				vars = {localize(G.GAME.bl_abn_new_syringe_hand, "poker_hands")}
			}
		end
	end,
	calculate = function(self, blind, context)
		if not blind.disabled and context.debuff_hand and context.scoring_name ~= G.GAME.bl_abn_new_syringe_hand then
			blind.triggered = true
			return {debuff = true}
		elseif not blind.disabled and (context.after or context.pre_discard or context.setting_blind) then
			local hands = {}
			for handname in pairs(G.GAME.hands) do
				if SMODS.is_poker_hand_visible(handname) and handname ~= G.GAME.bl_abn_new_syringe_hand then
					table.insert(hands, handname)
				end
			end
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.bl_abn_new_syringe_hand = pseudorandom_element(hands, "bl_abn_new_syringe_hand")
					blind:set_text()
					return true
				end
			}))
		elseif context.blind_defeated then
			G.GAME.bl_abn_new_syringe_hand = nil
		end
	end
})

ABN.NewestiaBlind({
	key = "new_cranium",
	dollars = 12,
	mult = 5,
	pos = {x = 3, y = 3},
	boss = {},
	boss_colour = HEX("ac9db4"),
	abn_newestia_only_suit = "Hearts",
	calculate = function(self, blind, context)
		if #G.play.cards > 0 and context.before and not blind.disabled then
			blind.triggered = true
		end
	end
})

ABN.NewestiaBlind({
	key = "new_molar",
	dollars = 10,
	mult = 4,
	pos = {x = 4, y = 3},
	boss = {},
	boss_colour = HEX("b52d2d"),
	calculate = function(self, blind, context)
		if blind.disabled then return end
		if context.press_play and #G.hand.highlighted < #G.hand.cards then
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.2,
				func = function()
					for i = 1, #G.hand.cards do
						G.E_MANAGER:add_event(Event({
							func = function()
								G.hand.cards[i]:juice_up()
								return true
							end,
						}))
						ease_dollars(-1)
						delay(0.23)
					end
					return true
				end
			}))
			G.E_MANAGER:add_event(Event({
				trigger = 'immediate',
				func = (function()
					SMODS.juice_up_blind()
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.06 * G.SETTINGS.GAMESPEED,
						blockable = false,
						blocking = false,
						func = function()
							play_sound('tarot2', 0.76, 0.4)
							return true
						end
					}))
					play_sound('tarot2', 1, 0.4)
					return true
				end)
			}))
			delay(0.4)
		elseif context.before and #G.hand.cards > 0 then
			blind.triggered = true
		end
	end
})

ABN.NewestiaBlind({
	key = "new_sign",
	dollars = 10,
	mult = 4,
	pos = {x = 5, y = 3},
	boss = {},
	boss_colour = HEX("6a3847"),
	calculate = function(self, blind, context)
		if blind.disabled then return end
		if context.press_play and #G.hand.highlighted > 0 then
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.2,
				func = function()
					for i = 1, #G.play.cards do
						G.play.cards[i]:flip()
						G.E_MANAGER:add_event(Event({
							func = function()
								local suit = pseudorandom_element(SMODS.Suits, pseudoseed("bl_abn_new_sign")).key
								local rank = pseudorandom_element(SMODS.Ranks, pseudoseed("bl_abn_new_sign")).key
								SMODS.change_base(G.play.cards[i], suit, rank)
								G.play.cards[i]:flip()
								return true
							end,
						}))
						--delay(0.23)
					end
					return true
				end
			}))
			G.E_MANAGER:add_event(Event({
				trigger = 'immediate',
				func = (function()
					SMODS.juice_up_blind()
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.06 * G.SETTINGS.GAMESPEED,
						blockable = false,
						blocking = false,
						func = function()
							play_sound('tarot2', 0.76, 0.4)
							return true
						end
					}))
					play_sound('tarot2', 1, 0.4)
					return true
				end)
			}))
			delay(0.4)
		elseif context.before and #G.play.cards > 0 then
			blind.triggered = true
		end
	end
})

ABN.NewestiaBlind({
	key = "new_firestone",
	dollars = 10,
	mult = 4,
	pos = {x = 0, y = 4},
	boss = {},
	boss_colour = HEX("e56a2f"),
	calculate = function(self, blind, context)
		if not blind.disabled and context.final_scoring_step and SMODS.calculate_round_score() + G.GAME.chips >= G.GAME.blind.chips then
			return {
				Xmult_mod = 0,
				Xchip_mod = 0,
				xscore = 0
			}
		end
	end
})

ABN.NewestiaBlind({
	key = "new_scarlet_cardiac",
	dollars = 20,
	mult = 10,
	pos = {x = 1, y = 4},
	boss = {showdown = true},
	boss_colour = HEX("ac3232"),
	calculate = function(self, blind, context)
		if context.blind_disabled or context.blind_defeated then
			for _, joker in ipairs(G.jokers.cards) do
				joker.ability.abn_new_scarlet_cardiac_chosen = nil
			end
		end
		if blind.disabled then return end
		if context.debuff_card and context.debuff_card.area == G.jokers and context.debuff_card.ability.abn_new_scarlet_cardiac_chosen then
			return {debuff = true}
		elseif (context.after or context.setting_blind) and #G.jokers.cards > 0 then
			blind.abn_prepared = true
			if context.after and #G.jokers.cards >= 2 then
				blind.triggered = true
			end
		elseif context.hand_drawn and blind.abn_prepared then
			blind.abn_prepared = nil
			local already_one_safe = false
			local choices = {}
			for _, joker in ipairs(G.jokers.cards) do
				if joker.ability.abn_new_scarlet_cardiac_chosen or already_one_safe or context.first_hand_drawn then
					table.insert(choices, joker)
				else
					already_one_safe = true
				end
			end
			local safe = pseudorandom_element(choices, "bl_abn_new_scarlet_cardiac")
			for _, joker in ipairs(G.jokers.cards) do
				local v1 = joker.ability.abn_new_scarlet_cardiac_chosen
				local v2 = joker ~= safe
				if v1 ~= v2 then
					joker.ability.abn_new_scarlet_cardiac_chosen = joker ~= safe
					SMODS.recalc_debuff(joker)
					joker:juice_up()
				end
			end
			blind:wiggle()
		end
	end
})

ABN.NewestiaBlind({
	key = "new_azure_chime",
	dollars = 20,
	mult = 10,
	pos = {x = 2, y = 4},
	boss = {showdown = true},
	boss_colour = HEX("009cfd"),
	calculate = function(self, blind, context)
		if context.setting_blind and not blind.disabled then
			G.GAME.abn_new_azure_chime_original_handsize = G.hand.config.highlighted_limit
			G.GAME.abn_new_azure_chime_original_handsize = G.hand.config.highlighted_limit
		elseif context.blind_disabled or context.blind_defeated then
			if G.GAME.abn_new_azure_chime_original_handsize then
				G.hand.config.highlighted_limit = G.GAME.abn_new_azure_chime_original_handsize
				G.GAME.abn_new_azure_chime_original_handsize = nil
			end
			for _, card in ipairs(G.playing_cards) do
				card.ability.forced_selection = nil
			end
		end
		if blind.disabled then return end
		if context.hand_drawn then
			local new_hand_size = #G.hand.cards - 1
			if G.hand.config.highlighted_limit ~= G.GAME.abn_new_azure_chime_original_handsize then
				G.GAME.abn_new_azure_chime_original_handsize = G.GAME.abn_new_azure_chime_original_handsize + G.GAME.abn_new_azure_chime_original_handsize - G.hand.config.highlighted_limit
				G.GAME.abn_new_azure_chime_original_handsize = G.hand.config.highlighted_limit
			end
			if new_hand_size ~= G.GAME.abn_new_azure_chime_original_handsize then
				G.GAME.abn_new_azure_chime_original_handsize = math.max(G.GAME.abn_new_azure_chime_original_handsize, new_hand_size)
				G.hand.config.highlighted_limit = G.GAME.abn_new_azure_chime_original_handsize
			end
			local non_forced = {}
			for _, card in ipairs(G.hand.cards) do
				if not card.ability.forced_selection then
					table.insert(non_forced, card)
				end
			end
			if #non_forced >= 2 then
				G.hand:unhighlight_all()
				local unforced_card = pseudorandom_element(non_forced, "bl_abn_new_azure_chime")
				for _, card in ipairs(non_forced) do
					if card ~= unforced_card then
						card.ability.forced_selection = true
						G.hand:add_to_highlighted(card)
					end
				end
			end
		end
	end
})

local old_can_play = G.FUNCS.can_play
function G.FUNCS.can_play(e)
	if G.GAME.current_round.hands_left > 0 and not G.GAME.blind.disabled and G.GAME.blind.config.blind.key == "bl_abn_new_azure_chime" and G.GAME.abn_new_azure_chime_original_handsize and #G.hand.highlighted <= G.GAME.abn_new_azure_chime_original_handsize then
		e.config.colour = G.C.BLUE
		e.config.button = "play_cards_from_highlighted"
	else
		old_can_play(e)
	end
end

local old_can_discard = G.FUNCS.can_discard
function G.FUNCS.can_discard(e)
	if G.GAME.current_round.discards_left > 0 and not G.GAME.blind.disabled and G.GAME.blind.config.blind.key == "bl_abn_new_azure_chime" and G.GAME.abn_new_azure_chime_original_handsize and #G.hand.highlighted <= G.GAME.abn_new_azure_chime_original_handsize then
		e.config.colour = G.C.RED
		e.config.button = "discard_cards_from_highlighted"
	else
		old_can_discard(e)
	end
end

local old_cardarea_update = CardArea.update
function CardArea:update(dt)
	old_cardarea_update(self, dt)
	if self == G.hand then
		for k, v in pairs(self.cards) do
			if v.ability.forced_selection and not v.highlighted then 
				self:add_to_highlighted(v)
			end
		end
	end
end

--See update hook in utlities/hooks.lua
ABN.NewestiaBlind({
	key = "new_golden_nut",
	dollars = 20,
	mult = 10,
	pos = {x = 3, y = 4},
	boss = {showdown = true},
	boss_colour = HEX("fdad1f"),
	calculate = function(self, blind, context)
		if context.blind_disabled or context.blind_defeated then
			--Because the blind still exists for a short period after being defeated, the update hook will re-disable joker dragging if given the opportunity. Setting blind.disabled here prevents this.
			blind.disabled = true
			for _, joker in ipairs(G.jokers.cards) do
				joker.states.drag.can = true
			end
		elseif context.before and not blind.disabled then
			for _, area in ipairs({G.jokers, G.play, G.hand}) do
				if #area.cards > 1 then
					area:shuffle("bl_abn_new_trawl")
					play_sound('cardSlide1', 0.85)
					blind.triggered = true
				end
			end
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_lush_vegetation",
	dollars = 20,
	mult = 10,
	pos = {x = 4, y = 4},
	boss = {showdown = true},
	boss_colour = HEX("56a786"),
	calculate = function(self, blind, context)
		if blind.disabled then return end
		if context.debuff_card and context.debuff_card.area == G.jokers and G.GAME.current_round.discards_left > 0 then
			return {debuff = true}
		elseif context.pre_discard and G.GAME.current_round.discards_left <= 1 then
			G.E_MANAGER:add_event(Event({
				trigger = 'immediate',
				func = function()
					blind:disable()
					return true
				end
			}))
		end
	end,
})

ABN.NewestiaBlind({
	key = "new_lavender_basin",
	dollars = 20,
	mult = 2,
	pos = {x = 5, y = 4},
	boss = {showdown = true},
	boss_colour = HEX("7963c5"),
	loc_vars = function(self)
		return {vars = {SMODS.get_probability_vars(self, 1, 4)}}
	end,
	collection_loc_vars = function(self)
		return {vars = {1, 4}}
	end,
	calculate = function(self, blind, context)
		if blind.disabled then return end
		if context.blind_disabled and G.GAME.bl_abn_new_lavender_basin_mult then
			blind.chips = blind.chips / G.GAME.bl_abn_new_lavender_basin_mult
			blind.chip_text = number_format(blind.chips)
			blind:set_text()
			blind:wiggle()
			blind.triggered = true
			G.GAME.bl_abn_new_lavender_basin_mult = nil
		elseif not blind.disabled and (context.before or context.pre_discard or context.abn_playing_cards_rearranged) and SMODS.pseudorandom_probability(blind, "bl_abn_new_lavender_basin", 1, 4) then
			G.GAME.bl_abn_new_lavender_basin_mult = (G.GAME.bl_abn_new_lavender_basin_mult or 1) * 2
			blind.chips = blind.chips * 2
			blind.chip_text = number_format(blind.chips)
			blind:set_text()
			blind:wiggle()
			blind.triggered = true
		end
	end,
})
