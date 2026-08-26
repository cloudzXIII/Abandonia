SMODS.Joker({
	key = "answer_sheet",
	rarity = 1,
	atlas = "ABNJokerSheet14",
	pos = { x = 2, y = 4 },
	cost = 4,
	discovered = false,
	blueprint_compat = false,
	config = {
		extra = {
			mult = 0,
			chips = 0,

			mult_gain = 2,
			chip_gain = 5,
		},
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chip_gain,
				card.ability.extra.mult_gain,
				card.ability.extra.chips,
				card.ability.extra.mult,
			},
		}
	end,
	calculate = function(self, card, context)
		if context.pseudorandom_result and context.trigger_obj and context.result then
			local a = context.trigger_obj
			if a.ability then
                if a.ability.consumeable then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "mult",
                        scalar_value = "mult_gain",
                        message_colour = G.C.MULT

                    })
                elseif a.ability.set and a.ability.set == "Joker" then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "chips",
                        scalar_value = "chip_gain",
                        message_colour = G.C.CHIPS

                    })
                end
            end
		end
        if context.joker_main then
            return{
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
	end,
	abn_artist_credits = {
		artist = "Sustato",
	},
})
