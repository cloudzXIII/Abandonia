-- Eccentric Artist (code by Noodlemire)

SMODS.Joker{
	key = "eccentric_artist",
	atlas = "ABNJokerSheet23",
	rarity = 3,
	cost = 8,
	pos = {x = 9, y = 1},
	blueprint_compat = true,
	config = {extra = {van_chips = 10, van_mult = 4, mod_chips = 30, mod_mult = 8, full_chips = 200, full_mult = 40}},
	loc_vars = function(self, info_queue, joker)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_kinship
		return {vars = {
			joker.ability.extra.van_chips, joker.ability.extra.van_mult,
			joker.ability.extra.mod_chips, joker.ability.extra.mod_mult,
			joker.ability.extra.full_chips, joker.ability.extra.full_mult,
		}}
	end,
	calculate = function(self, joker, context)
		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_abn_kinship") and context.other_card.edition and not SMODS.Suits[context.other_card.base.suit].original_mod == not SMODS.Centers[context.other_card.edition.key].original_mod then
			if SMODS.Suits[context.other_card.base.suit].original_mod then
				return {mult = joker.ability.extra.mod_mult, chips = joker.ability.extra.mod_chips}
			else
				return {mult = joker.ability.extra.van_mult, chips = joker.ability.extra.van_chips}
			end
		elseif context.joker_main then
			for _, card in ipairs(G.playing_cards) do
				if not SMODS.has_enhancement(card, "m_abn_kinship") then
					return
				end
			end
			return {mult = joker.ability.extra.full_mult, chips = joker.ability.extra.full_chips}
		end
	end,
	abn_artist_credits = {
		artist = "GM36"
	},
	in_pool = function(self, args)
		for _, card in ipairs(G.playing_cards or {}) do
			if SMODS.has_enhancement(card, "m_abn_kinship") and SMODS.Suits[card.base.suit].original_mod then
				return true
			end
		end
		return false
	end
}
