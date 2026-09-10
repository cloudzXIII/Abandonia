-- GTP Joker
SMODS.Joker{
	key = "gtp_joker",
	atlas = "ABNJokerSheet24",
	rarity = 3,
	cost = 8,
	pos = {x = 8, y = 4},
	soul_pos = {x = 1, y = 6},
	blueprint_compat = true,
	config = {extra = {xmult = 2, xchips = 2, hand = "High Card"}},
	loc_vars = function(self, info_queue, joker)
		if joker.ability.extra.hand == "High Card" then
			return {vars = {joker.ability.extra.xmult, joker.ability.extra.xchips}}
		else
			return {key = self.key.."_after", vars = {joker.ability.extra.xmult, joker.ability.extra.xchips, joker.ability.extra.hand}}
		end
	end,
	calculate = function(self, joker, context)
		if context.initial_scoring_step then
			if joker.ability.extra.hand ~= "High Card" and joker.ability.extra.hand == context.scoring_name then
				return {
					xmult = joker.ability.extra.xmult,
					xchips = joker.ability.extra.xchips
				}
			end
		end
		if context.blueprint then return end
		if context.after then
			joker.ability.extra.hand = context.scoring_name
		elseif context.end_of_round and context.main_eval then
			joker.ability.extra.hand = "High Card"
		end
	end,
	abn_artist_credits = {
		artist = "CebeeDrawz"
	},
}
