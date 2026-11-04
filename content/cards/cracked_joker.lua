
SMODS.Joker({
    key = "cracked_joker",
    atlas = "ABNJokerSheet24",
    pos = { x = 4, y = 4 },
    cost = 6,
    rarity = 3,

    config = {extra = {odds = 4, chips = 0}},

    loc_vars = function(self, info_queue, card)
		local num, den = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {vars = {card.ability.extra.chips, num, den}}
    end,

    calculate = function(self, card, context)
		if context.mod_probability and (
				context.identifier == "kintsugi_dup_abn" or
				context.identifier == "kintsugi_db_abn" or
				context.identifier == "abn_stk_kintsugi_1" or
				context.identifier == "abn_stk_kintsugi_2") then
			return {numerator = context.denominator}
		end

        if context.destroy_card and context.cardarea == G.play and not context.blueprint and not SMODS.has_enhancement(context.destroy_card, "m_abn_kintsugi") and SMODS.pseudorandom_probability(card, "j_abn_cracked_joker", 1, card.ability.extra.odds) then
			SMODS.scale_card(card, {
				ref_table = card.ability.extra,
				ref_value = "chips",
				scalar_table = context.destroy_card.base,
				scalar_value = "nominal",
				message_colour = G.C.CHIPS
			})
            return {remove = true}
        end

        if context.joker_main and card.ability.extra.chips ~= 0 then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
})
