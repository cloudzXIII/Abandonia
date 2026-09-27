-- Drama Masks (code by Noodlemire)

SMODS.Joker {
	key = "drama_masks",
	atlas = "ABNJokerSheet27",
	rarity = 3,
	cost = 8,
	pos = {x = 7, y = 0},
	blueprint_compat = true,
	config = {extra = {xmult = 2.5, asc = 0, asc_gain = 2}},
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		return {vars = {joker.ability.extra.xmult, joker.ability.extra.asc_gain, joker.ability.extra.asc}}
	end,
	add_to_deck = function(self, joker, from_debuff)
		if joker.ability.extra.rarity then
			for _, area in ipairs(SMODS.get_card_areas("jokers")) do
				for __, other in ipairs(area.cards) do
					if other.ability and other.ability.set == "Joker" and other ~= joker and other.config.center.rarity == joker.ability.extra.rarity then
						SMODS.debuff_card(other, true, "j_abn_drama_masks")
					end
				end
			end
		end
	end,
	remove_from_deck = function(self, joker, from_debuff)
		if joker.ability.extra.rarity then
			for _, area in ipairs(SMODS.get_card_areas("jokers")) do
				for __, other in ipairs(area.cards) do
					if other.ability and other.ability.set == "Joker" and other ~= joker then
						SMODS.debuff_card(other, false, "j_abn_drama_masks")
					end
				end
			end
		end
	end,
	calculate = function(self, joker, context)
		if context.setting_blind and not context.blueprint then
			local rarities = {}
			for _, area in ipairs(SMODS.get_card_areas("jokers")) do
				for __, other in ipairs(area.cards) do
					if other.ability and other.ability.set == "Joker" and other ~= joker and not other.debuff then
						table.insert(rarities, other.config.center.rarity)
					end
				end
			end
			local rarity = pseudorandom_element(rarities, "j_abn_drama_masks")
			if rarity then
				joker.ability.extra.rarity = rarity
				for _, area in ipairs(SMODS.get_card_areas("jokers")) do
					for __, other in ipairs(area.cards) do
						if other.ability and other.ability.set == "Joker" and other ~= joker then
							if other.config.center.rarity == rarity then
								SMODS.debuff_card(other, true, "j_abn_drama_masks")
							else
								SMODS.debuff_card(other, false, "j_abn_drama_masks")
							end
						end
					end
				end
				return {message = SMODS.Rarity:get_rarity_badge(rarity), colour = G.C.RARITY[rarity]}
			end
		elseif context.before and not context.blueprint then
			for _, area in ipairs(SMODS.get_card_areas("jokers")) do
				for __, other in ipairs(area.cards) do
					if other.ability and other.ability.set == "Joker" and other.debuff and ABN.is_modded_rarity(other.config.center.rarity) then
						SMODS.scale_card(joker, {
							ref_table = joker.ability.extra,
							ref_value = "asc",
							scalar_value = "asc_gain"
						})
					end
				end
			end
		elseif context.joker_main then
			for _, area in ipairs(SMODS.get_card_areas("jokers")) do
				for __, other in ipairs(area.cards) do
					if other.ability and other.ability.set == "Joker" and other.debuff  then
						SMODS.calculate_effect({x_mult = joker.ability.extra.xmult}, other)
					end
				end
			end
			return {asc = joker.ability.extra.asc}
		end
	end,
	abn_artist_credits = {
		artist = "KewemTheBalkabagi"
	},
	in_pool = function(self, args)
		return G.GAME.abn_newestia
	end
}
