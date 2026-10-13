-- Erutinegomirp Joker (code by Noodlemire)

SMODS.Joker{
	key = "erutinegomirp_joker",
	atlas = "ABNJokerSheet16",
	rarity = 3,
	cost = 8,
	pos = {x = 8, y = 5},
	blueprint_compat = true,
	config = {extra = {match = false}},
	calculate = function(self, joker, context)
		if context.before and not context.blueprint then
			joker.ability.extra.match = false
			local ctype, modded, vanilla = false, false, false
			for _, card in ipairs(G.consumeables.cards) do
				if card.ability and card.ability.consumeable then
					if not ctype then
						ctype = card.ability.set
					elseif ctype ~= card.ability.set then return end
					if card.config.center.original_mod then
						if modded then return end
						modded = true
					else
						if vanilla then return end
						vanilla = true
					end
				end
				if modded and vanilla then
					joker.ability.extra.match = true
				end
			end
		elseif context.other_consumeable and joker.ability.extra.match then
			if context.other_consumeable.config.center.original_mod then
				return {modulate = context.other_consumeable.sell_cost}
			else
				return {amp = context.other_consumeable.sell_cost}
			end
		end
	end,
	abn_artist_credits = {
		artist = "Da Gorbage Rat"
	},
	in_pool = function(self, args)
		local vanilla, modded = false, false
		for _, area in ipairs(SMODS.get_card_areas("jokers")) do
			for __, other in ipairs(area.cards) do
				if other.ability then
					if other.ability.consumeable and other.config.center.original_mod then
						modded = true
					elseif other.ability.set == "Joker" and not other.config.center.original_mod then
						vanilla = true
					end
					if vanilla and modded then return true end
				end
			end
		end
		return false
	end
}
