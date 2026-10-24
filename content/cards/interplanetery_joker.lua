local function update_interplanetary_scaling()
    local has_joker = next(SMODS.find_card('j_abn_interplanetary_joker'))
    for _, h in pairs(G.GAME.hands) do
        if not h.abn_base_l_mult then
            h.abn_base_l_mult = h.l_mult
            h.abn_base_l_chips = h.l_chips
        end

        if has_joker then
            local top = math.max(h.abn_base_l_chips, h.abn_base_l_mult)
            h.l_chips = top
            h.l_mult = top
        else
            h.l_chips = h.abn_base_l_chips
            h.l_mult = h.abn_base_l_mult
        end
    end
end

local function reset_hands_to_level_1(source)
    for hand_key, h in pairs(G.GAME.hands) do
        local level = h.level

        if type(level) ~= "number" then
            if type(level) == "table" and level.to_number then
                level = level:to_number()
            elseif to_number then
                level = to_number(level)
            else
                level = tonumber(level) or 1
            end
        end

        if level > 1 then
            SMODS.upgrade_poker_hands({
                hands = { hand_key },
                level_up = -(level - 1),
                from = source,
            })
        end
    end
end

local level_up_hand_ref = level_up_hand
function level_up_hand(card, hand, instant, amount)
    update_interplanetary_scaling()
    return level_up_hand_ref(card, hand, instant, amount)
end

local ease_ante_ref = ease_ante
function ease_ante(mod, ...)
    local ret = ease_ante_ref(mod, ...)
    if mod and mod > 0 then
        local jokers = SMODS.find_card('j_abn_interplanetary_joker')
        if jokers[1] then
            reset_hands_to_level_1(jokers[1])
        end
    end
    return ret
end

SMODS.Joker {
    key = 'interplanetary_joker',
    atlas = 'ABNJokerSheet25',
    pos = { x = 3, y = 5 },
    rarity = 3,
    cost = 10,
    blueprint_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,

    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            reset_hands_to_level_1(card)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0,
            func = function()
                update_interplanetary_scaling()
                return true
            end
        }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0,
            func = function()
                update_interplanetary_scaling()
                return true
            end
        }))
    end,
	
	calculate = function(self, card, context)
		if context.using_consumeable and context.consumeable.ability.set == "Planet" then
			return {
				message = localize('k_level_up_ex'),
				card = card
            }
		end
	
        if context.end_of_round and context.main_eval and G.GAME.blind and G.GAME.blind.boss then
			return {
				message = localize('k_reset'),
				card = card
            }
        end
    end,


    abn_artist_credits = {
        artist = "TanTinch" 
    },
}