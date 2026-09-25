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
