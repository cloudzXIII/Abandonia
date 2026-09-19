SMODS.Joker({
	key = "hipster",
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return {
			vars = {
				cae.perma_mult,
			},
		}
	end,

	rarity = 2,
	atlas = "ABNJokerSheet26",
	pos = { x = 5, y = 3 },
	cost = 6,
	discovered = false,
	blueprint_compat = true,

	config = {
		extra = {
			perma_mult = 20,
		},
	},
	calculate = function(self, card, context)
		local cae = card.ability.extra
		if
			context.individual
			and context.other_card
			and SMODS.Ranks
			and SMODS.Ranks[context.other_card.base.value].mod
			and context.cardarea == G.play
			and not context.other_card.config.center.no_rank
		then
			context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0)
				+ card.ability.extra.perma_mult
			return {
				message = localize("k_upgrade_ex"),
				colour = G.C.MULT,
			}
		end
	end,

	abn_artist_credits = {
		artist = "La Ginger",
	},
})
