-- Unhinged Umar (code by Noodlemire)
SMODS.Joker{
	key = "unhinged_umar",
	atlas = "ABNJokerSheet21",
	rarity = 3,
	cost = 8,
	pos = {x = 8, y = 2},
	blueprint_compat = false,
	config = {extra = {rate = 0.1}},
	loc_vars = function(self, info_queue, joker)
		return {vars = {joker.ability.extra.rate}}
	end,
	calculate = function(self, joker, context)
		if context.blueprint then return end
		if joker.ability.abn_stk_bonus and context.individual and context.cardarea == G.hand and SMODS.has_enhancement(context.other_card, "m_bonus") and not context.end_of_round then
			return {chips = SMODS.Stickers.abn_stk_bonus.config.extra.chips}
		end
	end,
	abn_artist_credits = {
		artist = "Super Thing"
	},
}

local chip_map = {
	chips = "xchips",
	h_chips = "xchips",
	chip_mod = "Xchip_mod"
}

local old_calc = SMODS.calculate_effect
function SMODS.calculate_effect(effect, scored_card, from_edition, pre_jokers)
	local brandons = SMODS.find_card("j_abn_balance_brandon")
	if #brandons > 0 then
		local rate = brandons[1].ability.extra.rate
		for chips, xchips in pairs(chip_map) do
			if effect[chips] then
				effect[xchips] = (effect[xchips] or 1) + effect[chips] * rate
				effect[chips] = nil
				if chips == "chip_mod" and (not effect.message or (effect.message:sub(1, 1) == "+" and (effect.message:sub(effect.message:len()-3, effect.message:len()):lower() == "chips" or (scored_card.config and scored_card.config.center and not scored_card.config.center.original_mod)))) then
					effect.message = "X"..effect[xchips].." Chips"
				end
			end
		end
	end
	return old_calc(effect, scored_card, from_edition, pre_jokers)
end
