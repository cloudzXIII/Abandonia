-- Topsy Turvy Joker (code by Noodlemire)

SMODS.Joker{
	key = "topsy_turvy_joker",
	atlas = "ABNJokerSheet24",
	rarity = 3,
	cost = 8,
	pos = {x = 5, y = 5},
	blueprint_compat = true,
	config = {extra = {mult = 0, boost = 1.5}},
	loc_vars = function(self, info_queue, joker)
		if not joker.edition or joker.edition.key ~= "e_abn_reversal" then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_reversal
		end
		return {vars = {joker.ability.extra.mult, joker.ability.extra.boost}}
	end,
	calculate = function(self, joker, context)
		if context.joker_main then
			return {mult = joker.ability.extra.mult}
		elseif context.abn_post_reversal and context.mult_diff > 0 then
			if not context.blueprint and context.other_card.playing_card then
				joker.ability.extra.mult_diff_cache = context.mult_diff
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "mult",
					scalar_value = "mult_diff_cache"
				})
			end
			if joker.edition and joker.edition.key == "e_abn_reversal" then
				return {mult = context.mult_diff * (joker.ability.extra.boost - 1)}
			end
		end
	end,
	abn_artist_credits = {
		artist = "CebeeDrawz"
	},
	in_pool = function(self, args)
		for _, card in ipairs(G.playing_cards or {}) do
			if card.edition and card.edition.key == "e_abn_reversal" then
				return true
			end
		end
		return false
	end
}

local old_calculate_individual_effect = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
	local mult_cache = nil
	if key == "swap" and from_edition and scored_card.edition and scored_card.edition.key == "e_abn_reversal" then
		for _, joker in ipairs(SMODS.find_card("j_abn_topsy_turvy_joker")) do
			mult_cache = mult
		end
	end
	local ret = old_calculate_individual_effect(effect, scored_card, key, amount, from_edition)
	if mult_cache then
		SMODS.calculate_context({
			abn_post_reversal = true,
			mult_diff = mult - mult_cache,
			other_card = scored_card
		})
	end
	return ret
end
