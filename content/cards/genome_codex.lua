-- Genome Codex (code by Noodlemire)

SMODS.Joker{
	key = "genome_codex",
	atlas = "ABNJokerSheet16",
	rarity = 3,
	cost = 8,
	pos = {x = 0, y = 3},
	blueprint_compat = true,
	config = {extra = {xmult = 1, xmult_gain = 0.7, xchips = 1, xchips_gain = 0.7, asc = 0, asc_gain = 0.25}},
	loc_vars = function(self, info_queue, joker)
		local jae = joker.ability.extra
		return {vars = {jae.xmult_gain, jae.xmult, jae.xchips_gain, jae.xchips, jae.asc_gain, jae.asc}}
	end,
	calculate = function(self, joker, context)
		if context.before and not context.blueprint then
			if G.GAME.current_round.hands_left + 1 == G.GAME.hands[context.scoring_name].level then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "xmult",
					scalar_value = "xmult_gain",
					message_colour = G.C.RED
				})
			end
			if G.GAME.current_round.discards_left == G.GAME.hands[context.scoring_name].level then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "xchips",
					scalar_value = "xchips_gain",
					message_colour = G.C.BLUE
				})
			end
			local edi_cons = 0
			for _, card in ipairs(G.consumeables.cards) do
				if card.ability and card.ability.set ~= "Joker" and card.edition and card.sell_cost then
					edi_cons = edi_cons + card.sell_cost
				end
			end
			if edi_cons > 0 then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "asc",
					scalar_value = "asc_gain",
					message_colour = G.C.YELLOW,
					operation = function(ref_table, ref_value, initial, change)
						ref_table[ref_value] = initial + change * edi_cons
					end,
				})
			end
		elseif context.joker_main then
			return {
				x_mult = joker.ability.extra.xmult,
				x_chips = joker.ability.extra.xchips,
				asc = joker.ability.extra.asc
			}
		end
	end,
	abn_artist_credits = {
		artist = "Comykel"
	},
}
