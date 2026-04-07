SMODS.Joker {
    key = 'jokerge',
    rarity = 4,
    atlas = 'AbandoniaJokers',
    pos = { x = 6, y = 31 },
    soul_pos = { x = 7, y = 31 },
    cost = 20,
    discovered = false,
    blueprint_compat = false,

    update = function(self, card)
        if card.area == G.jokers then
            local function double_joker_values(j)
                if j.ability.set == "Joker" and not j.ability.jokerged then
                    local changed_extra = false
                    if type(j.ability.extra) == "table" then
                        for k, v in pairs(j.ability.extra) do
                            if type(v) == "number" then j.ability.extra[k] = v * 2; changed_extra = true end
                        end
                    elseif type(j.ability.extra) == "number" then
                        j.ability.extra = j.ability.extra * 2
                        changed_extra = true
                    end

                    if not changed_extra then
                        for k, v in pairs(j.ability) do
                            if type(v) == "number" and k ~= 'id' and k ~= 'groups' then
                                if (k == "h_x_chips" or k == "x_mult" or k == "x_chips") then
                                    if v > 1 then j.ability[k] = v * 2 end
                                elseif v > 0 then j.ability[k] = v * 2 end
                            end
                        end
                    end
                    j.sell_cost = j.sell_cost * 2
                    j.ability.jokerged = true 
                    j:juice_up()
                end
            end

            for _, j in ipairs(G.shop_jokers.cards) do double_joker_values(j) end
            for _, j in ipairs(G.jokers.cards) do if j ~= card then double_joker_values(j) end end
        end
    end,

    remove_from_deck = function(self, card)
        local function halve_joker_values(j)
            -- Only halve if it was previously doubled by Jokerge
            if j.ability.set == "Joker" and j.ability.jokerged then
                local changed_extra = false

                -- 1. REVERSE extra
                if type(j.ability.extra) == "table" then
                    for k, v in pairs(j.ability.extra) do
                        if type(v) == "number" then
                            j.ability.extra[k] = v / 2
                            changed_extra = true
                        end
                    end
                elseif type(j.ability.extra) == "number" then
                    j.ability.extra = j.ability.extra / 2
                    changed_extra = true
                end

                -- 2. REVERSE ability
                if not changed_extra then
                    for k, v in pairs(j.ability) do
                        if type(v) == "number" and k ~= 'id' and k ~= 'groups' then
                            if (k == "h_x_chips" or k == "x_mult" or k == "x_chips") then
                                -- Only halve if it's still above the base 1x
                                if v > 1 then j.ability[k] = v / 2 end
                            elseif v > 0 then
                                j.ability[k] = v / 2
                            end
                        end
                    end
                end

                j.sell_cost = math.max(1, math.floor(j.sell_cost / 2))
                j.ability.jokerged = nil -- Reset the flag
                j:juice_up()
            end
        end

        -- Clean up all jokers in shop and inventory
        if G.shop_jokers then
            for _, j in ipairs(G.shop_jokers.cards) do halve_joker_values(j) end
        end
        if G.jokers then
            for _, j in ipairs(G.jokers.cards) do halve_joker_values(j) end
        end
    end,

    abn_artist_credits = {
        artist = "Boyaka"
    },
}