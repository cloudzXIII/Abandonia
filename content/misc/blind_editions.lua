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
	pre_inject_class = function(self)
		G.P_CENTER_POOLS[self.set] = {}
	end,
	inject = function(self)
		SMODS.insert_pool(G.P_CENTER_POOLS[self.set], self)
		table.insert(ABN.BlindEditionPool, {name = self.key, weight = self.weight})
	end,
}

function ABN.add_edition_to_blind(blind_on_deck, args)
	G.GAME.abn_blind_edition = G.GAME.abn_blind_edition or {}
	G.GAME.abn_blind_edition[blind_on_deck] = nil
	args = args or {}
	args.chance = args.chance or G.GAME.abn_blind_edition_rate or 0
	if not args.guaranteed and args.chance <= 0 then return end
	args.set = "abn_BlindEdition"
	args.pool = args.pool or ABN.BlindEditionPool
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
		table.insert(draw_step_definitions, {shader = G.GAME.abn_draw_blind_edition})
		G.GAME.abn_draw_blind_edition = nil
	end
	old_sprite_draw_steps(self, draw_step_definitions)
end

local old_blind_draw = Blind.draw
function Blind:draw()
	old_blind_draw(self)
	if not self.states.visible then return end
	local edition = G.GAME.abn_blind_edition[self:get_type()]
	if edition then
		self.children.animatedSprite:draw_shader(edition.shader)
	end
end

local old_set_blind = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
	local edition = G.GAME.abn_blind_edition[self:get_type()]
	if edition then
		blind = blind or {}
		blind.dollars = (blind.dollars or 0) + (edition.config.add_dollars or 0)
	end
	old_set_blind(self, blind, reset, silent)
end

function ABN.localize_blind_edition(loc_name, text_table, blind_edition)
	loc_name = localize{type = "variable", key = "k_abn_edition_after_name", vars = {
		loc_name,
		localize{type = 'name_text', key = blind_edition.key, set = "abn_BlindEdition"}
	}}
	text_table = copy_table(text_table)
	local edi_vars = ABN.BlindEditions[blind_edition.key].loc_vars and ABN.BlindEditions[blind_edition.key]:loc_vars(blind_edition)
	local edi_table = copy_table(G.localization.descriptions[edi_vars.set or "abn_BlindEdition"][edi_vars.key or blind_edition.key].text_parsed)
	for _, v in ipairs(edi_table) do
		v.edi_vars = edi_vars.vars
		table.insert(text_table, v)
	end
	local extra = copy_table(G.localization.misc.v_dictionary_parsed.k_abn_retriggers_per_edition)
	extra.edi_vars = {localize{type = "name_text", set = "Edition", key = ABN.BlindEditions[blind_edition.key].counterpart}}
	table.insert(text_table, extra)
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
