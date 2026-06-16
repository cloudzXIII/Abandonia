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

    -- Ensure win_ante stays locked based on modifiers
    if G.GAME then
        if G.GAME.modifiers.Toxic and G.GAME.win_ante < 11 then
            G.GAME.win_ante = 11
        elseif G.GAME.modifiers.Menacing and G.GAME.win_ante < 10 then
            G.GAME.win_ante = 10
        elseif G.GAME.modifiers.Honor and G.GAME.win_ante < 9 then
            G.GAME.win_ante = 9
        end
    end

    -- Logic for forcing specific Blinds (Hazards/Showdowns)
    if G.STATE == G.STATES.BLIND_SELECT and G.GAME then
        local is_honor = G.GAME.modifiers.Honor
        local is_menacing = G.GAME.modifiers.Menacing
        local is_toxic = G.GAME.modifiers.Toxic

        if is_honor or is_menacing or is_toxic then
            local current_ante = G.GAME.round_resets.ante

            -- Define Hazard Antes based on your new rules
            local is_hazard_ante = (is_honor and (current_ante == 4 or current_ante == 8 or current_ante == 9)) or
                (is_menacing and (current_ante == 5 or current_ante == 10)) or
                (is_toxic and (current_ante == 6 or current_ante == 11))

            -- In your new request, you mentioned these specific antes are Hazards.
            -- If you still want "Showdowns" elsewhere, add them here, otherwise this focuses on Hazards.
            if is_hazard_ante then
                local current_boss_key = G.GAME.round_resets.blind_choices.Boss or ""
                local is_hazard = current_boss_key:find("bl_abn_hazard")

                if not is_hazard then
                    G.GAME.HonorShowdownTimer = (G.GAME.HonorShowdownTimer or 0) + 1

                    if G.GAME.HonorShowdownTimer >= 20 then
                        G.GAME.HonorShowdownTimer = 0
                        local pool = {}

                        for k, v in pairs(G.P_BLINDS) do
                            if k:find("bl_abn_hazard") then pool[#pool + 1] = k end
                        end

                        if #pool > 0 then
                            local r_count = G.GAME.round_resets.boss_reroll_count or 0
                            local choice = pool[pseudorandom('Honor_hazard' .. current_ante .. r_count, 1, #pool)]
                            G.GAME.round_resets.blind_choices.Boss = choice

                            -- UI Refresh
                            if G.blind_select_opts and G.blind_select_opts.boss then
                                local par = G.blind_select_opts.boss.parent
                                G.blind_select_opts.boss:remove()
                                G.blind_select_opts.boss = UIBox {
                                    definition = {
                                        n = G.UIT.ROOT,
                                        config = { align = "cm", colour = G.C.CLEAR },
                                        nodes = {
                                            UIBox_dyn_container({ create_UIBox_blind_choice('Boss') }, false, get_blind_main_colour('Boss'), mix_colours(G.C.BLACK, get_blind_main_colour('Boss'), 0.8))
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
        end
    end

    -- Toxic Flip Mechanic
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

--- STAKES DEFINITIONS ---

SMODS.Stake({
    key = "honor",
    applied_stakes = {},
    above_stake = "gold",
    atlas = "AbandoniaStakes",
    pos = { x = 0, y = 0 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 1, y = 2 },
    colour = G.C.WHITE,
    modifiers = function()
        G.GAME.win_ante = 9
        G.GAME.modifiers.Honor = true
    end,
})

SMODS.Stake({
    key = "menacing",
    applied_stakes = { "abn_honor" },
    above_stake = "abn_honor",
    atlas = "AbandoniaStakes",
    pos = { x = 1, y = 0 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 2, y = 2 },
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 10
        G.GAME.modifiers.Menacing = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
    end,
})

SMODS.Stake({
    key = "toxic",
    applied_stakes = { "abn_menacing" },
    above_stake = "abn_menacing",
    atlas = "AbandoniaStakes",
    pos = { x = 2, y = 0 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 3, y = 2 },
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 11
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
    end,
})
