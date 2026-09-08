-- Entitled Fool (code by Noodlemire)

--[[
Gains X0.25 Chips or X0.25 Mult
each time you score the exact same
odd or even ranked Tile Card,
respectively, more than once in a round
(Currently X1 Chips, X1 Mult)
--]]

SMODS.Joker{
	key = "entitled_fool",
	atlas = "ABNJokerSheet22",
	rarity = 2,
	cost = 6,
	pos = {x = 5, y = 4},
	blueprint_compat = true,
	config = {extra = {xmult = 1, xmult_rate = 0.25, xchips = 1, xchips_rate = 0.25, scored_tiles = {}}},
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_tile
		return {vars = {joker.ability.extra.xchips_rate, joker.ability.extra.xmult_rate, joker.ability.extra.xchips, joker.ability.extra.xmult}}
	end,
	calculate = function(self, joker, context)
		if context.joker_main then
			return {x_mult = joker.ability.extra.xmult, x_chips = joker.ability.extra.xchips}
		elseif context.blueprint then
			return
		end
		if context.setting_blind then
			joker.ability.extra.scored_tiles = {}
		elseif context.before then
			for _, card in ipairs(context.scoring_hand) do
				if SMODS.has_enhancement(card, "m_abn_tile") then
					if not joker.ability.extra.scored_tiles[card.sort_id] then
						joker.ability.extra.scored_tiles[card.sort_id] = true
					elseif ABN.is_even(card) then
						SMODS.scale_card(joker, {
							ref_table = joker.ability.extra,
							ref_value = "xmult",
							scalar_value = "xmult_rate",
							scaling_message = {
								message = localize({type = "variable", key = "a_xmult", vars = {joker.ability.extra.xmult_rate}}),
								colour = G.C.RED
							}
						})
					elseif ABN.is_odd(card) then
						SMODS.scale_card(joker, {
							ref_table = joker.ability.extra,
							ref_value = "xchips",
							scalar_value = "xchips_rate",
							message_key = "a_xchips",
							message_colour = G.C.BLUE
						})
					end
				end
			end
		end
	end,
	abn_artist_credits = {
		artist = "Tisisrealnow"
	},
	in_pool = function(self, args)
		for _, card in ipairs(G.playing_cards or {}) do
			if SMODS.has_enhancement(card, "m_abn_tile") then
				return true
			end
		end
		return false
	end
}
