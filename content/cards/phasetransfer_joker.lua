-- Phasetransfer Joker (code by Noodlemire)

SMODS.Joker{
	key = "phasetransfer_joker",
	atlas = "ABNJokerSheet21",
	rarity = 3,
	cost = 10,
	pos = {x = 9, y = 0},
	blueprint_compat = false,
	config = {extra = {rate = 0.01}},
	loc_vars = function(self, info_queue, joker)
		return {vars = {joker.ability.extra.rate}}
	end,
	abn_artist_credits = {
		artist = "Super Thing"
	},
}

local mult_map = {
	mult = "plus_asc",
	h_mult = "plus_asc",
	mult_mod = "plusasc_mod"
}

local old_calc = SMODS.calculate_effect
function SMODS.calculate_effect(effect, scored_card, from_edition, pre_jokers)
	if next(SMODS.find_card("j_abn_phasetransfer_joker")) and scored_card.ability.set == "Joker" then
		local phasetransfers = SMODS.find_card("j_abn_phasetransfer_joker")
		if #phasetransfers > 0 then
			local rate = phasetransfers[1].ability.extra.rate
			for mult, asc in pairs(mult_map) do
				if effect[mult] then
					effect[asc] = (effect[asc] or 0) + effect[mult] * rate
					effect[mult] = nil
					if mult == "mult_mod" and effect.message:sub(1, 1) == "+" and effect.message:sub(effect.message:len()-3, effect.message:len()):lower() == "mult" then
						effect.message = nil
					end
				end
			end
		end
	end
	return old_calc(effect, scored_card, from_edition, pre_jokers)
end
