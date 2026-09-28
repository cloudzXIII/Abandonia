-- Super Horror Mario (code by Noodlemire)

SMODS.Joker{
	key = "super_horror_mario",
	atlas = "ABNJoker72by96",
	rarity = "abn_SuperRare",
	cost = 20,
	pos = {x = 0, y = 0},
	blueprint_compat = true,
	config = {extra = {}},
	calculate = function(self, joker, context)
		if context.before and not context.blueprint then
			joker.ability.extra.destroy_count = 0
			for _, card in ipairs(context.scoring_hand) do
				if not ABN.is_modded_suit(card) then
					joker.ability.extra.destroy_count = joker.ability.extra.destroy_count + 1
				end
			end
		elseif context.individual and context.cardarea == G.play and ABN.is_modded_suit(context.other_card) and joker.ability.extra.destroy_count > 1 then
			return {x_mult = joker.ability.extra.destroy_count, x_chips = joker.ability.extra.destroy_count}
		elseif context.destroy_card and context.cardarea == G.play and not ABN.is_modded_suit(context.destroy_card) then
			return {remove = true}
		end
	end,
	abn_artist_credits = {
		artist = "Revenge"
	},
}
