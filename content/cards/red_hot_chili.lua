-- Red Hot Chili (code by Noodlemire)

SMODS.Joker {
	key = "red_hot_chili",
	atlas = "ABNJokerSheet27",
	rarity = 2,
	cost = 6,
	pos = {x = 8, y = 0},
	blueprint_compat = true,
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
	end,
	calculate = function(self, joker, context)
		if context.after and SMODS.last_hand_oneshot then
			return {level_up = true, message = localize("k_level_up_ex")}
		end
	end,
	abn_artist_credits = {
		artist = "KewemTheBalkabagi"
	},
	in_pool = function(self, args)
		return G.GAME.abn_newestia
	end
}
