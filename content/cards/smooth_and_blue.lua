-- Smooth and Blue (code by Noodlemire)

SMODS.Joker{
	key = "smooth_and_blue",
	atlas = "ABNJokerSheet27",
	rarity = 3,
	cost = 8,
	pos = {x = 3, y = 0},
	blueprint_compat = true,
	config = {extra = {chips_gain = 31, chips_gain_gain = 31, evens = 5, asc = 0, asc_gain = 5}},
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		local jae = joker.ability.extra
		return {vars = {jae.chips_gain, jae.chips_gain_gain, jae.asc_gain, jae.evens, jae.asc}}
	end,
	calculate = function(self, joker, context)
		if context.before and not context.blueprint then
			local evens = 0
			for _, card in ipairs(G.play.cards) do
				if ABN.is_even(card) then
					evens = evens + 1
				end
			end
			if evens >= joker.ability.extra.evens then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "asc",
					scalar_value = "asc_gain",
					message_colour = G.C.YELLOW
				})
			end
		elseif context.individual and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 then
			if context.other_card == context.scoring_hand[1] then
				SMODS.scale_card(context.other_card, {
					ref_table = context.other_card.ability,
					ref_value = "perma_bonus",
					scalar_table = joker.ability.extra,
					scalar_value = "chips_gain",
					message_colour = G.C.BLUE
				})
			elseif context.other_card ~= context.scoring_hand[1] and not context.blueprint then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "chips_gain",
					scalar_value = "chips_gain_gain",
					message_colour = G.C.BLUE
				})
			end
		elseif context.joker_main then
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
