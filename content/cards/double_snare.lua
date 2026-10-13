-- Double Snare (code by Noodlemire)

SMODS.Joker{
	key = "double_snare",
	atlas = "ABNJokerSheet16",
	rarity = 3,
	cost = 8,
	pos = {x = 6, y = 5},
	blueprint_compat = true,
	calculate = function(self, joker, context)
		if context.debuff_hand and not context.blueprint then
			local debuff = context.scoring_name ~= "Pair" and context.scoring_name ~= "Two Pair"
			if not debuff then
				local vanilla_suit, modded_suit = false, false
				for _, card in ipairs(context.scoring_hand) do
					if ABN.is_modded_suit(card) then
						modded_suit = true
					elseif ABN.is_vanilla_suit(card) then
						vanilla_suit = true
					end
					if modded_suit and vanilla_suit then break end
				end
				if not vanilla_suit or not modded_suit then
					debuff = true
				end
			end
			if debuff then
				local desc = G.localization.descriptions.Joker.j_abn_double_snare.text[1]
				local desc_str = desc[1]
				for i = 2, #desc do
					desc_str = desc_str..' '..desc[i]
				end
				return {
					debuff = true,
					debuff_text = desc_str:gsub("{.-}", "")
				}
			end
		elseif context.individual and context.cardarea == G.play then
			if ABN.is_modded_suit(context.other_card) then
				return {amp = context.other_card.base.nominal}
			elseif ABN.is_vanilla_suit(context.other_card) then
				return {modulate = context.other_card.base.nominal}
			end
		end
	end,
	abn_artist_credits = {
		artist = "Da Gorbage Rat"
	},
	in_pool = function(self, args)
		for _, card in ipairs(G.playing_cards or {}) do
			if ABN.is_modded_suit(card) then
				return true
			end
		end
		return false
	end
}
