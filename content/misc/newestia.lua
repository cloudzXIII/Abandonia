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
			self.in_pool = nil
		end
		ABN.NewestiaBlind.super.register(self)
	end,
	inject = function(self, i)
		ABN.NewestiaBlind.super.inject(self, i)
		ABN.NewestiaBlinds[self.key] = self
	end,
	in_pool = function()
		return false
	end
})

function ABN.new_newestia_boss()
	if not G.GAME.abn_newestia_boss_pool or #G.GAME.abn_newestia_boss_pool == 0 then
		G.GAME.abn_newestia_boss_pool = {}
		for key, def in pairs(ABN.NewestiaBlinds) do
			if def.boss then
				table.insert(G.GAME.abn_newestia_boss_pool, key)
			end
		end
	end
	return table.remove(G.GAME.abn_newestia_boss_pool, pseudorandom("abn_new_newestia_boss", 1, #G.GAME.abn_newestia_boss_pool))
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
