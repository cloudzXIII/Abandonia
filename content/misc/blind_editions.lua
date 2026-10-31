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
		table.insert(G.GAME.abn_force_blind_edition_pool, {name = key, weight = ABN.BlindEditions[key].weight})
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
				if card.edition and card.edition.negative then
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
	config = {add_dollars = 5, xsize = 2},
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
