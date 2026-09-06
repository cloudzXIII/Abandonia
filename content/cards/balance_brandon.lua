-- Balance Brandon (code by Noodlemire)
SMODS.Joker{
	key = "balance_brandon",
	atlas = "ABNJokerSheet21",
	rarity = 3,
	cost = 8,
	pos = {x = 7, y = 2},
	blueprint_compat = false,
	config = {extra = {rate = 0.1}},
	loc_vars = function(self, info_queue, joker)
		return {vars = {joker.ability.extra.rate}}
	end,
	calculate = function(self, joker, context)
		if context.blueprint then return end
		if joker.ability.abn_stk_mult and context.individual and context.cardarea == G.hand and SMODS.has_enhancement(context.other_card, "m_mult") and not context.end_of_round then
			return {mult = SMODS.Stickers.abn_stk_mult.config.extra.mult}
		end
	end,
	abn_artist_credits = {
		artist = "Super Thing"
	},
}

local mult_map = {
	mult = "xmult",
	h_mult = "xmult",
	mult_mod = "Xmult_mod"
}

local old_calc = SMODS.calculate_effect
function SMODS.calculate_effect(effect, scored_card, from_edition, pre_jokers)
	local brandons = SMODS.find_card("j_abn_balance_brandon")
	if #brandons > 0 then
		local rate = brandons[1].ability.extra.rate
		for mult, xmult in pairs(mult_map) do
			if effect[mult] then
				effect[xmult] = (effect[xmult] or 1) + effect[mult] * rate
				effect[mult] = nil
				if mult == "mult_mod" and (not effect.message or (effect.message:sub(1, 1) == "+" and effect.message:sub(effect.message:len()-3, effect.message:len()):lower() == "mult")) then
					effect.message = "X"..effect[xmult].." Mult"
				end
			end
		end
	end
	return old_calc(effect, scored_card, from_edition, pre_jokers)
end
