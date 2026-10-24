local VANILLA_FOOD = {
    j_gros_michel = true, j_egg = true, j_ice_cream = true, j_cavendish = true,
    j_turtle_bean = true, j_diet_cola = true, j_popcorn = true, j_ramen = true,
    j_selzer = true,
}

local function is_food(c)
    local center = c.config.center
    if VANILLA_FOOD[center.key] then return true end
    if center.pools and center.pools.Food then return true end
    for _, a in ipairs(center.attributes or {}) do
        if a == "food" then return true end
    end
    return false
end

SMODS.Joker {
    key = 'fruit_of_the_vine',
    atlas = 'ABNJokerSheet27',
    pos = { x = 6, y = 2 },
    rarity = 3,
    cost = 10,
    blueprint_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    attributes = { "food" },

    config = { extra = { amp = 0, modulate = 0, amp_gain = 0.35, modulate_gain = 0.30 } },

    in_pool = function(self, args)
        local vanilla, modded = false, false
        for _, j in ipairs(G.jokers and G.jokers.cards or {}) do
            if is_food(j) then
                if j.config.center.mod then modded = true else vanilla = true end
            end
        end
        return vanilla and modded
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.amp_gain, card.ability.extra.modulate_gain, card.ability.extra.amp, card.ability.extra.modulate } }
    end,

    calculate = function(self, card, context)
        if context.post_trigger and context.other_card and not context.blueprint then
            local target = context.other_card
            if target ~= card and target.ability and target.ability.set == 'Joker' and is_food(target) then
                local upgrade_color
                if target.config.center.mod then
                    card.ability.extra.modulate = card.ability.extra.modulate + card.ability.extra.modulate_gain
                    upgrade_color = HEX("ba46ec")
                else
                    card.ability.extra.amp = card.ability.extra.amp + card.ability.extra.amp_gain
                    upgrade_color = HEX("ff77a8")
                end
                card:juice_up()
                return { message = localize('k_upgrade_ex'), colour = upgrade_color, message_card = card }
            end
        end

        if context.joker_main and (card.ability.extra.amp > 0 or card.ability.extra.modulate > 0) then
            return { amp = card.ability.extra.amp > 0 and card.ability.extra.amp or nil, modulate = card.ability.extra.modulate > 0 and card.ability.extra.modulate or nil }
        end
    end,

    update = function(self, card, dt)
        if not card.added_to_deck or card.area ~= G.jokers or card.ability.abn_fotv_dying then return end
        for _, j in ipairs(G.jokers.cards) do
            if j ~= card and not j.getting_sliced and is_food(j) then return end
        end
        card.ability.abn_fotv_dying = true
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            blockable = false,
            func = function()
                SMODS.destroy_cards(card, nil, nil, true)
                return true
            end
        }))
    end,

    abn_artist_credits = {
		artist = "Shai1n" 
	},
}