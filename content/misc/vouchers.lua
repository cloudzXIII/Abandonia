SMODS.Voucher({ -- Overstock Maximum
	key = "overstock_maximum",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 0,
		y = 0,
	},
	config = {
		extra = {
			inc = 1,
		},
	},
	cost = 10,
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.inc } }
	end,
	requires = { "v_overstock_plus" },
	redeem = function(self, card)
		local cae = card.ability.extra
		change_shop_size(cae.inc)
	end,
})

SMODS.Voucher({ -- Tarot Master
	key = "tarot_master",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 1,
		y = 0,
	},
	config = {
		extra = {},
	},
	cost = 10,
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
	end,
	requires = { "v_tarot_tycoon" },
	redeem = function(self, card)
		local cae = card.ability.extra
		G.GAME.modifiers.abn_tarot_odd = true
	end,
})

SMODS.Voucher({
	key = "planet_master",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 2,
		y = 0,
	},
	config = {
		extra = {},
	},
	cost = 10,
	requires = { "v_planet_tycoon" },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		G.GAME.modifiers.abn_planet_odd = true
	end,
})

SMODS.Voucher({
	key = "money_master",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 3,
		y = 0,
	},
	config = {
		extra = {
			discount = 70,
		},
	},
	cost = 10,
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.discount } }
	end,
	requires = { "v_liquidation" },
	redeem = function(self, card)
		local cae = card.ability.extra
		G.GAME.discount_percent = cae.discount
	end,
})

SMODS.Voucher({
	key = "glow_master",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 4,
		y = 0,
	},
	config = {
		extra = {
		},
	},
	requires = { "v_glow_up" },
	cost = 10,
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		G.GAME.modifiers.abn_all_edition = true
	end,

})

SMODS.Voucher({
	key = "food_master",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 5,
		y = 0,
	},
	config = {
		extra = {
			lim = 1
		},
	},
	cost = 10,
	requires = { "v_nacho_tong" },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.lim } }
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		SMODS.change_play_limit(cae.lim)
	end,
})
SMODS.Voucher({
	key = "recycle_master",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 6,
		y = 0,
	},
	config = {
		extra = {
			lim = 1
		},
	},
	cost = 10,
	requires = { "v_recyclomancy" },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.lim } }
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		SMODS.change_discard_limit(cae.lim)
	end,
})

SMODS.Voucher({
	key = "negative_master",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 7,
		y = 0,
	},
	config = {
		extra = {
			lim = 2
		},
	},
	requires = { "v_antimatter" },
	cost = 10,
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.lim } }
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		G.jokers.config.card_limit = G.jokers.config.card_limit + cae.lim
	end,
})
SMODS.Voucher({
	key = "reroll_master",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 0,
		y = 1,
	},
	config = {
		extra = {
		},
	},
	cost = 10,
	requires = { "v_reroll_glunt" },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.lim } }
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		G.GAME.modifiers.abn_no_reroll_increase = true
	end,
})

SMODS.Voucher({
	key = "gold_tree",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 1,
		y = 1,
	},
	config = {
		extra = {
			interest = 30
		},
	},
	cost = 10,
	requires = { "v_money_tree" },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.interest } }
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.interest_cap = cae.interest
				return true
			end
		}))
	end,
})

SMODS.Voucher({
	key = "cataclysm_globe",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 2,
		y = 1,
	},
	config = {
		extra = {
			interest = 30
		},
	},
	cost = 10,
	requires = { "v_omen_globe" },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.lim } }
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		G.GAME.modifiers.abn_guarantee_spectral_in_tarot = true
	end,
})

SMODS.Voucher({
	key = "satellite",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 3,
		y = 1,
	},
	config = {
		extra = {
			interest = 30
		},
	},
	cost = 10,
	requires = { "v_observatory" },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.lim } }
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.main_eval then
			for k, v in pairs(G.consumeables.cards) do
				if v.ability.set == "Planet" and not (v.edition and v.edition.negative) then
					v:set_edition("e_negative")
				end
			end
		end
	end
})

SMODS.Voucher({
	key = "illusion_master",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 4,
		y = 1,
	},
	config = {
		extra = {
		},
	},
	requires = { "v_illusion" },
	cost = 10,
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		G.GAME.abn_guarantee_double_modif = true
	end
})

SMODS.Voucher({
	key = "forget_fossil",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 5,
		y = 1,
	},
	config = {
		extra = {
			ante = 2
		},
	},
	requires = { "v_petroglyph" },
	cost = 10,
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.ante } }
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		ease_ante(-cae.ante)
	end,
})

SMODS.Voucher({
	key = "fan_edit",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 6,
		y = 1,
	},
	config = {
		extra = {
			cost = 5
		},
	},
	requires = { "v_retcon" },
	cost = 10,
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.cost } }
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		G.GAME.abn_boss_reroll_cost = cae.cost
	end,
})

SMODS.Voucher({
	key = "industrial_brush",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 7,
		y = 1,
	},
	config = {
		extra = {
			inc = 2
		},
	},
	cost = 10,
	requires = { "v_paltte" },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.inc } }
	end,
	redeem = function(self, card)
		local cae = card.ability.extra
		G.hand:change_size(cae.inc)
	end,
})
