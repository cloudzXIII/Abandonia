loc_colour()
G.C.ALGEBRAIC = HEX("273f45")
G.C.ALGEBRAIC_SECONDARY = HEX("273f45")
G.ARGS.LOC_COLOURS["abn_Algebraic"] = G.C.ALGEBRAIC

SMODS.ConsumableType({
	key = "algebraic",
	collection_rows = { 5, 5 },
	shop_rate = 0.0,
	primary_colour = G.C.ALGEBRAIC,
	secondary_colour = G.C.ALGEBRAIC_SECONDARY,
	text_colour = HEX("f1ba5b"),
})

SMODS.UndiscoveredSprite({
	key = "algebraic",
	atlas = "abn_AbandoniaUndiscovered",
	pos = { x = 0, y = 4 },
})

local function abn_activate_math(self, card, no_destruction)
	set_consumeable_usage(card)
	SMODS.calculate_effect({ message = localize("k_abn_activated_ex"), colour = G.C.GREEN, sound = "tarot1" }, card)
	if not no_destruction then -- added this for long lasting effects // refer to limit of sequence
		SMODS.destroy_cards(card)
	end
	SMODS.calculate_context({ abn_math_activated = true })
	G.GAME.abn_algebraic_activated = (G.GAME.abn_algebraic_activated or 0) + 1
end

SMODS.Consumable({
	key = "euler",
	set = "algebraic",
	cost = 4,
	atlas = "abn_AbandoniaMath",
	pos = { x = 1, y = 3 },
	config = { extra = { xchips = 3 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			if context.scoring_name == "Straight" then
				local valid_ranks = true
				for _, scoring_card in ipairs(context.scoring_hand) do
					if scoring_card:get_id() > 6 then
						valid_ranks = false
						break
					end
				end

				if valid_ranks then
					abn_activate_math(self, card)
					return {
						xchips = card.ability.extra.xchips,
					}
				end
			end
		end
	end,
	abn_artist_credits = {
		artist = "La Ginger",
	},
})

SMODS.Consumable({
	key = "golden",
	set = "algebraic",
	cost = 4,
	atlas = "abn_AbandoniaMath",
	pos = { x = 2, y = 3 },
	config = { extra = { xmult = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			if context.scoring_name == "Straight" then
				local valid_ranks = true
				for _, scoring_card in ipairs(context.scoring_hand) do
					if scoring_card:get_id() > 10 then
						valid_ranks = false
						break
					end
				end

				if valid_ranks then
					abn_activate_math(self, card)
					return {
						xmult = card.ability.extra.xmult,
					}
				end
			end
		end
	end,
	abn_artist_credits = {
		artist = "La Ginger",
	},
})

SMODS.Consumable({
	key = "pi",
	set = "algebraic",
	cost = 4,
	atlas = "abn_AbandoniaMath",
	pos = { x = 3, y = 3 },
	config = { extra = { mult = 0, chips = 0 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			if context.scoring_name == "Flush" then
				card.ability.extra.mult = G.GAME.hands["Flush"].mult
				card.ability.extra.chips = G.GAME.hands["Flush"].chips
				return {
					message = localize("k_upgrade_ex"),
					card = card,
				}
			end

			if context.scoring_name == "High Card" and card.ability.extra.mult > 0 then
				abn_activate_math(self, card)
				return {
					mult = card.ability.extra.mult,
					chips = card.ability.extra.chips,
				}
			end
		end
	end,
	abn_artist_credits = {
		artist = "La Ginger",
	},
})

SMODS.Consumable({
	key = "number",
	set = "algebraic",
	cost = 4,
	atlas = "abn_AbandoniaMath",
	pos = { x = 4, y = 3 },
	config = { extra = {} },
	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,
	calculate = function(self, card, context)
		if context.before then
			local only_numbers = true
			for _, scoring_card in ipairs(context.scoring_hand) do
				if not ABN.is_number(scoring_card) then
					only_numbers = false
					break
				end
			end

			if only_numbers and #context.scoring_hand > 0 then
				local unique_ranks = {}
				local count = 0
				for _, scoring_card in ipairs(context.scoring_hand) do
					local id = scoring_card:get_id()
					if not unique_ranks[id] then
						unique_ranks[id] = true
						count = count + 1
					end
				end

				if count > 0 then
					abn_activate_math(self, card)
					return {
						level_up = count,
						message = localize("k_level_up_ex"),
					}
				end
			end
		end
	end,
	abn_artist_credits = {
		artist = "La Ginger",
	},
})

SMODS.Consumable({
	key = "square_root",
	set = "algebraic",
	cost = 4,
	atlas = "abn_AbandoniaMath",
	pos = { x = 0, y = 0 },
	config = { extra = { xmult = 2, xchips = 2 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xchips } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			local all_numbered = true
			for k, v in pairs(context.scoring_hand) do
				if not ABN.is_number(v) then
					all_numbered = false
				end
			end

			if context.scoring_name == "Four of a Kind" and all_numbered then
				abn_activate_math(self, card)
				return {
					xmult = card.ability.extra.xmult,
					xchips = card.ability.extra.xchips,
				}
			end
		end
	end,
	abn_artist_credits = {
		artist = "0kronix",
	},
})

SMODS.Consumable({
	key = "limit_of_function",
	set = "algebraic",
	cost = 4,
	atlas = "abn_AbandoniaMath",
	pos = { x = 1, y = 0 },
	config = { extra = { xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			local all_numbered, even_cards = true, 0
			for k, v in pairs(context.scoring_hand) do
				if v:get_id() % 2 == 0 then
					even_cards = even_cards + 1
				end
				if not ABN.is_number(v) then
					all_numbered = false
				end
			end

			if context.scoring_name == "Flush" and all_numbered and even_cards > 0 then
				abn_activate_math(self, card)
				return {
					xmult = card.ability.extra.xmult * even_cards,
				}
			end
		end
	end,
	abn_artist_credits = {
		artist = "0kronix",
	},
})

SMODS.Consumable({
	key = "limit_of_sequence",
	set = "algebraic",
	cost = 4,
	atlas = "abn_AbandoniaMath",
	pos = { x = 2, y = 0 },
	config = { extra = { rep = 5 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.rep } }
	end,
	calculate = function(self, card, context)
		if context.before and context.scoring_name == "Straight Flush" then
			local all_numbered, even_cards = true, 0
			for k, v in pairs(context.scoring_hand) do
				if not ABN.is_number(v) then
					all_numbered = false
				end
			end
			if all_numbered then
				abn_activate_math(self, card, true)
				card.ability.abn_active = true
			end
		end
		if context.repetition and context.cardarea == G.play then
			if context.scoring_name == "Straight Flush" and card.ability.abn_active then
				return {
					repetitions = card.ability.extra.rep,
				}
			end
		end
		if context.after and card.ability.abn_active then
			SMODS.destroy_cards(card)
		end
	end,
	abn_artist_credits = {
		artist = "0kronix",
	},
})

SMODS.Consumable({
	key = "divide_by_zero",
	set = "algebraic",
	cost = 4,
	atlas = "abn_AbandoniaMath",
	pos = { x = 3, y = 0 },
	config = { extra = {} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step and context.scoring_name == "Full House" then
			local all_numbered, mult, chips = true, 0, 0
			for k, v in pairs(context.poker_hands) do
				if next(v) and k ~= "Full House" then
					mult = mult + G.GAME.hands[k].mult
					chips = chips + G.GAME.hands[k].chips
				end
			end
			for k, v in pairs(context.scoring_hand) do
				if not ABN.is_number(v) then
					all_numbered = false
				end
			end

			if all_numbered and mult > 0 and chips > 0 then
				abn_activate_math(self, card)
				return {
					mult = mult,
					chips = chips,
				}
			end
		end
	end,
	abn_artist_credits = {
		artist = "0kronix",
	},
})

SMODS.Consumable({
	key = "mathematical_fallacy",
	set = "algebraic",
	cost = 4,
	atlas = "abn_AbandoniaMath",
	pos = { x = 4, y = 0 },
	config = { extra = { asc_power = 0.50 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.asc_power } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			local current_hand, secret = context.scoring_name, false
			for k, v in pairs(G.GAME.abn_hidden_hand_list) do
				if current_hand == v then
					secret = true
				end
			end

			local all_numbered, asc, true_asc = true, 0, card.ability.extra.asc_power

			for k, v in pairs(context.poker_hands) do
				if next(v) and k ~= current_hand then
					asc = asc + 1
					print(k)
				end
			end

			for k, v in pairs(context.scoring_hand) do
				if not ABN.is_number(v) then
					all_numbered = false
				end
			end

			true_asc = true_asc * asc

			if secret and true_asc > 0 then
				abn_activate_math(self, card)
				return {
					asc = true_asc,
					card = card,
				}
			end
		end
	end,
	abn_artist_credits = {
		artist = "0kronix",
	},
})

SMODS.Consumable({
	key = "drölf",
	set = "algebraic",
	cost = 4,
	atlas = "abn_AbandoniaMath",
	pos = { x = 3, y = 0 },
	config = { extra = {xmult = 2, xchips = 2} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xchips } }
	end,
	calculate = function(self, card, context)
		if context.before and context.scoring_name ~= "High Card" then
			local all_numbered, number_of_moddeds = true, 0
			for k, v in pairs(context.scoring_hand) do
				if not ABN.is_number(v) then
					all_numbered = false
				end
				if ABN.is_modded_rank(v) then
					number_of_moddeds = number_of_moddeds + 1
				end
			end
			if all_numbered and number_of_moddeds>0 then
				abn_activate_math(self, card, true)
				card.ability.abn_active = true
				for k, v in pairs(G.play.cards) do
					ABN.level_up_rank(v, v.base.value, number_of_moddeds)
				end
			end
		end
		if context.final_scoring_step and card.ability.abn_active then
			SMODS.destroy_cards(card)
			return{
				xmult = card.ability.extra.xmult,
				xchips = card.ability.extra.xchips
			}
		end
	end,
	abn_artist_credits = {
		artist = "0kronix",
	},
})
