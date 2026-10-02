-- There and Back Again (code by Noodlemire)

local chips = {"chips", "h_chips", "chip_mod"}
local mults = {"mult", "h_mult", "mult_mod"}

SMODS.Joker{
	key = "there_and_back_again",
	atlas = "ABNJokerSheet4",
	rarity = 2,
	cost = 6,
	pos = {x = 2, y = 1},
	blueprint_compat = true,
	config = {extra = {mult_boost = 1.05, chip_boost = 1.05, boost_boost = 0.05, multrank = 2}},
	loc_vars = function(self, info_queue, joker)
		if not joker.ability.abn_stk_mult then
			info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
		end
		if not joker.ability.abn_stk_bonus then
			info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
		end
		local jae = joker.ability.extra
		return {vars = {jae.boost_boost, jae.mult_boost, jae.chip_boost, jae.multrank}}
	end,
	calculate = function(self, joker, context)
		if context.individual and context.cardarea == G.play then
			if joker.ability.abn_stk_bonus and SMODS.has_enhancement(context.other_card, "m_mult") then
				return {chips = context.other_card.base.nominal, message_card = context.other_card}
			elseif joker.ability.abn_stk_mult and SMODS.has_enhancement(context.other_card, "m_bonus") then
				return {mult = context.other_card.base.nominal * joker.ability.extra.multrank, message_card = context.other_card}
			end
		elseif context.post_trigger and context.other_card ~= joker and context.other_ret.jokers then
			local other_ret = context.other_ret.jokers
			local swap_ret = {}
			local any_mult, any_chips = false, false
			for i = 1, 3 do
				if other_ret[chips[i]] then
					swap_ret[mults[i]] = other_ret[chips[i]] * joker.ability.extra.mult_boost
					other_ret[chips[i]] = nil
					any_mult = true
				end
				if other_ret[mults[i]] then
					swap_ret[chips[i]] = other_ret[mults[i]] * joker.ability.extra.chip_boost
					other_ret[mults[i]] = nil
					any_chips = true
				end
			end
			if swap_ret.mult_mod and swap_ret.chip_mod then
				swap_ret.message = localize({type = "variable", key = "a_abn_mult_and_chips", vars = {swap_ret.mult_mod, swap_ret.chip_mod}})
			elseif swap_ret.mult_mod then
				swap_ret.message = localize({type = "variable", key = "a_mult", vars = {swap_ret.mult_mod}})
			elseif swap_ret.chip_mod then
				swap_ret.message = localize({type = "variable", key = "a_chips", vars = {swap_ret.chip_mod}})
			end
			for k, v in pairs(swap_ret) do
				other_ret[k] = v
			end
			if not context.blueprint then
				if any_mult then
					SMODS.scale_card(joker, {
						ref_table = joker.ability.extra,
						ref_value = "mult_boost",
						scalar_value = "boost_boost",
						message_colour = G.C.RED
					})
				end
				if any_chips then
					SMODS.scale_card(joker, {
						ref_table = joker.ability.extra,
						ref_value = "chip_boost",
						scalar_value = "boost_boost",
						message_colour = G.C.BLUE
					})
				end
			end
			if any_mult or any_chips then
				return {message = localize("k_swapped_ex")}
			end
		end
	end,
	abn_artist_credits = {
		artist = "Shai1n"
	},
}
