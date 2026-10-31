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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
	end,
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
	end,
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
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
    
    abn_artist_credits = {
        artist = "tarkandragonbird",
    },
})

SMODS.Voucher({
	key = "athame",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 4,
		y = 2,
	},
	cost = 10,
})

SMODS.Voucher({
	key = "ink_and_quill",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 5,
		y = 2,
	},
	cost = 10,
    
    abn_artist_credits = {
        artist = "0kronix",
    },
})

SMODS.Voucher({
	key = "fountain_pen",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 6,
		y = 2,
	},
	cost = 10,
	requires = { "v_abn_ink_and_quill" },
    
    abn_artist_credits = {
        artist = "0kronix",
    },
})

SMODS.Voucher({
	key = "magnet",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 1,
		y = 3,
	},
	cost = 10,
})

SMODS.Voucher({
	key = "electromagnet",
	atlas = "AbandoniaVouchers",
	pos = {
		x = 2,
		y = 3,
	},
	cost = 10,
	requires = { "v_abn_magnet" },
})

SMODS.Voucher({
    key = "pattern",
    atlas = "AbandoniaVouchers",
    pos = {
        x = 3,
        y = 3,
    },
    cost = 10,

    calculate = function(self, card, context)
        if context.setting_blind then
            local most_used_key = nil
            local highest_uses = -1

            local profile_stats = nil
            if G.PROFILES and G.SETTINGS and G.SETTINGS.profile and G.PROFILES[G.SETTINGS.profile] then
                profile_stats = G.PROFILES[G.SETTINGS.profile].consumeable_usage
            elseif G.PROFILE then
                profile_stats = G.PROFILE.consumeable_usage
            end

            for _, center in pairs(G.P_CENTERS) do
                if center.set == "Tarot" or center.set == "Planet" then
                    local curr_uses = 0
                    if profile_stats and profile_stats[center.key] then
                        curr_uses = profile_stats[center.key].count or profile_stats[center.key] or 0
                    end

                    if curr_uses > highest_uses then
                        highest_uses = curr_uses
                        most_used_key = center.key
                    end
                end
            end

            if not most_used_key or highest_uses <= 0 then
                most_used_key = "c_fool"
            end

            local card_type = "Tarot"
            if G.P_CENTERS[most_used_key] and G.P_CENTERS[most_used_key].set then
                card_type = G.P_CENTERS[most_used_key].set
            end

            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        local new_card = create_card(card_type, G.consumeables, nil, nil, nil, nil, most_used_key, 'pattern_voucher')
                        new_card:add_to_deck()
                        G.consumeables:emplace(new_card)
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                        return true
                    end
                }))
            end
        end
    end,
})

SMODS.Voucher({
    key = "tesselation",
    atlas = "AbandoniaVouchers",
    pos = {
        x = 4,
        y = 3,
    },
    cost = 10,
    requires = {"v_abn_pattern"},

    calculate = function(self, card, context)
        if context.setting_blind then
            local first_key, second_key = nil, nil
            local first_uses, second_uses = -1, -1

            local profile_stats = nil
            if G.PROFILES and G.SETTINGS and G.SETTINGS.profile and G.PROFILES[G.SETTINGS.profile] then
                profile_stats = G.PROFILES[G.SETTINGS.profile].consumeable_usage
            elseif G.PROFILE then
                profile_stats = G.PROFILE.consumeable_usage
            end

            for _, center in pairs(G.P_CENTERS) do
                if center.consumeable then
                    local curr_uses = 0
                    if profile_stats and profile_stats[center.key] then
                        curr_uses = profile_stats[center.key].count or profile_stats[center.key] or 0
                    end

                    if curr_uses > first_uses then
                        second_uses = first_uses
                        second_key = first_key
                        first_uses = curr_uses
                        first_key = center.key
                    elseif curr_uses > second_uses then
                        second_uses = curr_uses
                        second_key = center.key
                    end
                end
            end

            if not first_key or first_uses <= 0 then
                first_key = "c_fool"
            end
            if not second_key or second_uses <= 0 then
                second_key = first_key
            end

            local keys_to_spawn = {first_key, second_key}

            for _, key in ipairs(keys_to_spawn) do
                local card_type = "Tarot"
                if G.P_CENTERS[key] and G.P_CENTERS[key].set then
                    card_type = G.P_CENTERS[key].set
                end

                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            local new_card = create_card(card_type, G.consumeables, nil, nil, nil, nil, key, 'tesselation_voucher')
                            new_card:add_to_deck()
                            G.consumeables:emplace(new_card)
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                            return true
                        end
                    }))
                end
            end
        end
    end,
})

SMODS.Voucher({
    key = "silver_spoon",
    atlas = "AbandoniaVouchers",
    pos = {
        x = 5,
        y = 3,
    },
    cost = 10,
    
    redeem = function(self, card)
        G.GAME.silver_spoon_used = false
    end,

    calculate = function(self, card, context)
        local is_valid_purchase = (context.buying_card and context.card ~= card) or context.open_booster
        
        if is_valid_purchase and not G.GAME.silver_spoon_used then
            local target_item = context.card or context.to_open
            
            if target_item and target_item.config and target_item.config.center and target_item.config.center.key == "v_abn_silver_spoon" then
                return
            end

            local cost = target_item and target_item.cost or 0
            
            if cost > 0 then
                G.GAME.silver_spoon_used = true
                
                local refund = math.floor(cost * 0.5)
                if refund > 0 then
                    ease_dollars(refund)
                    card:juice_up(0.3, 0.3)
                end
            end
        end
        
        if context.starting_shop then
            G.GAME.silver_spoon_used = false
        end
    end,
})

SMODS.Voucher({
    key = "heirloom",
    atlas = "AbandoniaVouchers",
    pos = {
        x = 6,
        y = 3,
    },
    cost = 10,
    requires = { "v_abn_silver_spoon" },
    
    redeem = function(self, card)
        G.GAME.heirloom_ready = true
    end,

    calculate = function(self, card, context)
        local is_valid_purchase = (context.buying_card and context.card ~= card) or context.open_booster
        
        if is_valid_purchase and G.GAME.heirloom_ready then
            local target_item = context.card or context.to_open
            
            if target_item and target_item.config and target_item.config.center and target_item.config.center.key == "v_abn_heirloom" then
                return
            end

            ease_dollars(2)
        end
        
        if context.starting_shop then
            G.GAME.heirloom_ready = true
        end
		
		if context.ending_shop then
			G.GAME.heirloom_ready = false
		end
    end,
})

SMODS.Voucher({
    key = "power_rank",
    atlas = "AbandoniaVouchers",
    pos = {
        x = 0,
        y = 3,
    },
    cost = 10,
    in_pool = function(self, args)
		for _, area in ipairs(SMODS.get_card_areas("jokers")) do
			for __, joker in ipairs(area.cards) do
				if ABN.get_joker_enh(joker) then return true end
			end
		end
	end,
    
    abn_artist_credits = {
        artist = "0kronix",
    },
})

local old_card_for_shop = create_card_for_shop
function create_card_for_shop(area)
	local card = old_card_for_shop(area)
	if G.GAME.used_vouchers["v_abn_power_rank"] and card and card.ability and card.ability.set == "Joker" and pseudorandom(pseudoseed("v_abn_power_rank")) > 0.8 then
		local enh_sticker = SMODS.poll_object({pool = ABN.EnhStickerPool, seed = "abn_enhstickerpool"})
		if enh_sticker then
			card:add_sticker(enh_sticker, true)
		end
	end

	return card
end

SMODS.Voucher({
    key = "bios_utility",
    atlas = "NewestiaVouchers",
    pos = {x = 3, y = 0},
    cost = 10,
    requires = { "v_hieroglyph" },
	config = {extra = {selection = 2, hand_size = 1, win_ante = 4}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		return {vars = {voucher.ability.extra.selection, voucher.ability.extra.hand_size, voucher.ability.extra.win_ante}}
	end,
    in_pool = function(self, args)
		return G.GAME.abn_newestia and G.GAME.round_resets.ante % 2 == 0
	end,
    redeem = function(self, voucher)
        SMODS.change_play_limit(voucher.ability.extra.selection)
		SMODS.change_discard_limit(voucher.ability.extra.selection)
		G.hand:change_size(voucher.ability.extra.hand_size)
		G.GAME.win_ante = G.GAME.win_ante + voucher.ability.extra.win_ante
    end,
    abn_artist_credits = {
        artist = "Vega",
    },
})

SMODS.Voucher({
    key = "thorn_field",
    atlas = "NewestiaVouchers",
    pos = {x = 7, y = 0},
    cost = 10,
    requires = { "v_grabber" },
	config = {extra = {asc = 0.25, hand_min = 5, blind_size = 1.5, win_ante = 1}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		return {vars = {voucher.ability.extra.asc, voucher.ability.extra.hand_min, voucher.ability.extra.blind_size, voucher.ability.extra.win_ante}}
	end,
    in_pool = function(self, args)
		return G.GAME.abn_newestia and G.GAME.abn_newestia_asc_hand_played --See ABN.calculate in main.lua
	end,
    redeem = function(self, voucher)
		G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * voucher.ability.extra.blind_size
		G.GAME.win_ante = G.GAME.win_ante + voucher.ability.extra.win_ante
    end,
	calculate = function(self, voucher, context)
		if context.initial_scoring_step and #context.scoring_hand > voucher.ability.extra.hand_min then
			return {asc = voucher.ability.extra.asc * (#context.scoring_hand - voucher.ability.extra.hand_min)}
		end
	end,
    abn_artist_credits = {
        artist = "0kronix",
    },
})

SMODS.Voucher({
    key = "out_of_stock",
    atlas = "NewestiaVouchers",
    pos = {x = 6, y = 0},
    cost = 10,
    requires = { "v_overstock" },
	config = {extra = {add = 1}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		return {vars = {voucher.ability.extra.add}}
	end,
    in_pool = function(self, args)
		return G.GAME.abn_newestia and G.GAME.abn_voucher_purchased_during_newestia --See ABN.calculate in main.lua
	end,
	calculate = function(self, voucher, context)
		if context.starting_shop then
			local voucher = SMODS.poll_object({
				type = "Voucher",
				seed = "v_abn_out_of_stock",
				filter = function(pool)
					local filtered = {}
					for _, obj in pairs(pool) do
						if G.P_CENTERS[obj.key] and G.P_CENTERS[obj.key].original_mod then
                        	table.insert(filtered, obj)
                    	end
					end
					if #filtered == 0 then filtered[1] = "v_blank" end --Prevents crash from returning an empty pool
					return filtered
				end
			})
			if voucher and voucher ~= "v_blank" then
				SMODS.add_voucher_to_shop(voucher, true)
			end
		end
	end,
    abn_artist_credits = {
        artist = "0kronix",
    },
})

SMODS.Voucher({
    key = "counterfeit_chip",
    atlas = "NewestiaVouchers",
    pos = {x = 0, y = 0},
    cost = 10,
    requires = { "v_magic_trick" },
	config = {extra = {blind_size = 1.3}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		return {vars = {voucher.ability.extra.blind_size}}
	end,
    in_pool = function(self, args)
		return G.GAME.abn_newestia and G.GAME.abn_newestia_modded_suit_played --See ABN.calculate in main.lua
	end,
    redeem = function(self, voucher)
		G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * voucher.ability.extra.blind_size
    end,
	calculate = function(self, voucher, context)
		if context.modify_booster_card or context.modify_shop_card then
			if ABN.is_modded_suit(context.card) or ABN.is_modded_rank(context.card) then
				abn_add_stamp(context.card)
			end
		end
	end,
    abn_artist_credits = {
        artist = "Vega",
    },
})

SMODS.Voucher({
    key = "earth_mover",
    atlas = "NewestiaVouchers",
    pos = {x = 5, y = 0},
    cost = 10,
    requires = { "v_telescope" },
	config = {extra = {xmult = 2, xchips = 2, win_ante = 1}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		return {vars = {voucher.ability.extra.xmult, voucher.ability.extra.xchips, voucher.ability.extra.win_ante}}
	end,
    in_pool = function(self, args)
		return G.GAME.abn_newestia and G.GAME.abn_newestia_modded_planet_used --See ABN.calculate in main.lua
	end,
    redeem = function(self, voucher)
		G.GAME.win_ante = G.GAME.win_ante + voucher.ability.extra.win_ante
    end,
	calculate = function(self, voucher, context)
		if context.setting_blind then
			G.GAME.v_abn_earth_mover_first_modded_hand = false
			G.GAME.v_abn_earth_mover_first_vanilla_hand = false
		elseif context.final_scoring_step then
			local modded = ABN.is_modded_hand(context.scoring_name)
			if modded and not G.GAME.v_abn_earth_mover_first_modded_hand then
				G.GAME.v_abn_earth_mover_first_modded_hand = true
				return {x_mult = voucher.ability.extra.xmult}
			elseif not modded and not G.GAME.v_abn_earth_mover_first_vanilla_hand then
				G.GAME.v_abn_earth_mover_first_vanilla_hand = true
				return {x_chips = voucher.ability.extra.xchips}
			end
		end
	end,
    abn_artist_credits = {
        artist = "0kronix",
    },
})

SMODS.Voucher({
    key = "carbon_dating",
    atlas = "NewestiaVouchers",
    pos = {x = 2, y = 0},
    cost = 10,
    requires = { "v_crystal_ball" },
	config = {extra = {draw_bonus = 1}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		return {vars = {voucher.ability.extra.draw_bonus}}
	end,
    in_pool = function(self, args)
		return G.GAME.abn_newestia and G.GAME.abn_newestia_small_blind_beaten_with_no_hands_discards_left --See ABN.calculate in main.lua
	end,
    redeem = function(self, voucher)
		if G.GAME.round_resets.blind_states.Small == "Upcoming" then
			G.GAME.abn_newestia_current_blinds.Small = ABN.new_newestia_boss("boss")
			G.GAME.abn_newestia_original_blinds.Small = ABN.new_vanilla_boss()
			G.GAME.round_resets.blind_choices.Small = (G.GAME.abn_newestia and G.GAME.abn_newestia_current_blinds or G.GAME.abn_newestia_original_blinds).Small
		end
    end,
	calculate = function(self, voucher, context)
		if context.drawing_cards then
			return {cards_to_draw = context.amount + voucher.ability.extra.draw_bonus}
		end
	end,
    abn_artist_credits = {
        artist = "Vega",
    },
})

SMODS.Voucher({
    key = "carnival_coupon",
    atlas = "NewestiaVouchers",
    pos = {x = 4, y = 0},
    cost = 10,
    requires = { "v_blank" },
	config = {extra = {joker_slots = 2, win_ante = 1}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_newestia_only", set = "Other"}
		return {vars = {voucher.ability.extra.joker_slots, voucher.ability.extra.win_ante}}
	end,
    in_pool = function(self, args)
		return G.GAME.abn_newestia and G.GAME.abn_newestia_big_blind_beaten_with_over_five_jokers --See ABN.calculate in main.lua
	end,
    redeem = function(self, voucher)
		G.jokers.config.card_limit = G.jokers.config.card_limit + voucher.ability.extra.joker_slots
		G.GAME.win_ante = G.GAME.win_ante + voucher.ability.extra.win_ante
		if G.GAME.round_resets.blind_states.Big == "Upcoming" then
			G.GAME.abn_newestia_current_blinds.Big = ABN.new_newestia_boss("showdown")
			G.GAME.abn_newestia_original_blinds.Big = ABN.new_vanilla_boss(true)
			G.GAME.round_resets.blind_choices.Big = (G.GAME.abn_newestia and G.GAME.abn_newestia_current_blinds or G.GAME.abn_newestia_original_blinds).Big
		end
    end,
    abn_artist_credits = {
        artist = "Okronix",
    },
})

SMODS.Voucher({
    key = "masterworks",
    atlas = "AbandoniaVouchers",
    pos = {
        x = 0,
        y = 4,
    },
    cost = 10,
    config = {
        extra = {
            set = "None",
        }
    },

    calculate = function(self, card, context)
        if G.GAME.blind and G.GAME.blind.boss and context.using_consumeable and context.consumeable and context.consumeable.ability and context.consumeable.ability.set then
            card.ability.extra.set = context.consumeable.ability.set
        end

        if context.starting_shop and card.ability.extra.set ~= "None" then
            local set_to_booster = {
                ["Tarot"]        = "p_abn_arcana_kiddy",
                ["Spectral"]     = "p_abn_spectral_kiddy",
                ["Planet"]       = "p_abn_celestial_kiddy",
                ["astro_cards"]  = "p_abn_astro_kiddy",
                ["sigils"]       = "p_abn_sigil_kiddy",
                ["weather_report"] = "p_abn_weather_kiddy",
                ["lexica"]       = "p_abn_lexica_kiddy",
                ["continent"]    = "p_abn_continent_kiddy",
                ["solid_state"]  = "p_abn_solid_state_kiddy",
                ["program_pack"] = "p_abn_program_kiddy",
                ["calligraphy"]  = "p_abn_calligraphy_kiddy",
                ["glyphs"]       = "p_abn_glyph_kiddy",
                ["calamity_cards"] = "p_abn_calamity_kiddy",
                ["illusion"]     = "p_abn_illusion_kiddy",
                ["crimson"]      = "p_abn_crimson_kiddy",
            }

            local pack_key = set_to_booster[card.ability.extra.set]

            if pack_key and G.P_CENTERS[pack_key] and G.shop_booster then
                local booster_card = Card(
                    G.shop_booster.T.x + G.shop_booster.T.w / 2,
                    G.shop_booster.T.y,
                    G.CARD_W * 1.27,
                    G.CARD_H * 1.27,
                    G.P_CARDS.empty,
                    G.P_CENTERS[pack_key],
                    { bypass_discovery_center = true, bypass_discovery_ui = true }
                )
                create_shop_card_ui(booster_card, 'Booster', G.shop_booster)
                booster_card.ability.booster_pos = #G.shop_booster.cards + 1
                booster_card:start_materialize()
                G.shop_booster:emplace(booster_card)
            end

            card.ability.extra.set = "None"
        end
    end,

    abn_artist_credits = {
        artist = "Superthing",
    },
})

SMODS.Voucher({
    key = "smelting",
    atlas = "AbandoniaVouchers",
    pos = {
        x = 7,
        y = 3,
    },
    cost = 10,
    requires = { "v_abn_masterworks" },
    config = {
        extra = {
            dollars = 2,
        }
    },
	
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.dollars } }
	end,

    update = function(self, card)
        if card.area == G.vouchers and G.consumeables then
            for _, _card in ipairs(G.consumeables.cards) do
                if not _card.ability.masterworked then
                    _card.ability.masterworked = true
                    _card.ability.extra_value = (_card.ability.extra_value or 0) + card.ability.extra.dollars
                    _card:set_cost()
                end
            end
        end
    end,

    calculate = function(self, card, context)
        if context.selling_card and context.card and context.card.ability and context.card.ability.consumeable then
            if context.card.edition and context.card.edition.key then
                local edition_donor = context.card.edition.key
                local valid_targets = {}

                for _, cons in ipairs(G.consumeables.cards) do
                    if cons ~= context.card and (not cons.edition or cons.edition.key ~= edition_to_transfer) then
                        table.insert(valid_targets, cons)
                    end
                end

                if #valid_targets > 0 then
                    local target = pseudorandom_element(valid_targets, pseudoseed('smelting_edition'))
                    target:set_edition(edition_donor, true)
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Superthing",
    },
})

SMODS.Voucher({
    key = "forbidden_fruit",
    atlas = "AbandoniaVouchers",
    pos = {
        x = 2,
        y = 2,
    },
    cost = 10,

	redeem = function(self, card)
		G.GAME.abn_underhands_unlocked = true
	end,
    
    calculate = function(self, card, context)
        if context.setting_blind then
            local multiplier = 1 + (0.10 * (G.GAME.round_resets.ante or 1))
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips * multiplier)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end,

    abn_artist_credits = {
        artist = "?",
    },
})

local get_return_ante = function(voucher)
	return voucher.ability.extra.return_ante + (G.GAME.abn_voucher_return_later or 0)
end

local redeem_return_ante = function(self, voucher)
	local ante_change = -G.GAME.round_resets.ante + get_return_ante(voucher)
	ease_ante(ante_change)
	G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
	G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + ante_change
end

SMODS.Voucher {
  key = 'executioner_switch',
  atlas = 'JimboStakeVouchers',
  pos = { x = 0, y = 0 },
  config = {extra = {return_ante = -1, mayhem = -1}},
  loc_vars = function(self, info_queue, voucher)
	info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
    return { vars = { get_return_ante(voucher), voucher.ability.extra.mayhem } }
  end,

  redeem = redeem_return_ante,
  calculate = function(self, voucher, context)
	if context.joker_type_destroyed and context.card.ability.set == "Joker" then
	  return {
		dollars = context.card.sell_cost,
		func = function()
		  ABN.mayhem(voucher.ability.extra.mayhem)
		end
	  }
	end
  end,

    in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}

SMODS.Voucher {
	key = 'clockspin',
	atlas = 'JimboStakeVouchers',
	pos = { x = 1, y = 0 },
	config = {extra = {return_ante = -1, mayhem = -1}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		return { vars = { get_return_ante(voucher), voucher.ability.extra.mayhem } }
	end,

	redeem = redeem_return_ante,
	calculate = function(self, voucher, context)
		if context.end_of_round and context.main_eval and context.beat_boss and G.GAME.blind.boss and G.GAME.blind.config.blind.boss.showdown then
			local jokers = 0
			ABN.all_jokers(function() jokers = jokers + 1 end)
			if jokers > 0 then
				ABN.mayhem(-jokers, true)
			end
		elseif context.end_of_round and context.main_eval and not context.game_over and G.GAME.blind.big and not G.GAME.abn_second_big_blind then
			G.GAME.abn_second_big_blind = 1
			-- See lovely/repeat_blind.toml for how repeating the Big Blind works
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}

SMODS.Voucher {
	key = 'amperage_meter',
	atlas = 'JimboStakeVouchers',
	pos = { x = 3, y = 0 },
	config = {extra = {return_ante = -1, amp = 2, mayhem = 1.5}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		return { vars = { get_return_ante(voucher), voucher.ability.extra.amp, voucher.ability.extra.mayhem } }
	end,

	redeem = redeem_return_ante,
	calculate = function(self, voucher, context)
		if context.before then
			voucher.ability.extra.allow_scoring = true
		elseif context.after then
			voucher.ability.extra.allow_scoring = false
		elseif context.post_trigger and context.other_card.ability and context.other_card.ability.set == "Joker" and not context.other_card.config.center.original_mod and voucher.ability.extra.allow_scoring and not context.other_context.before and not context.other_context.after then
			ABN.mayhem(voucher.ability.extra.mayhem, true)
			SMODS.calculate_effect({amp = voucher.ability.extra.amp}, context.other_card)
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}


SMODS.Voucher {
	key = 'zero_hour',
	atlas = 'JimboStakeVouchers',
	pos = { x = 5, y = 0 },
	config = {extra = {return_ante = -1, ante_gain = 1, mayhem = 3}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		return { vars = { get_return_ante(voucher), voucher.ability.extra.ante_gain, voucher.ability.extra.mayhem } }
	end,

	redeem = redeem_return_ante,
	calculate = function(self, voucher, context)
		if context.ante_change then
			ABN.mayhem(voucher.ability.extra.mayhem, true)
			if G.GAME.round_resets.ante + context.ante_change <= get_return_ante(voucher) then
				G.GAME.abn_voucher_return_later = (G.GAME.abn_voucher_return_later or 0) + voucher.ability.extra.ante_gain
			end
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}

SMODS.Voucher {
	key = 'rare_vaccine',
	atlas = 'JimboStakeVouchers',
	pos = { x = 6, y = 0 },
	config = {extra = {return_ante = -1, mayhem_plague = -4, mayhem_virus = -8}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		return { vars = { get_return_ante(voucher), voucher.ability.extra.mayhem_plague, voucher.ability.extra.mayhem_virus } }
	end,

	redeem = redeem_return_ante,
	calculate = function(self, voucher, context)
		if context.before then
			voucher.ability.extra.allow_scoring = true
		elseif context.after then
			voucher.ability.extra.allow_scoring = false
		elseif context.post_trigger and context.other_card.ability and context.other_card.ability.set == "Joker" and voucher.ability.extra.allow_scoring and not context.other_context.before and not context.other_context.after then
			if context.other_card.config.center.rarity == "abn_VirusRare" then
				ABN.mayhem(voucher.ability.extra.mayhem_virus, true)
			elseif context.other_card.config.center.pools.Plagued then
				ABN.mayhem(voucher.ability.extra.mayhem_plague, true)
			end
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}

SMODS.Voucher {
	key = 'pitch_machine',
	atlas = 'JimboStakeVouchers',
	pos = { x = 7, y = 0 },
	config = {extra = {return_ante = -1, van_amp = 1, van_may = 2, mod_mod = 1, mod_may = 3}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		local vae = voucher.ability.extra
		return { vars = { get_return_ante(voucher), vae.van_amp, vae.van_may, vae.mod_mod, vae.mod_may } }
	end,

	redeem = function(self, voucher)
		redeem_return_ante(self, voucher)
		for name, hand in pairs(G.GAME.hands) do
			if ABN.is_modded_hand(name) then
				hand.abn_modulate = hand.abn_modulate or 1
				hand.l_abn_modulate = hand.l_abn_modulate or voucher.ability.extra.mod_mod
				hand.s_abn_modulate = hand.s_abn_modulate or 1
			else
				hand.abn_amp = hand.abn_amp or 1
				hand.l_abn_amp = hand.l_abn_amp or voucher.ability.extra.van_amp
				hand.s_abn_amp = hand.s_abn_amp or 1
			end
		end
	end,
	calculate = function(self, voucher, context)
		if context.poker_hand_changed and context.old_level and context.new_level then
			local level_change = context.new_level - context.old_level
			if level_change == 0 then return end
			local hand = G.GAME.hands[context.scoring_name]
			--local vae = voucher.ability.extra
			if ABN.is_modded_hand(context.scoring_name) then
				--hand.abn_modulate = (hand.abn_modulate or 1) + vae.mod_mod
				hand.abn_mayhem = (hand.abn_mayhem or 0) + voucher.ability.extra.mod_may * level_change
			else
				--hand.abn_amp = (hand.abn_amp or 1) + vae.van_amp
				hand.abn_mayhem = (hand.abn_mayhem or 0) + voucher.ability.extra.van_may * level_change
			end
		elseif context.final_scoring_step and G.GAME.hands[context.scoring_name].abn_mayhem then
			ABN.mayhem(G.GAME.hands[context.scoring_name].abn_mayhem, true)
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}

local old_ui_current_hand = create_UIBox_current_hand_row
function create_UIBox_current_hand_row(handname, simple, in_collection)
	local ui = old_ui_current_hand(handname, simple, in_collection)
	if ui and not in_collection and G.GAME then
		local insert_nodes = {before = {}, after = {}}
		if G.GAME.hands[handname].abn_modulate and G.GAME.hands[handname].abn_modulate ~= 1 then
			table.insert(insert_nodes.before, {n=G.UIT.T, config={text = "X", scale = 0.25, colour = G.C.ABN_MODULATE}})
			table.insert(insert_nodes.before, {n=G.UIT.C, config={align = "cm", padding = 0.01, r = 0.1, colour = G.C.ABN_MODULATE, minw = 1.1}, nodes={
				{n=G.UIT.T, config={text = number_format(G.GAME.hands[handname].abn_modulate, 1000000), scale = 0.45, colour = G.C.UI.TEXT_LIGHT}},
				{n=G.UIT.B, config={w = 0.08, h = 0.01}}
			}})
		end
		if G.GAME.hands[handname].abn_amp and G.GAME.hands[handname].abn_amp ~= 1 then
			table.insert(insert_nodes.after, {n=G.UIT.T, config={text = "X", scale = 0.25, colour = G.C.ABN_AMPERAGE}})
			table.insert(insert_nodes.after, {n=G.UIT.C, config={align = "cm", padding = 0.01, r = 0.1, colour = G.C.ABN_AMPERAGE, minw = 1.1}, nodes={
				{n=G.UIT.T, config={text = number_format(G.GAME.hands[handname].abn_amp, 1000000), scale = 0.45, colour = G.C.UI.TEXT_LIGHT}},
				{n=G.UIT.B, config={w = 0.08, h = 0.01}}
			}})
		end
		if G.GAME.hands[handname].abn_mayhem and G.GAME.hands[handname].abn_mayhem ~= 0 then
			table.insert(insert_nodes.after, {n=G.UIT.T, config={text = "+", scale = 0.45, colour = G.C.UI.TEXT_LIGHT}})
			table.insert(insert_nodes.after, {n=G.UIT.C, config={align = "cm", padding = 0.01, r = 0.1, colour = G.C.ABN_MAYHEM_DARK, minw = 1.1}, nodes={
				{n=G.UIT.T, config={text = number_format(G.GAME.hands[handname].abn_mayhem, 1000000), scale = 0.45, colour = G.C.UI.TEXT_LIGHT}},
				{n=G.UIT.B, config={w = 0.08, h = 0.01}}
			}})
		end
		local count = #insert_nodes.before + #insert_nodes.after
		if count > 0 then
			ABN.iterate_edit_ui(ui, function(node)
				if node.config and node.config.colour == G.C.BLACK and not node.config.minw then
					local old_count = 0.1
					for _, n in ipairs(node.nodes) do
						if n.n == G.UIT.C then
							n.config.align = "cm"
							old_count = old_count + 1
							count = count + 1
						end
					end
					for _, n in ipairs(insert_nodes.before) do
						table.insert(node.nodes, 1, n)
					end
					for _, n in ipairs(insert_nodes.after) do
						table.insert(node.nodes, n)
					end
					for _, n in ipairs(node.nodes) do
						if n.config.minw then
							n.config.minw = n.config.minw * old_count / count
						end
					end
					return true
				end
			end)
		end
	end
	return ui
end

SMODS.Voucher {
	key = 'illegal_glove',
	atlas = 'JimboStakeVouchers',
	pos = { x = 5, y = 1 },
	config = {extra = {return_ante = -1, xmult = 1.5, mayhem = 5}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		return { vars = { get_return_ante(voucher), voucher.ability.extra.xmult, voucher.ability.extra.mayhem } }
	end,

	redeem = function(self, voucher)
		redeem_return_ante(self, voucher)
		G.GAME.abn_underhands_unlocked = true
	end,

	calculate = function(self, voucher, context)
		if context.final_scoring_step and Abandonia.get_underhand(context.full_hand) then
			ABN.mayhem(voucher.ability.extra.mayhem, true)
			return {x_mult = voucher.ability.extra.xmult}
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}

local backdoor_draw_return = false
SMODS.Voucher {
	key = 'backdoor_draw',
	atlas = 'JimboStakeVouchers',
	pos = { x = 6, y = 1 },
	config = {extra = {return_ante = -1, mayhem = 5, played_underhand = false}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		return { vars = { get_return_ante(voucher), voucher.ability.extra.mayhem } }
	end,

	redeem = redeem_return_ante,
	calculate = function(self, voucher, context)
		if context.setting_blind then
			voucher.ability.extra.played_underhand = false
		elseif context.after and Abandonia.get_underhand(context.full_hand) and not voucher.ability.extra.played_underhand then
			voucher.ability.extra.played_underhand = true
			ABN.mayhem(voucher.ability.extra.mayhem, true)
			backdoor_draw_return = true
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor and G.GAME.abn_underhands_unlocked
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}
local old_play_to_discard = G.FUNCS.draw_from_play_to_discard
G.FUNCS.draw_from_play_to_discard = function(e)
	if not backdoor_draw_return then
		old_play_to_discard(e)
		return
	end
	backdoor_draw_return = false
	local count = #G.play.cards + #G.hand.cards + #G.discard.cards
	local it = 1
	for _, area in ipairs({G.play, G.hand, G.discard}) do
		for k, v in ipairs(area.cards) do
			if (not v.shattered) and (not v.destroyed) then 
				draw_card(area,G.deck, it*100/count,'down', false, v)
				it = it + 1
			end
		end
	end
end

--[[
Currently disabled because it's infeasible
to prioritize cards that fit a specific hand type;
Sure, it works for smaller hands, but anything overly
specific would take way too long to search for

SMODS.Voucher {
	key = 'pheromone_perfume',
	atlas = 'JimboStakeVouchers',
	pos = { x = 7, y = 1 },
	config = {extra = {return_ante = -1, mayhem = 10}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		return { vars = { get_return_ante(voucher), voucher.ability.extra.mayhem } }
	end,

	redeem = redeem_return_ante,
	calculate = function(self, voucher, context)
		if context.setting_blind then
			ABN.mayhem(voucher.ability.extra.mayhem, true)
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}

local function try_for_hand(cards, handname)
	for a = 1, 1000 do
		local checking = {}
		local card_map = {}
		local tries = G.hand.config.card_limit * 2
		local b = 0
		while #checking < G.GAME.starting_params.play_limit and b < tries do
			b = b + 1
			local c = pseudorandom_element(cards, "v_abn_pheromone_perfume")
			if not card_map[c.sort_id] then
				table.insert(checking, c)
				card_map[c.sort_id] = true
			end
		end
		local hand_info = evaluate_poker_hand(checking)[handname][1]
		if hand_info and #hand_info > 0 then
			local hand_map = {}
			for _, card in ipairs(hand_info) do
				hand_map[card.sort_id] = true
			end
			return hand_map
		end
	end
end

local shuffle_ref = CardArea.shuffle
function CardArea:shuffle(_seed)
  local g = shuffle_ref(self, _seed)
  if next(SMODS.find_card("v_abn_pheromone_perfume")) and self == G.deck then
	local prio_map = try_for_hand(self.cards, ABN.highest_level_hand())
	if not prio_map then return g end
    local priorities = {}
    local others = {}
    for k, v in pairs(self.cards) do
      if prio_map[v.sort_id] then
        table.insert(priorities, v)
	  else
        table.insert(others, v)
      end
    end
    for _, card in ipairs(priorities) do
      table.insert(others, card)
    end
    self.cards = others
    self:set_ranks()
  end
  return g
end--]]

SMODS.Voucher {
	key = 'lever_frame',
	atlas = 'JimboStakeVouchers',
	pos = { x = 0, y = 1 },
	config = {extra = {return_ante = -1, mayhem = 2}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		return { vars = { get_return_ante(voucher), voucher.ability.extra.mayhem } }
	end,

	redeem = redeem_return_ante,

	calculate = function(self, voucher, context)
		if context.open_booster then
			G.GAME.abn_level_frame_prepare_booster = true
			G.GAME.abn_lever_frame_already_redrawn = false
			ABN.mayhem(voucher.ability.extra.mayhem, true)
		elseif context.ending_booster then
			--Just a failsafe, given that any accidental mass ABN.iterate_edit_ui usage might get laggy.
			G.GAME.abn_level_frame_prepare_booster = false
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}

local old_uibox_init = UIBox.init
function UIBox:init(args)
	if G.GAME and G.GAME.abn_level_frame_prepare_booster and args.definition then
		ABN.iterate_edit_ui(args.definition, function(node, nodes)
			if node.config and node.config.button == "skip_booster" then
				G.GAME.abn_level_frame_prepare_booster = false
				for i = 2, #nodes do
					if node.config and node.config.minh then
						node.config.minh = node.config.minh * (#nodes - 1) / #nodes
					end
				end
				table.insert(nodes, {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2 * (#nodes - 1) / #nodes, minw = 1.8, r=0.15,colour = G.C.CHIPS, one_press = true, button = 'abn_lever_frame_redraw', hover = true,shadow = true, func = 'abn_lever_frame_can_redraw'}, nodes = {
                    {n=G.UIT.T, config={text = localize("k_abn_redraw_cards"), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}})
				return true
			end
		end)
	end
	old_uibox_init(self, args)
end

G.FUNCS.abn_lever_frame_can_redraw = function(e)
	if G.pack_cards and (not (G.GAME.STOP_USE and G.GAME.STOP_USE > 0)) and not G.GAME.abn_lever_frame_already_redrawn and G.hand and #G.hand.cards > 0 then 
		e.config.colour = G.C.CHIPS
		e.config.button = 'abn_lever_frame_redraw'
	else
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
	end
end

G.FUNCS.abn_lever_frame_redraw = function(e)
	G.GAME.abn_lever_frame_already_redrawn = true
	G.FUNCS.draw_from_hand_to_discard()
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.5,
		func = function()
			G.FUNCS.draw_from_deck_to_hand()
			return true
		end
	}))
end

SMODS.Voucher {
	key = 'pressure_gauge',
	atlas = 'JimboStakeVouchers',
	pos = { x = 1, y = 1 },
	config = {extra = {return_ante = -1, bs_ratio = 0.25, xpayout = 1.2, js_gain = 1}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		return { vars = { get_return_ante(voucher), voucher.ability.extra.bs_ratio, voucher.ability.extra.xpayout, voucher.ability.extra.js_gain } }
	end,

	redeem = redeem_return_ante,

	calculate = function(self, voucher, context)
		if context.setting_blind then
			G.GAME.blind.chips = G.GAME.blind.chips * (1 + voucher.ability.extra.bs_ratio * ABN.mayhem())
    		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			G.GAME.blind:set_text()
			G.GAME.blind:wiggle()
		elseif context.modify_final_cashout and context.amount ~= 0 then
			return {modify = context.amount * (voucher.ability.extra.xpayout - 1)}
		elseif context.blind_defeated and G.GAME.blind.boss and G.GAME.blind.config.blind.boss.hazard_blind then
			voucher.ability.extra.hazard_buffer = not voucher.ability.extra.hazard_buffer
			if not voucher.ability.extra.hazard_buffer then
				G.jokers.config.card_limit = G.jokers.config.card_limit + 1
			end
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}

SMODS.Voucher {
	key = 'esoteric_sign',
	atlas = 'JimboStakeVouchers',
	pos = { x = 2, y = 1 },
	config = {extra = {return_ante = -1, dark_amp = 1, dark_mayhem = 2, light_asc = 1, light_mayhem = 2}},
	loc_vars = function(self, info_queue, voucher)
		info_queue[#info_queue + 1] = {key = "abn_jimbo_only", set = "Other"}
		info_queue[#info_queue + 1] = {key = "abn_dark_suit", set = "Other"}
		info_queue[#info_queue + 1] = {key = "abn_light_suit", set = "Other"}
		local vae = voucher.ability.extra
		return { vars = { get_return_ante(voucher), vae.dark_amp, vae.dark_mayhem, vae.light_asc, vae.light_mayhem } }
	end,

	redeem = function(self, voucher)
		redeem_return_ante(self, voucher)
		G.GAME.abn_blind_edition_rate = (G.GAME.abn_blind_edition_rate or 0) + 0.2
	end,

	calculate = function(self, voucher, context)
		if context.individual and context.cardarea == G.play then
			local ret = nil
			if ABN.is_dark(context.other_card) then
				ABN.mayhem(voucher.ability.extra.dark_mayhem, true)
				ret = {amp = voucher.ability.extra.dark_amp}
			end
			if ABN.is_light(context.other_card) then
				ABN.mayhem(voucher.ability.extra.light_mayhem, true)
				ret = ret or {}
				ret.asc = voucher.ability.extra.light_asc
			end
			return ret
		end
	end,

	in_pool = function(self, args)
		return G.GAME.modifiers.Honor
	end,

	abn_artist_credits = {
		artist = "0kronix",
	},
}
