-- Joker of Recca (code by Noodlemire)

--[[
Darkner/Lightner enhanced Jokers will
not be destroyed by hands that have
too many of the opposite suit type

Reversal Darkner cards give +#1# Chips and +#2# Mult
Reversal Lightner cards give +#3# Chips and +#4# Mult

If this joker is Abandoned, it
gains X#5# Mult for each scoring
Darkner card and X#6# Chips for
each scoring Lightner card
(Currently X#7# Mult, X#8# Chips)
--]]

SMODS.Joker{
	key = "joker_of_recca",
	atlas = "ABNJokerSheet26",
	rarity = 3,
	cost = 8,
	pos = {x = 1, y = 1},
	blueprint_compat = true,
	config = {extra = {
		dark_chips = 20, dark_mult = 5,
		light_chips = 5, light_mult = 20,
		xmult_gain = 0.25, xmult = 1,
		xchips_gain = 0.25, xchips = 1,
	}},
	loc_vars = function(self, info_queue, joker)
		if not joker.ability.abn_stk_darkner then
			info_queue[#info_queue + 1] = {key = "abn_stk_darkner", set = "Other", vars = ABN.enh_stickers_vars.abn_stk_darkner}
		end
		if not joker.ability.abn_stk_lightner then
			info_queue[#info_queue + 1] = {key = "abn_stk_lightner", set = "Other", vars = ABN.enh_stickers_vars.abn_stk_lightner}
		end
		if not joker.edition or joker.edition.key ~= "e_abn_reversal" then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_reversal
		end
		if not joker.edition or joker.edition.key ~= "e_abn_abandond" then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
		end
		local jae = joker.ability.extra
		return {vars = {jae.dark_chips, jae.dark_mult, jae.light_chips, jae.light_mult, jae.xmult_gain, jae.xchips_gain, jae.xmult, jae.xchips}}
	end,
	calculate = function(self, joker, context)
		if context.before and not context.blueprint and joker.edition and joker.edition.key == "e_abn_abandond" then
			local darks, lights = 0, 0
			for _, card in ipairs(context.scoring_hand) do
				if SMODS.has_enhancement(card, "m_abn_darkner") then darks = darks + 1 end
				if SMODS.has_enhancement(card, "m_abn_lightner") then lights = lights + 1 end
			end
			if darks > 0 then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "xmult",
					scalar_value = "xmult_gain",
					operation = function(ref_table, ref_value, initial, change)
						ref_table[ref_value] = initial + change * darks
					end,
					no_message = true
				})
			end
			if lights > 0 then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "xchips",
					scalar_value = "xchips_gain",
					operation = function(ref_table, ref_value, initial, change)
						ref_table[ref_value] = initial + change * lights
					end,
					no_message = true
				})
			end
			if darks > 0 or lights > 0 then
				return {message = localize("k_upgrade_ex")}
			end
		elseif context.individual and context.cardarea == G.play and context.other_card.edition and context.other_card.edition.key == "e_abn_reversal" then
			if SMODS.has_enhancement(context.other_card, "m_abn_darkner") then
				SMODS.calculate_effect({
					chips = joker.ability.extra.dark_chips,
					mult = joker.ability.extra.dark_mult,
					message_card = context.other_card
				}, joker)
			end
			if SMODS.has_enhancement(context.other_card, "m_abn_lightner") then
				SMODS.calculate_effect({
					chips = joker.ability.extra.light_chips,
					mult = joker.ability.extra.light_mult,
					message_card = context.other_card
				}, joker)
			end
		elseif context.joker_main then
			return {
				Xmult = joker.ability.extra.Xmult,
				Xchips = joker.ability.extra.Xchips
			}
		end
	end,
	abn_artist_credits = {
		artist = "Comkyel"
	},
	in_pool = function(self, args)
		for _, area in ipairs(SMODS.get_card_areas("jokers")) do
        	for __, joker in pairs(area.cards or {}) do
				if type(joker) == "table" and (joker.ability.abn_stk_darkner or joker.ability.abn_stk_lightner) then
					return true
				end
			end
		end
		return false
	end
}
