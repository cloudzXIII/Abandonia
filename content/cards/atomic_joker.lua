-- Atomic Joker (code by Noodlemire)
-- See context/misc/atomic.lua for the bulk of this card's effect

SMODS.Joker{
	key = "atomic_joker",
	atlas = "ABNJokerSheet23",
	rarity = 2,
	cost = 6,
	pos = {x = 7, y = 5},
	blueprint_compat = true,
	calculate = function(self, joker, context)
		if context.abn_atomic_effect_chosen then
			return {
				message = localize("k_duplicated_ex"),
				func = function()
					G.GAME.abn_copying_from_atomic_joker = true
					context.center:use(context.card, context.card.area)
				end
			}
		end
	end,
	abn_artist_credits = {
		artist = "Tatsu"
	},
	in_pool = function(self, args)
		return G.GAME.abn_atomic_card_played
	end
}
