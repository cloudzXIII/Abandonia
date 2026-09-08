-- Spitting Imagine (code by Noodlemire)

SMODS.Joker{
	key = "spitting_imagine",
	atlas = "ABNJokerSheet22",
	rarity = 2,
	cost = 4,
	pos = {x = 5, y = 2},
	blueprint_compat = true,
	config = {extra = {mult = 0, chips = 0}},
	loc_vars = function(self, info_queue, joker)
		return {vars = {joker.ability.extra.mult, joker.ability.extra.chips}}
	end,
	calculate = function(self, joker, context)
		if context.joker_main then
			return {mult = joker.ability.extra.mult, chips = joker.ability.extra.chips}
		end
	end,
	abn_artist_credits = {
		artist = "Tisisrealnow"
	},
}

local old_copy_card = copy_card
function copy_card(other, new_card, card_scale, playing_card, strip_edition)
	if other.playing_card then
		for _, joker in ipairs(SMODS.find_card("j_abn_spitting_imagine")) do
			if ABN.is_even(other) then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "mult",
					scalar_table = other.base,
					scalar_value = "nominal",
					message_key = "a_mult",
					message_colour = G.C.RED
				})
			end
			if ABN.is_odd(other) then
				SMODS.scale_card(joker, {
					ref_table = joker.ability.extra,
					ref_value = "chips",
					scalar_table = other.base,
					scalar_value = "nominal",
					message_key = "a_chips",
					message_colour = G.C.BLUE
				})
			end
		end
	end
	return old_copy_card(other, new_card, card_scale, playing_card, strip_edition)
end
