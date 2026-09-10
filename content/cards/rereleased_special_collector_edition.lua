-- Re-Released Special Collector Edition (code by Noodlemire)

--[[
If scored hand consists entirely of cards with Editions,
and it has an even amount of Vanilla Editions and an odd
number of Modded Editions, or it has an odd amount of
Vanilla Editions and an even number of Modded
Editions, this Joker gains +0.01 Ascension Power
multiplied by whichever Edition count is even.
(Currently +0 Ascension Power)
--]]

SMODS.Joker{
	key = "rereleased_special_collector_edition",
	atlas = "ABNJokerSheet21",
	rarity = 1,
	cost = 6,
	pos = {x = 1, y = 4},
	blueprint_compat = true,
	config = {extra = {asc = 0, asc_gain = 0.01}},
	loc_vars = function(self, info_queue, joker)
		return {vars = {joker.ability.extra.asc, joker.ability.extra.asc_gain}}
	end,
	calculate = function(self, joker, context)
		if context.joker_main then
			return {plus_asc = joker.ability.extra.asc}
		elseif context.before and not context.blueprint then
			local van_edi, mod_edi = 0, 0
			for _, card in ipairs(context.scoring_hand) do
				if not card.edition then return end
				if SMODS.Centers[card.edition.key].original_mod then
					mod_edi = mod_edi + 1
				else
					van_edi = van_edi + 1
				end
			end
			if van_edi > 0 and mod_edi > 0 and van_edi % 2 ~= mod_edi % 2 then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "asc",
					scalar_value = "asc_gain",
					message_colour = G.C.GOLD,
					operation = function(ref_table, ref_value, initial, change)
						ref_table[ref_value] = initial + change * (van_edi % 2 == 0 and van_edi or mod_edi)
					end,
				})
			end
		end
	end,
	abn_artist_credits = {
		artist = "0kronix"
	},
	in_pool = function(self, args)
		local van_edi, mod_edi = false, false
		for _, card in ipairs(G.playing_cards or {}) do
			if card.edition then
				if SMODS.Centers[card.edition.key].original_mod then
					mod_edi = true
				else
					van_edi = true
				end
			end
			if van_edi and mod_edi then return true end
		end
		return false
	end
}
