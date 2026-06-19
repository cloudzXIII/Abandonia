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
		if G.GAME.modifiers.Noxious and G.GAME.win_ante < 12 then
            G.GAME.win_ante = 12
        elseif G.GAME.modifiers.Toxic and G.GAME.win_ante < 11 then
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

SMODS.Stake({
    key = "noxious",
    applied_stakes = { "abn_toxic" },
    above_stake = "abn_toxic",
    atlas = "AbandoniaStakes",
    pos = { x = 3, y = 0 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 4, y = 2 },
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 12
		G.GAME.modifiers.Noxious = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
    end,
})

SMODS.Stake({
    key = "lethal",
    applied_stakes = { "abn_noxious" },
    above_stake = "abn_noxious",
    atlas = "AbandoniaStakes",
    pos = { x = 4, y = 0 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 0, y = 3 },
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 13
		G.GAME.modifiers.Lethal = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 14
		G.GAME.modifiers.Baneful = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
    end,
})

SMODS.Stake({
    key = "malicious",
    applied_stakes = { "abn_baneful" },
    above_stake = "abn_baneful",
    atlas = "AbandoniaStakes",
    pos = { x = 1, y = 1 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 2, y = 3 },
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 15
		G.GAME.modifiers.Malicious = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
    end,
})

SMODS.Stake({
    key = "malignant",
    applied_stakes = { "abn_malicious" },
    above_stake = "abn_malicious",
    atlas = "AbandoniaStakes",
    pos = { x = 2, y = 1 },
    sticker_atlas = "AbandoniaStakeStickers",
    sticker_pos = { x = 3, y = 3 },
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 16
		G.GAME.modifiers.Malignant = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 17
		G.GAME.modifiers.Inhospitable = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 18
		G.GAME.modifiers.Unendurable = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 19
		G.GAME.modifiers.Torturous = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 20
		G.GAME.modifiers.Wretched = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 21
		G.GAME.modifiers.Agonizing = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 22
		G.GAME.modifiers.Deplorable = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 23
		G.GAME.modifiers.Vile = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 24
		G.GAME.modifiers.Revolting = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 25
		G.GAME.modifiers.Heinous = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 26
		G.GAME.modifiers.Abhorent = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 27
		G.GAME.modifiers.Bloodcurdling = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 28
		G.GAME.modifiers.Repulsive = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
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
    colour = G.C.WHITE,

    modifiers = function()
        G.GAME.win_ante = 29
		G.GAME.modifiers.Hazard = true
        G.GAME.modifiers.Toxic = true
        G.GAME.modifiers.enable_eternals_in_shop = true
        G.GAME.modifiers.enable_perishables_in_shop = true
        G.GAME.modifiers.enable_rentals_in_shop = true
    end,
})