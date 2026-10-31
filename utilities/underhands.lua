Abandonia = SMODS.current_mod

local function five_unique(cards, getter)
    if #cards ~= 5 then return false end
    local seen = {}
    for _, c in ipairs(cards) do
        local v = getter(c)
        if not v or seen[v] then return false end
        seen[v] = true
    end
    return true
end

local function copy_into(c, src)
    c[1], c[2], c[3], c[4] = src[1], src[2], src[3], src[4] or 1
end

local function get_stamp(c)
    if not c.ability then return nil end
    for key, obj in pairs(SMODS.Stickers) do
        if obj.set == "stamp" and c.ability[key] then return key end
    end
    return nil
end

local RAINBOW = {
    { 0.95, 0.30, 0.30 }, { 1.00, 0.65, 0.20 }, { 1.00, 0.90, 0.30 }, { 0.40, 0.85, 0.40 },
    { 0.30, 0.85, 0.95 }, { 0.40, 0.50, 1.00 }, { 0.70, 0.40, 0.95 }, { 1.00, 0.45, 0.75 },
}


Abandonia.Underhands = {
    abn_uh_starlight = {
        name = "Starlight",
        priority = 1,
        paint = function(c) copy_into(c, G.C.GOLD) end,
        x_mult = 1.10, x_chips = 1.10,
        l_mult = 0.05, l_chips = 0.05,
        check_hand = function(cards)
            if #cards ~= 5 then return false end
            for _, c in ipairs(cards) do
                if not ABN.is_light(c) then return false end
            end
            return true
        end,
    },
    abn_uh_darksky = {
        name = "Darksky",
        priority = 1,
        paint = function(c) copy_into(c, G.C.PURPLE) end,
        x_mult = 1.10, x_chips = 1.10,
        l_mult = 0.05, l_chips = 0.05,
        check_hand = function(cards)
            if #cards ~= 5 then return false end
            for _, c in ipairs(cards) do
                if not ABN.is_dark(c) then return false end
            end
            return true
        end,
    },

    abn_uh_humble = {
        name = "Humble",
        priority = 1,
        paint = function(c) copy_into(c, G.C.BLUE) end,
        x_mult = 1.10, x_chips = 1.10,
        l_mult = 0.05, l_chips = 0.05,
        check_hand = function(cards)
            if #cards ~= 5 then return false end
            for _, c in ipairs(cards) do
                if not (c.base and c.base.nominal < 6) then return false end
            end
            return true
        end,
    },

    abn_uh_lofty = {
        name = "Lofty",
        priority = 1,
        paint = function(c) copy_into(c, G.C.RED) end,
        x_mult = 1.10, x_chips = 1.10,
        l_mult = 0.05, l_chips = 0.05,
        check_hand = function(cards)
            if #cards ~= 5 then return false end
            for _, c in ipairs(cards) do
                if not (c.base and c.base.nominal >= 7) then return false end
            end
            return true
        end,
    },

    abn_uh_augmentation = {
        name = "Augmentation",
        priority = 2,
        paint = function(c, i)
            local col = RAINBOW[(i - 1) % #RAINBOW + 1]
            c[1], c[2], c[3], c[4] = col[1], col[2], col[3], 1
        end,
        x_mult = 1.15, x_chips = 1.15,
        l_mult = 0.05, l_chips = 0.05,
        check_hand = function(cards)
            return five_unique(cards, function(c)
                local key = c.config and c.config.center_key
                if not key or key == "c_base" then return nil end
                return key
            end)
        end,
    },

    abn_uh_instefication = {
        name = "Instefication",
        priority = 2,
        paint = function(c, i, t)
            local p = t * 2 - i * 0.6
            c[1] = 0.65 + 0.35 * math.sin(p)
            c[2] = 0.65 + 0.35 * math.sin(p + 2.1)
            c[3] = 0.65 + 0.35 * math.sin(p + 4.2)
            c[4] = 1
        end,
        x_mult = 1.15, x_chips = 1.15,
        l_mult = 0.05, l_chips = 0.05,
        check_hand = function(cards)
            return five_unique(cards, function(c) return c.seal end)
        end,
    },

    abn_uh_incrementation = {
        name = "Incrementation",
        priority = 2,
        paint = function(c, i, t)
            local k = 0.5 + 0.5 * math.sin(t * 3 - i * 0.7) 
            c[1] = 0.45 + 0.55 * k
            c[2] = 0.75 + 0.25 * k
            c[3] = 1
            c[4] = 1
        end,
        x_mult = 1.15, x_chips = 1.15,
        l_mult = 0.05, l_chips = 0.05,
        check_hand = function(cards)
            return five_unique(cards, function(c)
                return c.edition and (c.edition.key or c.edition.type)
            end)
        end,
    },

    abn_uh_circumnavigation = {
        name = "Circumnavigation",
        priority = 2,
        paint = function(c, i, t)
            local k = 0.5 + 0.5 * math.sin(t * 2 + i * 0.8)
            c[1] = 0.25 + 0.2 * k
            c[2] = 0.60 + 0.30 * k
            c[3] = 0.85 + 0.15 * k
            c[4] = 1
        end,
        x_mult = 1.15, x_chips = 1.15,
        l_mult = 0.05, l_chips = 0.05,
        check_hand = function(cards)
            -- cards with no stamp return nil, which five_unique rejects
            return five_unique(cards, get_stamp)
        end,
    },
	
	    abn_uh_cliptomania = {
        name = "Cliptomania",
        priority = 2,
        paint = function(c, i, t)
            local k = 0.5 + 0.5 * math.sin(t * 2.5 - i * 0.7)
            c[1] = 0.35 + 0.20 * k
            c[2] = 0.30 + 0.55 * k
            c[3] = 0.82 - 0.50 * k
            c[4] = 1
        end,
        x_mult = 1.15, x_chips = 1.15,
        l_mult = 0.05, l_chips = 0.05,
        check_hand = function(cards)
            if not (PB_UTIL and PB_UTIL.has_paperclip) then return false end
            return five_unique(cards, function(c)
                return PB_UTIL.has_paperclip(c) or nil
            end)
        end,
    },
}

local igo = Game.init_game_object
function Game:init_game_object(...)
    local ret = igo(self, ...)
    ret.abn_underhands = ret.abn_underhands or {}
    for key in pairs(Abandonia.Underhands) do
        ret.abn_underhands[key] = ret.abn_underhands[key] or { level = 1 }
    end
    return ret
end

function Abandonia.get_underhand(cards)
	if not G.GAME or not G.GAME.abn_underhands_unlocked then return nil end
    local best_key, best_pri
    for key, uh in pairs(Abandonia.Underhands) do
        if uh.check_hand(cards) and (not best_pri or (uh.priority or 0) > best_pri) then
            best_key, best_pri = key, uh.priority or 0
        end
    end
    return best_key
end

function Abandonia.get_uh_colours()
    if not G.C.ABN_UH_LIST then
        G.C.ABN_UH_LIST = {}
        for i = 1, 8 do G.C.ABN_UH_LIST[i] = { 1, 1, 1, 1 } end
    end
    return G.C.ABN_UH_LIST
end

local old_get_hand_info = G.FUNCS.get_poker_hand_info
function G.FUNCS.get_poker_hand_info(_cards)
    local text, loc_disp_text, poker_hands, scoring_hand, disp_text = old_get_hand_info(_cards)
    local hand = G.GAME.current_round.current_hand
    if not hand then return text, loc_disp_text, poker_hands, scoring_hand, disp_text end

    hand.abn_underhand = Abandonia.get_underhand(_cards)
    local uh = hand.abn_underhand and Abandonia.Underhands[hand.abn_underhand]
    hand.abn_underhand_text = uh and uh.name or ""
    return text, loc_disp_text, poker_hands, scoring_hand, disp_text
end

G.FUNCS.abn_uh_UI_set = function(e)
    local hand = G.GAME.current_round.current_hand
    if not hand then return end
    local uh = hand.abn_underhand and Abandonia.Underhands[hand.abn_underhand]
    if uh and uh.paint then
        local t = G.TIMERS and G.TIMERS.REAL or 0
        for i, c in ipairs(Abandonia.get_uh_colours()) do uh.paint(c, i, t) end
    end
    e.config.object:update_text()
end

local evaluate_round_ref = G.FUNCS.evaluate_round
function G.FUNCS.evaluate_round()
    evaluate_round_ref()
    local hand = G.GAME.current_round.current_hand
    if hand then
        hand.abn_underhand = nil
        hand.abn_underhand_text = ""
    end
end


function Abandonia.get_underhand_value(original, value_type)
    local hand = G.GAME.current_round.current_hand
    local key = hand and hand.abn_underhand
    local uh = key and Abandonia.Underhands[key]
    if not uh then return original end

    local state = G.GAME.abn_underhands and G.GAME.abn_underhands[key]
    local lvl = (state and state.level or 1) - 1

    if value_type == "mult" then
        return original * (uh.x_mult + uh.l_mult * lvl)
    elseif value_type == "chips" then
        return original * (uh.x_chips + uh.l_chips * lvl)
    end
    return original
end
