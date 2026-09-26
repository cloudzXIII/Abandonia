local function permabonus(card, type, amount, c)
	card.ability[type] = card.ability[type] or 0
	card.ability[type] = card.ability[type] + amount
	ABN.msg(card, localize("k_upgrade_ex"), nil, c)
end

SMODS.Joker({
	key = "color_dismissal",
	rarity = 2,
	atlas = "ABNJokerSheet23",
	pos = { x = 9, y = 4 },
	cost = 6,
	discovered = false,
	blueprint_compat = false,
	abn_artist_credits = {
		artist = "KewemTheBalkabagi",
	},
	config = {
		extra = {
			pmult = 5,
			pchips = 10,
		},
	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.pchips, card.ability.extra.pmult } }
	end,
	calculate = function(self, card, context)
		if context.individual and not context.repetition and context.cardarea == G.play then
			local _card = context.other_card
			if _card:get_id() % 2 == 0 then
				_card:juice_up()
				SMODS.change_base(_card, "abn_suitless")
				permabonus(_card, "perma_bonus", card.ability.extra.pchips, G.C.CHIPS)
				play_sound("generic1")
			else
				_card:juice_up()
				SMODS.change_base(_card, "abn_Vortex")
				permabonus(_card, "perma_mult", card.ability.extra.pmult, G.C.MULT)
				play_sound("generic1")
			end
		end
	end,
})
