-- Gamma Ray Joker (code by Noodlemire)

--[[
Scoring flux cards in your
winning hand gain X2 the
score they would otherwise get

Whenever any joker's Collodion
edition triggers, resulting Chips
and Mult scores will be raised by 2

If this joker has the Flux
enhancement, each scoring card gives
+Score equal to X100 its rank
--]]

SMODS.Joker{
	key = "gamma_ray_joker",
	atlas = "ABNJokerSheet8",
	rarity = 3,
	cost = 6,
	pos = {x = 4, y = 4},
	blueprint_compat = true,
	config = {extra = {fluxboost = 2, collboost = 2, score = 100}},
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		if not joker.ability.abn_stk_flux then
			info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_flux
		end
		if not joker.edition or joker.edition.key ~= "e_abn_collodion" then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_collodion
		end
		return {vars = {joker.ability.extra.fluxboost, joker.ability.extra.collboost, joker.ability.extra.score}}
	end,
	calculate = function(self, joker, context)
		if context.scaling_card and context.abn_flux_scaling then
			context.scalar = context.scalar * joker.ability.extra.fluxboost
			return {message_card = context.card, message = localize({type = "variable", key = "a_xscore", vars = {joker.ability.extra.fluxboost}})}
		elseif context.other_joker and context.other_joker.edition and context.other_joker.edition.key == "e_abn_collodion" then
			return {
				chips = joker.ability.extra.collboost,
				mult = joker.ability.extra.collboost,
				message_card = context.other_joker
			}
		elseif context.individual and context.cardarea == G.play and joker.ability.abn_stk_flux then
			return {
				score = context.other_card.base.nominal * joker.ability.extra.score
			}
		end
	end,
	abn_artist_credits = {
		artist = "Null"
	},
	in_pool = function(self, args)
		if not G.GAME.abn_newestia then return false end
		for _, card in ipairs(G.playing_cards or {}) do
			if SMODS.has_enhancement(card, "m_abn_flux") or (card.edition and card.edition.key == "e_abn_collodion") then
				return true
			end
		end
		return false
	end
}
