ABN.BlindEditions = {}
ABN.BlindEditionPool = {}
ABN.BlindEdition = SMODS.GameObject:extend {
	obj_table = ABN.BlindEditions,
	obj_buffer = {},
	required_params = {"key", "blind_shader", "counterpart"},
	set = "abn_BlindEdition",
	weight = 1,
	class_prefix = "ble",
	discovered = true,
	inject = function(self)
		table.insert(ABN.BlindEditionPool, {name = self.key, weight = self.weight})
	end,
}

function ABN.add_edition_to_blind(blind_on_deck, args)
	G.GAME.abn_blind_edition = G.GAME.abn_blind_edition or {}
	G.GAME.abn_blind_edition[blind_on_deck] = nil
	local forced_pool = next(G.GAME.abn_force_blind_edition or {}) and G.GAME.abn_force_blind_edition_pool
	args = args or {}
	args.chance = args.chance or G.GAME.abn_blind_edition_rate or 0
	args.guaranteed = args.guaranteed or forced_pool
	if not args.guaranteed and args.chance <= 0 then return end
	args.set = "abn_BlindEdition"
	args.pool = args.pool or forced_pool or ABN.BlindEditionPool
	local ble = SMODS.poll_object(args)
	if not ble then return end
	ble = ABN.BlindEditions[ble]
	G.GAME.abn_blind_edition[blind_on_deck] = {
		key = ble.key,
		shader = ble.blind_shader,
		config = copy_table(ble.config)
	}
	return ble.key
end

function ABN.force_blind_edition(key, force)
	G.GAME.abn_force_blind_edition = G.GAME.abn_force_blind_edition or {}
	G.GAME.abn_force_blind_edition[key] = (G.GAME.abn_force_blind_edition[key] or 0) + (force and 1 or -1)
	if G.GAME.abn_force_blind_edition[key] <= 0 then G.GAME.abn_force_blind_edition[key] = nil end
	G.GAME.abn_force_blind_edition_pool = {}
	for k in pairs(G.GAME.abn_force_blind_edition) do
		table.insert(G.GAME.abn_force_blind_edition_pool, {name = k, weight = 1})
	end
end

local old_reset_blinds = SMODS.reset_blind_choices
function SMODS.reset_blind_choices(choices)
	old_reset_blinds(choices)
	for _, blindtype in ipairs(G.GAME.round_resets.blind_order) do
		ABN.add_edition_to_blind(blindtype)
	end
end

local get_old_boss = get_new_boss
function get_new_boss()
	local ret = get_old_boss()
	ABN.add_edition_to_blind("Boss")
	return ret
end

--See utilities/hooks.lua for how editions affect blind choice UIBoxes

local old_sprite_draw_steps = Sprite.define_draw_steps
function Sprite:define_draw_steps(draw_step_definitions)
	if G.GAME.abn_draw_blind_edition then
		self.abn_draw_blind_shader = G.GAME.abn_draw_blind_edition
		G.GAME.abn_draw_blind_edition = nil
	end
	old_sprite_draw_steps(self, draw_step_definitions)
end

local old_sprite_draw = Sprite.draw
function Sprite:draw(overlay)
	old_sprite_draw(self, overlay)
	if self.abn_draw_blind_shader then
		local send_to_shader = {}
		send_to_shader[1] = math.min(self.VT.r*3, 1) + G.TIMERS.REAL/28
		send_to_shader[2] = G.TIMERS.REAL
		self:draw_shader(self.abn_draw_blind_shader, nil, send_to_shader)
	end
end

local old_blind_draw = Blind.draw
function Blind:draw()
	old_blind_draw(self)
	if not self.states.visible then return end
	local edition = G.GAME.abn_blind_edition[self:get_type()]
	if edition then
		local send_to_shader = {}
		send_to_shader[1] = math.min(self.VT.r*3, 1) + G.TIMERS.REAL/28 + (self.juice and self.juice.r*20 or 0) + self.tilt_var.amt
		send_to_shader[2] = G.TIMERS.REAL
		self.children.animatedSprite:draw_shader(edition.shader, nil, send_to_shader)
	end
end

local old_set_blind = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
	local edition = G.GAME.abn_blind_edition[self:get_type()]
	if edition then
		blind = blind or {}
		blind.dollars = (blind.dollars or 0) + (edition.config.add_dollars or 0)
		blind.dollars = blind.dollars * (edition.config.mult_dollars or 1)
	end
	old_set_blind(self, blind, reset, silent)
end

function ABN.localize_blind_edition(loc_name, text_table, blind_edition)
	loc_name = localize{type = "variable", key = "k_abn_edition_after_name", vars = {
		loc_name,
		localize{type = 'name_text', key = blind_edition.key, set = "abn_BlindEdition"}
	}}
	text_table = copy_table(text_table)
	local edi_vars = ABN.BlindEditions[blind_edition.key].loc_vars and ABN.BlindEditions[blind_edition.key]:loc_vars(blind_edition) or {}
	local edi_table = copy_table(G.localization.descriptions[edi_vars.set or "abn_BlindEdition"][edi_vars.key or blind_edition.key].text_parsed)
	for _, v in ipairs(edi_table) do
		v.edi_vars = edi_vars.vars
		table.insert(text_table, v)
	end
	if not ABN.BlindEditions[blind_edition.key].disable_automatic_retrigger then
		local extra = copy_table(G.localization.misc.v_dictionary_parsed.k_abn_retriggers_per_edition)
		extra.edi_vars = {localize{type = "name_text", set = "Edition", key = ABN.BlindEditions[blind_edition.key].counterpart}}
		table.insert(text_table, extra)
	end
	return loc_name, text_table
end

local old_blind_text = Blind.set_text
function Blind:set_text()
	old_blind_text(self)
	if not self.disabled then
		local blind_edition = G.GAME.abn_blind_edition[self:get_type()]
		if blind_edition then
			local loc_name, text_table = ABN.localize_blind_edition(self.loc_name, self.loc_debuff_lines, blind_edition)
			self.loc_name = loc_name
			self.loc_debuff_lines = text_table
		end
	end
end



ABN.BlindEdition {
	key = "foil",
	blind_shader = "foil",
	counterpart = "e_foil",
	config = {chips = -50, add_dollars = 2},
	weight = 20,
	loc_vars = function(self, edition)
		return {vars = {edition.config.chips}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			return {chips = edition.config.chips}
		end
	end
}

ABN.BlindEdition {
	key = "holo",
	blind_shader = "holo",
	counterpart = "e_holo",
	config = {mult = -10, add_dollars = 3},
	weight = 14,
	loc_vars = function(self, edition)
		return {vars = {edition.config.mult}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			return {mult = edition.config.mult}
		end
	end
}

ABN.BlindEdition {
	key = "poly",
	blind_shader = "polychrome",
	counterpart = "e_polychrome",
	config = {xmult = 0.67, add_dollars = 5},
	weight = 3,
	loc_vars = function(self, edition)
		return {vars = {edition.config.xmult}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			return {xmult = edition.config.xmult}
		end
	end
}

ABN.BlindEdition {
	key = "negative",
	blind_shader = "negative",
	counterpart = "e_negative",
	disable_automatic_retrigger = true,
	config = {add_dollars = 5},
	weight = 3,
	calculate = function(self, blind, edition, context)
		if context.before and not blind.disabled then
			local debuffs = 1
			local cards = {}
			for _, card in ipairs(context.scoring_hand) do
				if card.edition and card.edition.key == self.counterpart then
					debuffs = debuffs + 1
				end
				table.insert(cards, card)
			end
			table.sort(cards, function(a, b)
				return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
			end)
			pseudoshuffle(cards, "ebl_abn_negative")
			for i = 1, math.min(debuffs, #cards) do
				SMODS.debuff_card(cards[i], true, "ebl_abn_negative")
			end
		elseif context.after then
			for _, card in ipairs(context.scoring_hand) do
				G.E_MANAGER:add_event(Event({
					func = function()
						SMODS.debuff_card(card, false, "ebl_abn_negative")
						return true
					end
				}))
			end
		end
	end
}

ABN.BlindEdition {
	key = "chthonian",
	blind_shader = "abn_chthonian",
	counterpart = "e_abn_chthonian",
	config = {mult_dollars = 2, xsize = 2},
	weight = 1.2,
	loc_vars = function(self, edition)
		return {vars = {edition.config.xsize}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			return {xblindsize = edition.config.xsize}
		end
	end
}

ABN.BlindEdition {
	key = "iridescent",
	blind_shader = "abn_iridescent",
	counterpart = "e_abn_iridescent",
	config = {xmult = 0.5, money = -3, add_dollars = 6},
	weight = 0.2,
	loc_vars = function(self, edition)
		return {vars = {edition.config.xmult, -edition.config.money}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			return {xmult = edition.config.xmult, dollars = edition.config.money}
		end
	end
}

ABN.BlindEdition {
	key = "abandond",
	blind_shader = "abn_abandond",
	counterpart = "e_abn_abandond",
	config = {inverts = 1, add_dollars = 1},
	weight = 1.7,
	disable_automatic_retrigger = true,
	calculate = function(self, blind, edition, context)
		if blind.disabled then return end
		if context.before then
			edition.config.inverts = 1
			edition.config.triggers = {}
			for _, card in ipairs(context.scoring_hand) do
				if card.edition and card.edition.key == self.counterpart then
					edition.config.inverts = edition.config.inverts + 1
				end
			end
		elseif context.individual and context.cardarea == G.play then
			if context.other_card.repetition_trigger and edition.config.inverts > 0 then
				edition.config.inverts = edition.config.inverts - 1
				edition.config.triggers[context.other_card.sort_id] = edition.config.triggers[context.other_card.sort_id] or {}
				edition.config.triggers[context.other_card.sort_id][context.other_card.repetition_trigger] = true
				return {message = "Invert!"}
			end
		elseif context.abn_alter_effect and context.card and edition.config.triggers[context.card.sort_id] and edition.config.triggers[context.card.sort_id][context.card.repetition_trigger] then
			for k, v in pairs(context.abn_alter_effect) do
				if Spectrallib.is_number(v) then
					context.abn_alter_effect[k] = -v
				end
			end
		elseif context.after then
			edition.config.triggers = {}
		end
	end
}

ABN.BlindEdition {
	key = "sunscourge",
	blind_shader = "abn_sunscourge",
	counterpart = "e_abn_sunscourge",
	config = {add_dollars = 1},
	weight = 0.2,
	calculate = function(self, blind, edition, context)
		if not blind.disabled and context.final_scoring_step and SMODS.calculate_round_score() >= G.GAME.blind.chips and not edition.config.activated then
			return {
				xblindsize = 2,
				func = function()
					edition.config.activated = true
					return true
				end
			}
		end
	end
}

ABN.BlindEdition {
	key = "gloss",
	blind_shader = "abn_gloss",
	counterpart = "e_abn_gloss",
	config = {xchips = 0.5, money = -5, add_dollars = 8},
	weight = 1,
	loc_vars = function(self, edition)
		return {vars = {edition.config.xchips, -edition.config.money}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			return {x_chips = edition.config.xchips, dollars = edition.config.money}
		end
	end
}

ABN.BlindEdition {
	key = "pearlescent",
	blind_shader = "abn_pearlescent",
	counterpart = "e_abn_pearlescent",
	config = {mult = -20, chips = -100, add_dollars = 6},
	weight = 1,
	loc_vars = function(self, edition)
		return {vars = {edition.config.mult, edition.config.chips}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			return {
				mult = math.max(-mult, edition.config.mult),
				chips = math.max(-hand_chips, edition.config.chips)
			}
		end
	end
}

ABN.BlindEdition {
	key = "chromatic",
	blind_shader = "abn_chromatic",
	counterpart = "e_abn_chromatic",
	config = {xchips = 0.67, xmult = 0.77, money = -4, add_dollars = 10},
	weight = 0.01,
	loc_vars = function(self, edition)
		return {vars = {edition.config.xchips, edition.config.xmult, -edition.config.money}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			return {x_chips = edition.config.xchips, xmult = edition.config.xmult, dollars = edition.config.money}
		end
	end
}

ABN.BlindEdition {
	key = "reversal",
	blind_shader = "abn_flash",
	counterpart = "e_abn_reversal",
	config = {active = true, add_dollars = 2},
	weight = 1.3,
	disable_automatic_retrigger = true,
	calculate = function(self, blind, edition, context)
		if blind.disabled then return end
		if context.initial_scoring_step then
			local reduce = edition.config.active
			edition.config.active = false
			for _, card in ipairs(context.scoring_hand) do
				if card.edition and card.edition.key == self.counterpart then
					reduce = true
					break
				end
			end
			if reduce then
				return {chips = -hand_chips}
			end
		end
	end
}

ABN.BlindEdition {
	key = "bit_rot",
	blind_shader = "abn_exs",
	counterpart = "e_abn_bit_rot",
	config = {emult = 0.77, add_dollars = 2},
	weight = 0.01,
	loc_vars = function(self, edition)
		return {vars = {edition.config.emult}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			return {e_mult = edition.config.emult}
		end
	end
}

ABN.BlindEdition {
	key = "reel",
	blind_shader = "abn_cam",
	counterpart = "e_abn_reel",
	config = {echips = 0.83, add_dollars = 2},
	weight = 0.01,
	loc_vars = function(self, edition)
		return {vars = {edition.config.echips}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			return {e_chips = edition.config.echips}
		end
	end
}

ABN.BlindEdition {
	key = "collodion",
	blind_shader = "abn_orange",
	counterpart = "e_abn_collodion",
	config = {active = true, add_dollars = 2},
	weight = 1.3,
	disable_automatic_retrigger = true,
	calculate = function(self, blind, edition, context)
		if blind.disabled then return end
		if context.initial_scoring_step then
			local reduce = edition.config.active
			edition.config.active = false
			for _, card in ipairs(context.scoring_hand) do
				if card.edition and card.edition.key == self.counterpart then
					reduce = true
					break
				end
			end
			if reduce then
				return {mult = -mult}
			end
		end
	end
}

ABN.BlindEdition {
	key = "vintage",
	blind_shader = "abn_plata",
	counterpart = "e_abn_vintage",
	config = {money = -1, chips = -1, mult = -1, add_dollars = 4},
	weight = 1.2,
	loc_vars = function(self, edition)
		return {vars = {-edition.config.money, edition.config.chips, edition.config.mult}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			local level = G.GAME.hands[context.scoring_name].level
			if level > 0 then
				return {
					mult = edition.config.mult * level,
					chips = edition.config.chips * level,
					dollars = edition.config.money * level
				}
			end
		end
	end
}

ABN.BlindEdition {
	key = "bright",
	blind_shader = "abn_white",
	counterpart = "e_abn_bright",
	config = {chips = -20, mult = -8, add_dollars = 1},
	weight = 1.1,
	loc_vars = function(self, edition)
		return {vars = {edition.config.chips, edition.config.mult}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			local level = 0
			for _, card in ipairs(context.scoring_hand) do
				if ABN.is_light(card) and not SMODS.has_no_rank(card) then
					local rank_data = G.GAME.abn_rank_upgrades[card.base.value]
					if rank_data and rank_data.level and rank_data.level > 1 then
						level = level + rank_data.level
					end
				end
			end
			if level > 0 then
				return {
					mult = math.max(-mult, edition.config.mult * level),
					chips = math.max(-hand_chips, edition.config.chips * level)
				}
			end
		end
	end
}

ABN.BlindEdition {
	key = "opaque",
	blind_shader = "abn_balablack",
	counterpart = "e_abn_opaque",
	config = {chips = -20, mult = -8, add_dollars = 1},
	weight = 1.1,
	loc_vars = function(self, edition)
		return {vars = {edition.config.chips, edition.config.mult}}
	end,
	calculate = function(self, blind, edition, context)
		if context.final_scoring_step and not blind.disabled then
			local level = 0
			for _, card in ipairs(context.scoring_hand) do
				if ABN.is_dark(card) and not SMODS.has_no_rank(card) then
					local rank_data = G.GAME.abn_rank_upgrades[card.base.value]
					if rank_data and rank_data.level and rank_data.level > 1 then
						level = level + rank_data.level
					end
				end
			end
			if level > 0 then
				return {
					mult = math.max(-mult, edition.config.mult * level),
					chips = math.max(-hand_chips, edition.config.chips * level)
				}
			end
		end
	end
}
