-- Mime Business (code by Noodlemire)

-- See lovely/g_play_scoring_g_hand_end_of_round.toml for various added context used for this joker's function.

SMODS.Joker {
	key = "mime_business",
	atlas = "ABNJokerSheet27",
	rarity = 3,
	cost = 8,
	pos = {x = 4, y = 0},
	blueprint_compat = true,
	config = {extra = {xmult = 1, xmult_gain = 0.1}},
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		return {vars = {joker.ability.extra.xmult_gain, joker.ability.extra.xmult}}
	end,
	calculate = function(self, joker, context)
		if context.individual and context.cardarea == G.play then
			local other_context = {}
			for k, v in pairs(context) do
				other_context[k] = v
			end
			other_context.cardarea = G.hand
			SMODS.score_card(context.other_card, other_context)
		elseif context.after and SMODS.last_hand_score + G.GAME.chips >= G.GAME.blind.chips then
			local other_context = {}
			for k, v in pairs(context) do
				other_context[k] = v
			end
			other_context.after = nil
			other_context.end_of_round = true
			other_context.beat_boss = G.GAME.blind.boss or false
			other_context.cardarea = G.hand
			other_context.abn_but_calculate_these_other_cards_instead = G.play.cards
			SMODS.calculate_end_of_round_effects(other_context)
		elseif context.abn_post_playing_card_trigger and context.other_card.area == G.play and context.cardarea == G.hand and not context.blueprint then
			SMODS.scale_card(joker, {
				ref_table = joker.ability.extra,
				ref_value = "xmult",
				scalar_value = "xmult_gain"
			})
		elseif context.joker_main then
			return {x_mult = joker.ability.extra.xmult}
		end
	end,
	abn_artist_credits = {
		artist = "KewemTheBalkabagi"
	},
	in_pool = function(self, args)
		return G.GAME.abn_newestia
	end
}
