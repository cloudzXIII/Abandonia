-- Flypaper Enhancement + Insects (Code by Noodlemire)

SMODS.Enhancement({
	key = "flypaper",
	pos = {x = 3, y = 3},
	atlas = "AbandoniaEnhancements",
	weight = 0,
	config = {extra = {flies = {}}},
	loc_vars = function(self, info_queue, card)
		if card.area and card.area.config.collection then
			for key, fly in pairs(ABN.flies) do
				fly:create_info_queue(info_queue, fly)
			end
		else
			for i = #card.ability.extra.flies, 1, -1 do
				ABN.flies[card.ability.extra.flies[i].key]:create_info_queue(info_queue, card.ability.extra.flies[i])
			end
		end
	end,
	calculate = function(self, card, context)
		for i, fly in ipairs(card.ability.extra.flies) do
			if ABN.flies[fly.key].calculate then
				local effect = ABN.flies[fly.key]:calculate(card, fly, context)
				if effect then
					SMODS.calculate_effect(effect, card)
				end
			end
		end
		if context.after and G.GAME.chips + SMODS.last_hand_score >= G.GAME.blind.chips and (context.cardarea == G.play or context.cardarea == G.hand) then
			local possible_catches = {}
			for key, fly in pairs(ABN.flies) do
				if (#card.ability.extra.flies == 0 or key ~= card.ability.extra.flies[#card.ability.extra.flies].key) and fly:catch_requirement(card, context) then
					table.insert(possible_catches, key)
				end
			end
			if #possible_catches > 0 then
				local catch = #possible_catches == 1 and possible_catches[1] or pseudorandom_element(possible_catches, "m_abm_flypaper")
				local fly = nil
				for i = #card.ability.extra.flies, 1, -1 do
					if card.ability.extra.flies[i].key == catch then
						fly = table.remove(card.ability.extra.flies, i)
						fly.active = true
					else
						card.ability.extra.flies[i].active = false
					end
				end
				G.E_MANAGER:add_event(Event({
					func = function()
						table.insert(card.ability.extra.flies, fly or {key = catch, config = ABN.flies[catch]:get_vars(), active = true})
						return true
					end
				}))
				SMODS.calculate_effect({message = "Caught!"}, card)
			end
		end
	end,
	abn_artist_credits = {
		artist = "Creechie",
	},
})

ABN.flies = {}
ABN.shared_fly_fronts = {}
ABN.fly = SMODS.GameObject:extend({
	obj_table = ABN.flies,
	set = "ABN_Flies",
	required_params = {"key", "catch_requirement"},
	discovered = true,
	register = function(self)
		if self.registered then
			sendWarnMessage(("Detected duplicate register call on object %s"):format(self.key), self.set)
			return
		elseif type(self.catch_requirement) ~= "function" then
			sendWarnMessage(("%s requires parameter 'catch_requirement' to be of type 'function(self, card, context)'"):format(self.key), self.set)
			return
		end
		self.atlas = self.atlas or "abn_AbandoniaFlies"
		self.pos = self.pos or {x = 0, y = 0}
		ABN.fly.super.register(self)
	end,
	get_insect = function(self, card)
		for _, fly in ipairs(card.ability.extra.flies) do
			if fly.key == self.key then
				return fly
			end
		end
	end,
	get_vars = function(self)
		local vars = {}
		for key, var in pairs(self.config or {}) do
			vars[key] = var
		end
		return vars
	end,
	create_info_queue = function(self, info_queue, fly)
		local iq = ABN.flies[fly.key]:loc_vars(info_queue, fly)
		iq.key = iq.key or fly.key
		iq.set = iq.set or "Other"
		info_queue[#info_queue + 1] = iq
	end
})

SMODS.DrawStep({
	key = "flies",
	order = 48,
	func = function(card, layer)
		if SMODS.has_enhancement(card, "m_abn_flypaper") then
			for _, fly in ipairs(card.ability.extra.flies) do
				if type(ABN.flies[fly.key].draw) == "function" then
					ABN.flies[fly.key]:draw(card, layer, fly)
				else
					ABN.shared_fly_fronts[fly.key].role.draw_major = card
					ABN.shared_fly_fronts[fly.key]:draw_shader("dissolve", nil, nil, nil, card.children.center)
				end
			end
		end
	end,
    conditions = {vortex = false, facing = "front"}
})

local oldmainmenu = Game.main_menu
function Game:main_menu(change_context)
	local ret = oldmainmenu(self, change_context)
	for key, fly in pairs(ABN.flies) do
		ABN.shared_fly_fronts[key] = Sprite(0, 0, 71, 95, G.ASSET_ATLAS[fly.atlas], fly.pos)
	end
	return ret
end

ABN.fly({
	key = "red_beetle",
	pos = {x = 0, y = 0},
	config = {xmult = 1, xmult_gain = 0.2},
	loc_vars = function(self, info_queue, fly)
		local ret = {vars = {fly.config.xmult_gain, fly.config.xmult}}
		if fly.active == false then
			ret.key = fly.key.."_inactive"
		end
		return ret
	end,
	catch_requirement = function(self, card, context)
		return context.cardarea == G.play and #context.scoring_hand % 2 == 0
	end,
	calculate = function(self, card, fly, context)
		if context.cardarea == G.play then
			if context.main_scoring then
				return {Xmult = fly.config.xmult}
			elseif fly.active and context.after and SMODS.last_hand_oneshot then
				SMODS.scale_card(card, {
					ref_table = fly.config,
					ref_value = "xmult",
					scalar_value = "xmult_gain",
				})
			end
		end
	end
})

ABN.fly({
	key = "green_beetle",
	pos = {x = 1, y = 0},
	config = {xchips = 1, xchips_gain = 0.2},
	loc_vars = function(self, info_queue, fly)
		local ret = {vars = {fly.config.xchips_gain, fly.config.xchips}}
		if fly.active == false then
			ret.key = fly.key.."_inactive"
		end
		return ret
	end,
	catch_requirement = function(self, card, context)
		return context.cardarea == G.play and #context.scoring_hand % 2 == 1
	end,
	calculate = function(self, card, fly, context)
		if context.cardarea == G.play then
			if context.main_scoring then
				return {x_chips = fly.config.xchips}
			elseif fly.active and context.after and SMODS.last_hand_oneshot then
				SMODS.scale_card(card, {
					ref_table = fly.config,
					ref_value = "xchips",
					scalar_value = "xchips_gain",
				})
			end
		end
	end,
})

ABN.fly({
	key = "fly",
	pos = {x = 2, y = 0},
	config = {cards = 2},
	loc_vars = function(self, info_queue, fly)
		return {vars = {fly.config.cards}}
	end,
	catch_requirement = function(self, card, context)
		if context.cardarea ~= G.play then return false end
		for _, c in ipairs(context.scoring_hand) do
			if not next(SMODS.get_enhancements(c)) then
				return false
			end
		end
		return true
	end,
	calculate = function(self, card, fly, context)
		if context.repetition and context.cardarea == G.play and not context.abn_retriggered and fly.config.cards > 0 then
			 local retrigger = {}
			for i = 1, #context.scoring_hand do
				table.insert(retrigger, i)
			end
			while #retrigger > fly.config.cards do
				table.remove(retrigger, pseudorandom("abn_fly", 1, #retrigger))
			end
			for _, i in ipairs(retrigger) do
				local other_card = context.scoring_hand[i]
				SMODS.calculate_effect({message = localize("k_again_ex")}, card)
				SMODS.score_card(other_card,
				{
					cardarea = G.play,
					full_hand = context.full_hand,
					scoring_hand = context.scoring_hand,
					scoring_name = context.scoring_name,
					poker_hands = context.poker_hands,
					abn_retriggered = true,
				})
			end
		end
	end,
})

ABN.fly({
	key = "grasshopper",
	pos = {x = 0, y = 1},
	config = {prob = 100},
	loc_vars = function(self, info_queue, fly)
		return {vars = {fly.config.prob}}
	end,
	catch_requirement = function(self, card, context)
		if context.cardarea ~= G.play then return false end
		for _, c in ipairs(context.scoring_hand) do
			if not c.edition then
				return false
			end
		end
		return true
	end,
	--See ABN.calculate in main.lua
})

ABN.fly({
	key = "dragonfly",
	pos = {x = 1, y = 1},
	config = {xscore = 3},
	loc_vars = function(self, info_queue, fly)
		return {vars = {fly.config.xscore}}
	end,
	catch_requirement = function(self, card, context)
		return context.cardarea == G.hand
	end,
	calculate = function(self, card, fly, context)
		if context.after and not SMODS.last_hand_oneshot and context.cardarea == G.play then
			G.E_MANAGER:add_event(Event({
				func = function()
					SMODS.calculate_effect({xscore = fly.config.xscore}, card)
					return true
				end
			}))
		end
	end,
})

ABN.fly({
	key = "mysterious_bug",
	pos = {x = 2, y = 1},
	config = {asc = 1},
	loc_vars = function(self, info_queue, fly)
		return {vars = {fly.config.asc}}
	end,
	catch_requirement = function(self, card, context)
		return context.cardarea == G.play and card.seal
	end,
	calculate = function(self, card, fly, context)
		if context.main_scoring and context.cardarea == G.play then
			return {asc = fly.config.asc}
		end
	end,
})
