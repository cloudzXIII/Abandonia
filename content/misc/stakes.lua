-- Initialize the Timer variable
local igo = Game.init_game_object
function Game:init_game_object(...)
    local ret = igo(self, ...)
    ret.HonorShowdownTimer = 0
    return ret
end

local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)
	
	--i have no idea why this wasn't working right but this should force it
	if G.GAME.modifiers.Menacing and G.GAME.win_ante < 12 and G.jokers then
		G.GAME.win_ante = 12
	end

    if G.STATE == G.STATES.BLIND_SELECT then
        local is_honor = G.GAME.modifiers.Honor
        local is_menacing = G.GAME.modifiers.Menacing
        local is_toxic = G.GAME.modifiers.Toxic
        
        if is_honor or is_menacing or is_toxic then
            local current_ante = G.GAME.round_resets.ante
            
            -- Hazards: Ante 10 (Honor), 10/12 (Menacing), 10/12/14 (Toxic)
            local is_hazard_ante = (is_honor and current_ante > 0 and current_ante % 10 == 0) or 
                                   (is_menacing and (current_ante == 10 or current_ante == 12)) or
                                   (is_toxic and (current_ante == 10 or current_ante == 12 or current_ante == 14))
            
            -- Showdowns: Ante 4/8 (Honor), 4/6 (Menacing/Toxic)
            local is_showdown_ante = (is_honor and current_ante > 0 and current_ante % 4 == 0) or 
                                     ((is_menacing or is_toxic) and (current_ante == 4 or current_ante == 6))

            if is_hazard_ante or is_showdown_ante then
                local current_boss_key = G.GAME.round_resets.blind_choices.Boss or ""
                local is_hazard = current_boss_key:find("bl_abn_hazard")
                local is_showdown = G.P_BLINDS[current_boss_key] and (G.P_BLINDS[current_boss_key].boss and (G.P_BLINDS[current_boss_key].boss.showdown or G.P_BLINDS[current_boss_key].showdown or current_boss_key:find("bl_final")))

                local needs_flip = false
                if is_hazard_ante then
                    if not is_hazard then needs_flip = true end
                elseif is_showdown_ante then
                    -- Wrong if not a showdown OR if it's a hazard (since hazards are excluded from finishers)
                    if not is_showdown or is_hazard then needs_flip = true end
                end

                if needs_flip then
                    G.GAME.HonorShowdownTimer = (G.GAME.HonorShowdownTimer or 0) + 1
                    
                    if G.GAME.HonorShowdownTimer >= 20 then
                        G.GAME.HonorShowdownTimer = 0
                        local pool = {}
                        
                        if is_hazard_ante then
                            for k, v in pairs(G.P_BLINDS) do
                                if k:find("bl_abn_hazard") then pool[#pool + 1] = k end
                            end
                        else
                            for k, v in pairs(G.P_BLINDS) do
                                local v_is_showdown = v.boss and (v.boss.showdown or v.showdown or k:find("bl_final"))
                                local v_is_hazard = k:find("bl_abn_hazard")
                                if v_is_showdown and not v_is_hazard then pool[#pool + 1] = k end
                            end
                        end

                        if #pool > 0 then
                            local r_count = G.GAME.round_resets.boss_reroll_count or 0
                            local seed_type = is_hazard_ante and 'Honor_hazard' or 'Honor_showdown'
                            local choice = pool[pseudorandom(seed_type..current_ante..r_count, 1, #pool)]
                            
                            G.GAME.round_resets.blind_choices.Boss = choice
                            
                            -- UI Refresh Logic
                            if G.blind_select_opts and G.blind_select_opts.boss then
                                local par = G.blind_select_opts.boss.parent
                                G.blind_select_opts.boss:remove()
                                G.blind_select_opts.boss = UIBox {
                                    definition = {
                                        n = G.UIT.ROOT,
                                        config = { align = "cm", colour = G.C.CLEAR },
                                        nodes = {
                                            UIBox_dyn_container(
                                                { create_UIBox_blind_choice('Boss') },
                                                false,
                                                get_blind_main_colour('Boss'),
                                                mix_colours(G.C.BLACK, get_blind_main_colour('Boss'), 0.8)
                                            )
                                        }
                                    },
                                    config = { align = "bmi", offset = { x = 0, y = G.ROOM.T.y + 9 }, major = par, xy_bond = 'Weak' }
                                }
                                par.config.object = G.blind_select_opts.boss
                                par.config.object:recalculate()
                                G.blind_select_opts.boss.parent = par
                                G.blind_select_opts.boss.alignment.offset.y = 0
                                G.blind_select_opts.boss:juice_up()
                            end
                        end
                    end
                else
                    G.GAME.HonorShowdownTimer = 0
                end
            end
        else
            if G.GAME then G.GAME.HonorShowdownTimer = 0 end
        end
    else
        if G.GAME then G.GAME.HonorShowdownTimer = 0 end
    end
end

SMODS.Stake({
    key = "honor",
    applied_stakes = {},
    above_stake = "gold",
	unlocked_stake = "abn_menacing",
    atlas = "AbandoniaStakes",
    pos = {x = 0, y = 0},
	sticker_atlas = "AbandoniaStickers",
	sticker_pos = { x = 5, y = 6 },
	colour = G.C.WHITE,
    shiny = false,

    loc_txt = {
        name = "Honor Jimbo",
        text = {
            "Finshing blind is on ante {C:attention}10{}",
			"Finisher blinds appear ante {C:attention}4{} and {C:attention}10{}",
			"Final blind is a {C:abn_hazard}Hazard{} blind",
        },
    },

    modifiers = function()
		G.GAME.win_ante = 10
		G.GAME.modifiers.Honor = true
    end,
})

SMODS.Stake({
    key = "menacing",
    applied_stakes = { "abn_honor" },
    above_stake = "abn_honor",
	unlocked_stake = "abn_toxic",
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    atlas = "AbandoniaStakes",
    pos = {x = 1, y = 0},
	sticker_atlas = "AbandoniaStickers",
	sticker_pos = { x = 0, y = 7 },
	colour = G.C.WHITE,
    shiny = false,

    loc_txt = {
        name = "Menacing Jimbo",
        text = {
			"Jokers can have stickers",
            "Finshing blind is on ante {C:attention}12{}",
			"Finisher blinds appear ante {C:attention}4{} and {C:attention}6{}",
			"Ante {C:attention}10{} and {C:attention}12{} are {C:abn_hazard}Hazard{} blinds",
        },
    },

    modifiers = function()
		G.GAME.win_ante = 12
		G.GAME.win_ante = 12
		G.GAME.win_ante = 12
		G.GAME.modifiers.Menacing = true
		G.GAME.modifiers.enable_eternals_in_shop = true
		G.GAME.modifiers.enable_perishables_in_shop = true
		G.GAME.modifiers.enable_rentals_in_shop = true
    end,
})

local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)

    -- Only run if we are in the shop, Toxic is active, and the shop actually has cards
    if G.STATE == G.STATES.SHOP and G.GAME.modifiers.Toxic and G.shop_jokers and G.shop_jokers.cards then
        for _, v in ipairs(G.shop_jokers.cards) do
		
            -- Check if it's a Joker and we have checked it yet
            if v.config.center.set == 'Joker' and not v.ability.abn_toxic_checked then
                
                -- Set a 30% chance to flip
                if pseudorandom('toxic_flip') < 0.3 then 
                    if v.facing == 'front' then
                        v:flip()
                    end
                    v.ability.abn_perma_flipped = true -- Mark as permanently flipped
                end

                -- Mark that we've checked it
                v.ability.abn_toxic_checked = true 
            end
        end
    end
end

SMODS.Stake({
    key = "toxic",
    applied_stakes = { "abn_menacing" },
    above_stake = "abn_menacing",
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    atlas = "AbandoniaStakes",
    pos = {x = 2, y = 0},
	sticker_atlas = "AbandoniaStickers",
	sticker_pos = { x = 1, y = 7 },
	colour = G.C.WHITE,
    shiny = false,

    loc_txt = {
        name = "Toxic Jimbo",
        text = {
			"Jokers can have stickers",
			"Jokers can be flipped",
            "Finshing blind is on ante {C:attention}14{}",
			"Finisher blinds appear ante {C:attention}4{} and {C:attention}6{}",
			"Ante {C:attention}10{} {C:attention}12{} and {C:attention}14{} are {C:abn_hazard}Hazard{} blinds",
        },
    },

    modifiers = function()
		G.GAME.win_ante = 14
		G.GAME.modifiers.Toxic = true
		G.GAME.modifiers.enable_eternals_in_shop = true
		G.GAME.modifiers.enable_perishables_in_shop = true
		G.GAME.modifiers.enable_rentals_in_shop = true
    end,
})

