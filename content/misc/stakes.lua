-- Initialize the Timer variable
local igo = Game.init_game_object
function Game:init_game_object(...)
    local ret = igo(self, ...)
    ret.HonorShowdownTimer = 0
    return ret
end

local hazard_ante_map = {
	[4] = "Honor",
	[5] = "Menacing",
	[6] = "Toxic",
	[7] = "Noxious",
	[8] = "Honor",
	[9] = "Honor",
	[10] = "Menacing",
	[11] = "Toxic",
	[12] = "Lethal",
	[13] = "Baneful",
	[14] = "Malicious",
}

-- See utilities/hooks.lua "Conditional boss replacements", and content/misc/newestia.lua "ABN.new_newestia_boss()" for how hazard bosses are spawned
function ABN.is_hazard_ante()
	return G.GAME and hazard_ante_map[G.GAME.round_resets.ante] and G.GAME.modifiers[hazard_ante_map[G.GAME.round_resets.ante]]
end

function ABN.new_hazard_boss()
	local pool = "abn_hazard_boss_pool"
	if not G.GAME[pool] or #G.GAME[pool] == 0 then
		G.GAME[pool] = {}
		for key in pairs(G.P_BLINDS) do
			if key:find("bl_abn_hazard") then
				table.insert(G.GAME[pool], key)
			end
		end
	end
	return table.remove(G.GAME[pool], pseudorandom("abn_new_hazard_boss", 1, #G.GAME[pool]))
end

local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)

    -- Toxic Flip Mechanic
    if not ABN.config.disable_flipped_stakes then
        if G.STATE == G.STATES.SHOP and G.GAME.modifiers.Toxic and G.shop_jokers and G.shop_jokers.cards then
            for _, v in ipairs(G.shop_jokers.cards) do
                if v.config.center.set == 'Joker' and not v.ability.abn_toxic_checked then
                    if pseudorandom('toxic_flip') < 0.3 then
                        if v.facing == 'front' then v:flip() end
                        v.ability.abn_perma_flipped = true
                    end
                    v.ability.abn_toxic_checked = true
                end
            end
        end
    end
end

local function failure_sound()
	play_sound('tarot2', 1, 0.4)
	G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.06 * G.SETTINGS.GAMESPEED,
        blockable = false,
        blocking = false,
        func = function()
            play_sound('tarot2', 0.76, 0.4)
			return true
        end
    }))
end

--- STAKES DEFINITIONS ---

SMODS.Stake({
    key = "honor",
    applied_stakes = {},
    atlas = "AbandoniaStakes",
    pos = { x = 0, y = 0 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 1, y = 2 },
    colour = G.C.WHITE,
    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 9)
        G.GAME.modifiers.Honor = true
    end,
	calculate = function(self, context)
		if context.end_of_round and context.main_eval and context.beat_boss then
			G.GAME.abn_honor_inflation = (G.GAME.abn_honor_inflation or 0) + 2
        end
	end
})

local card_cost_ref = Card.set_cost_value
function Card:set_cost_value()
	card_cost_ref(self)
	self.cost = (self.cost + (G.GAME.abn_honor_inflation or 0)) * (G.GAME.abn_baneful_inflation or 1)
end

SMODS.Stake({
    key = "menacing",
    applied_stakes = { "abn_honor" },
    above_stake = "abn_honor",
    atlas = "AbandoniaStakes",
    pos = { x = 1, y = 0 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 2, y = 2 },
    colour = G.C.RED,
	loc_vars = function(self)
		return {vars = {SMODS.get_probability_vars("stake_abn_menacing", 1, 10)}}
	end,

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 10)
        G.GAME.modifiers.Menacing = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
    end,
})

local reroll_ref = G.FUNCS.reroll_shop
function G.FUNCS.reroll_shop(e)
	if G.GAME.modifiers.Menacing and SMODS.pseudorandom_probability("stake_abn_menacing", "stake_abn_menacing", 1, 10) then
		stop_use()
		local reroll_cost = G.GAME.current_round.reroll_cost
		if G.GAME.current_round.reroll_cost > 0 then 
			inc_career_stat('c_shop_dollars_spent', G.GAME.current_round.reroll_cost)
			inc_career_stat('c_shop_rerolls', 1)
			ease_dollars(-G.GAME.current_round.reroll_cost)
		end
		G.E_MANAGER:add_event(Event({
			trigger = 'immediate',
			func = function()
				local final_free = G.GAME.current_round.free_rerolls > 0
				G.GAME.current_round.free_rerolls = math.max(G.GAME.current_round.free_rerolls - 1, 0)
				G.GAME.round_scores.times_rerolled.amt = G.GAME.round_scores.times_rerolled.amt + 1
				calculate_reroll_cost(final_free)
                failure_sound()
				return true
			end
		}))
	else
		reroll_ref(e)
	end
end

SMODS.Stake({
    key = "toxic",
    applied_stakes = { "abn_menacing" },
    above_stake = "abn_menacing",
    atlas = "AbandoniaStakes",
    pos = { x = 2, y = 0 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 3, y = 2 },
    colour = G.C.GREEN,

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 11)
        G.GAME.modifiers.Toxic = true
    end,
	calculate = function(self, context)
		if context.end_of_round and context.main_eval and G.GAME.blind.boss and G.GAME.blind.config.blind.boss.showdown then
			G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.05
		end
	end
})

SMODS.Stake({
    key = "noxious",
    applied_stakes = { "abn_toxic" },
    above_stake = "abn_toxic",
    atlas = "AbandoniaStakes",
    pos = { x = 3, y = 0 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 4, y = 2 },
    colour = G.C.BLUE,
	loc_vars = function(self)
		local n1, d1 = SMODS.get_probability_vars("stake_abn_noxious", 1, 8)
		local n2, d2 = SMODS.get_probability_vars("stake_abn_noxious", 1, 10)
		return {vars = {n1, d1, n2, d2}}
	end,

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 12)
        G.GAME.modifiers.Noxious = true
    end,

	calculate = function(self, context)
		if context.open_booster and SMODS.pseudorandom_probability("stake_abn_noxious", "stake_abn_noxious", 1, 8) then
			G.E_MANAGER:add_event(Event({
				func = function()
					for i = 2, #G.pack_cards.cards do
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.2,
							func = function()
								G.pack_cards.cards[i]:start_dissolve()
								return true
							end
						}))
					end
					return true
				end
			}))
		end
	end
})

local skip_blind_ref = G.FUNCS.skip_blind
function G.FUNCS.skip_blind(e)
	local failsound = false
	if G.GAME.modifiers.Noxious and SMODS.pseudorandom_probability("stake_abn_noxious", "stake_abn_noxious", 1, 10) then
		failsound = true
		G.FUNCS.select_blind(G.blind_select_opts[G.GAME.blind_on_deck:lower()]:get_UIE_by_ID("select_blind_button"))
	end
	if G.GAME.modifiers.Lethal and SMODS.pseudorandom_probability("stake_abn_lethal", "stake_abn_lethal", 1, 10) then
		if not failsound then
			local _tag = e.UIBox:get_UIE_by_ID('tag_container')
			if _tag then
				_tag.config.ref_table.abn_lethal_no_tag = true
			end
			skip_blind_ref(e)
		end
		failsound = true
	else
		if failsound then
			local _tag = e.UIBox:get_UIE_by_ID('tag_container')
			if _tag then
				G.E_MANAGER:add_event(Event({
					func = function()
						add_tag(_tag.config.ref_table)
						return true
					end
				}))
			end
		else
			skip_blind_ref(e)
		end
	end
	if failsound then failure_sound() end
end

local add_tag_ref = add_tag
function add_tag(_tag)
	if _tag.abn_lethal_no_tag then return end
	add_tag_ref(_tag)
end

SMODS.Stake({
    key = "lethal",
    applied_stakes = { "abn_noxious" },
    above_stake = "abn_noxious",
    atlas = "AbandoniaStakes",
    pos = { x = 4, y = 0 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 0, y = 3 },
    colour = G.C.BLACK,
	loc_vars = function(self)
		return {vars = {SMODS.get_probability_vars("stake_abn_menacing", 1, 10)}}
	end,

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 13)
        G.GAME.modifiers.Lethal = true
    end,
})

SMODS.Stake({
    key = "baneful",
    applied_stakes = { "abn_lethal" },
    above_stake = "abn_lethal",
    atlas = "AbandoniaStakes",
    pos = { x = 0, y = 1 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 1, y = 3 },
    colour = G.C.PURPLE,

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 14)
        G.GAME.modifiers.Baneful = true
    end,

	calculate = function(self, context)
		if context.reroll_shop then
			G.GAME.abn_baneful_inflation = (G.GAME.abn_baneful_inflation or 1) * 1.02
			for _, area in ipairs({G.shop_jokers, G.shop_booster, G.shop_vouchers}) do
				for _, card in ipairs(area.cards) do
					card:set_cost_value()
				end
			end
        end
	end
})

SMODS.Stake({
    key = "malicious",
    applied_stakes = { "abn_baneful" },
    above_stake = "abn_baneful",
    atlas = "AbandoniaStakes",
    pos = { x = 1, y = 1 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 2, y = 3 },
    colour = G.C.FILTER,

	loc_vars = function(self)
		return {vars = {SMODS.get_probability_vars("stake_abn_baneful", 1, 10)}}
	end,

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 15)
        G.GAME.modifiers.Malicious = true
    end,

	calculate = function(self, context)
		if context.modify_shop_card and context.card.ability.set == "Joker" and SMODS.pseudorandom_probability("stake_abn_lethal", "stake_abn_baneful", 1, 10) then
			context.card.cost = context.card.cost * 2
		end
	end
})

SMODS.Stake({
    key = "malignant",
    applied_stakes = { "abn_malicious" },
    above_stake = "abn_malicious",
    atlas = "AbandoniaStakes",
    pos = { x = 2, y = 1 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 3, y = 3 },
    colour = G.C.YELLOW,

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 16)
        G.GAME.modifiers.Malignant = true
    end,
})

SMODS.Stake({
    key = "inhospitable",
    applied_stakes = { "abn_malignant" },
    above_stake = "abn_malignant",
    atlas = "AbandoniaStakes",
    pos = { x = 3, y = 1 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 4, y = 3 },
    colour = G.C.UI.TEXT_INACTIVE,

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 17)
        G.GAME.modifiers.Inhospitable = true
    end,
})

SMODS.Stake({
    key = "unendurable",
    applied_stakes = { "abn_inhospitable" },
    above_stake = "abn_inhospitable",
    atlas = "AbandoniaStakes",
    pos = { x = 4, y = 1 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 0, y = 4 },
    colour = HEX("d2d682"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 18)
        G.GAME.modifiers.Unendurable = true
    end,
})

SMODS.Stake({
    key = "torturous",
    applied_stakes = { "abn_unendurable" },
    above_stake = "abn_unendurable",
    atlas = "AbandoniaStakes",
    pos = { x = 0, y = 2 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 1, y = 4 },
    colour = HEX("00ffff"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 19)
        G.GAME.modifiers.Torturous = true
    end,
})

SMODS.Stake({
    key = "wretched",
    applied_stakes = { "abn_torturous" },
    above_stake = "abn_torturous",
    atlas = "AbandoniaStakes",
    pos = { x = 1, y = 2 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 2, y = 4 },
    colour = HEX("c75985"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 20)
        G.GAME.modifiers.Wretched = true
    end,
})

SMODS.Stake({
    key = "agonizing",
    applied_stakes = { "abn_wretched" },
    above_stake = "abn_wretched",
    atlas = "AbandoniaStakes",
    pos = { x = 2, y = 2 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 3, y = 4 },
    colour = HEX("76baee"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 21)
        G.GAME.modifiers.Agonizing = true
    end,
})

SMODS.Stake({
    key = "deplorable",
    applied_stakes = { "abn_agonizing" },
    above_stake = "abn_agonizing",
    atlas = "AbandoniaStakes",
    pos = { x = 3, y = 2 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 4, y = 4 },
    colour = HEX("928d89"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 22)
        G.GAME.modifiers.Deplorable = true
    end,
})

SMODS.Stake({
    key = "vile",
    applied_stakes = { "abn_deplorable" },
    above_stake = "abn_deplorable",
    atlas = "AbandoniaStakes",
    pos = { x = 4, y = 2 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 0, y = 5 },
    colour = HEX("f2c255"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 23)
        G.GAME.modifiers.Vile = true
    end,
})

SMODS.Stake({
    key = "revolting",
    applied_stakes = { "abn_vile" },
    above_stake = "abn_vile",
    atlas = "AbandoniaStakes",
    pos = { x = 0, y = 3 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 1, y = 5 },
    colour = HEX("84c5d2"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 24)
        G.GAME.modifiers.Revolting = true
    end,
})

SMODS.Stake({
    key = "heinous",
    applied_stakes = { "abn_revolting" },
    above_stake = "abn_revolting",
    atlas = "AbandoniaStakes",
    pos = { x = 1, y = 3 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 2, y = 5 },
    colour = HEX("009cfd"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 25)
        G.GAME.modifiers.Heinous = true
    end,
})

SMODS.Stake({
    key = "abhorent",
    applied_stakes = { "abn_heinous" },
    above_stake = "abn_heinous",
    atlas = "AbandoniaStakes",
    pos = { x = 2, y = 3 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 3, y = 5 },
    colour = HEX("61797e"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 26)
        G.GAME.modifiers.Abhorent = true
    end,
})

SMODS.Stake({
    key = "bloodcurdling",
    applied_stakes = { "abn_abhorent" },
    above_stake = "abn_abhorent",
    atlas = "AbandoniaStakes",
    pos = { x = 3, y = 3 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 4, y = 5 },
    colour = HEX("fd5f55"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 27)
        G.GAME.modifiers.Bloodcurdling = true
    end,
})

SMODS.Stake({
    key = "repulsive",
    applied_stakes = { "abn_bloodcurdling" },
    above_stake = "abn_bloodcurdling",
    atlas = "AbandoniaStakes",
    pos = { x = 4, y = 3 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 0, y = 6 },
    colour = HEX("ebf6f8"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 28)
        G.GAME.modifiers.Repulsive = true
    end,
})

SMODS.Stake({
    key = "hazard",
    applied_stakes = { "abn_repulsive" },
    above_stake = "abn_repulsive",
    atlas = "AbandoniaStakes",
    pos = { x = 0, y = 4 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 1, y = 6 },
    colour = HEX("4f6367"),

    modifiers = function()
        G.GAME.win_ante = math.max(G.GAME.win_ante, 29)
        G.GAME.modifiers.Hazard = true
    end,
})
