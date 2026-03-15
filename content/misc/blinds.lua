-- Hazard Heart
SMODS.Blind {
    key = "hazard_heart",
    dollars = 8,
    mult = 2,
    atlas = "AbandoniaBlinds",
    pos = { x = 0, y = 0 },
    boss = { showdown = true },
    boss_colour = HEX("ac3232"),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.debuff_card and context.debuff_card.area == G.jokers then
                if context.debuff_card.ability.hazard_heart_chosen then
                    return {
                        debuff = true
                    }
                end
            end

            if context.debuff_card and context.debuff_card.area == G.hand then
                if context.debuff_card.ability.hazard_heart_chosen then
                    return {
                        debuff = true
                    }
                end
            end

            if context.hand_drawn then
                if not blind.hazard_heart_prepped then
                    blind.hazard_heart_prepped = true

                    for _, joker in ipairs(G.jokers.cards) do
                        if joker.ability.hazard_heart_chosen then
                            joker.ability.hazard_heart_chosen = nil
                            if joker.debuff then SMODS.recalc_debuff(joker) end
                        end
                    end

                    for _, card in ipairs(G.hand.cards) do
                        if card.ability.hazard_heart_chosen then
                            card.ability.hazard_heart_chosen = nil
                            if card.debuff then SMODS.recalc_debuff(card) end
                        end
                    end

                    local joker_pool = {}
                    for _, joker in ipairs(G.jokers.cards) do
                        if not joker.debuff then
                            joker_pool[#joker_pool + 1] = joker
                        end
                    end

                    for i = 1, math.min(2, #joker_pool) do
                        local chosen, pos = pseudorandom_element(joker_pool, 'hazard_heart_joker_' .. i)
                        if chosen then
                            chosen.ability.hazard_heart_chosen = true
                            SMODS.recalc_debuff(chosen)
                            chosen:juice_up()
                            table.remove(joker_pool, pos)
                        end
                    end

                    if #G.hand.cards > 0 then
                        local chosen_card = pseudorandom_element(G.hand.cards, 'hazard_heart_hand')
                        if chosen_card then
                            chosen_card.ability.hazard_heart_chosen = true
                            SMODS.recalc_debuff(chosen_card)
                            chosen_card:juice_up()
                        end
                    end

                    blind:wiggle()
                end
            end
        end

        if context.setting_blind then
            blind.hazard_heart_prepped = nil
        end
        if context.press_play then
            blind.hazard_heart_prepped = nil
        end
    end,

    disable = function(self)
        for _, joker in ipairs(G.jokers.cards) do
            joker.ability.hazard_heart_chosen = nil
            if joker.debuff then SMODS.recalc_debuff(joker) end
        end
        for _, card in ipairs(G.playing_cards) do
            card.ability.hazard_heart_chosen = nil
            if card.debuff then SMODS.recalc_debuff(card) end
        end
    end,

    defeat = function(self)
        for _, joker in ipairs(G.jokers.cards) do
            joker.ability.hazard_heart_chosen = nil
            if joker.debuff then SMODS.recalc_debuff(joker) end
        end
        for _, card in ipairs(G.playing_cards) do
            card.ability.hazard_heart_chosen = nil
            if card.debuff then SMODS.recalc_debuff(card) end
        end
    end
}

-- Hazard Bell
SMODS.Blind {
    key = "hazard_bell",
    dollars = 8,
    mult = 2,
    atlas = "AbandoniaBlinds",
    pos = { x = 0, y = 1 },
    boss = { showdown = true },
    boss_colour = HEX("009cfd"),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.hand_drawn then
                for _, playing_card in ipairs(G.playing_cards) do
                    playing_card.ability.forced_selection = nil
                end

                if #G.hand.cards > 0 then
                    G.hand:unhighlight_all()

                    local pool = {}
                    for _, card in ipairs(G.hand.cards) do
                        pool[#pool + 1] = card
                    end

                    local first, pos = pseudorandom_element(pool, 'hazard_bell_1')
                    if first then
                        first.ability.forced_selection = true
                        G.hand:add_to_highlighted(first)
                        table.remove(pool, pos)
                    end

                    if #pool > 0 then
                        local second = pseudorandom_element(pool, 'hazard_bell_2')
                        if second then
                            second.ability.forced_selection = true
                            G.hand:add_to_highlighted(second)
                        end
                    end

                    blind:wiggle()
                end
            end
        end
    end,

    recalc_debuff = function(self, card, from_blind)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp or not G.jokers then
            return false
        end
        if card.area == G.jokers and #G.jokers.cards > 0 and card == G.jokers.cards[1] and not temp then
            return true
        end
        return false
    end,

    update = function(self, blind, dt)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if not temp and G.jokers then
            for _, v in ipairs(G.jokers.cards) do
                G.GAME.blind:debuff_card(v, true)
            end
        end
    end,

    disable = function(self)
        for _, playing_card in ipairs(G.playing_cards) do
            playing_card.ability.forced_selection = nil
        end
    end,

    defeat = function(self)
        for _, playing_card in ipairs(G.playing_cards) do
            playing_card.ability.forced_selection = nil
        end
    end
}

-- Hazard Acorn
SMODS.Blind {
    key = "hazard_acorn",
    dollars = 8,
    mult = 2,
    atlas = "AbandoniaBlinds",
    pos = { x = 0, y = 2 },
    boss = { showdown = true },
    boss_colour = HEX("fda200"),
    recalc_debuff = function(self, card, from_blind)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp or not G.jokers then
            return false
        end
        if card.area == G.jokers and #G.jokers.cards > 0 and card == G.jokers.cards[#G.jokers.cards] and not temp then
            return true
        end
        return false
    end,

    update = function(self, blind, dt)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if not temp and G.jokers then
            for _, v in ipairs(G.jokers.cards) do
                G.GAME.blind:debuff_card(v, true)
            end
        end
    end,
    set_blind = function(self)
        for _, joker in ipairs(G.jokers.cards) do
            if joker.facing == 'front' then
                joker:flip()
            end
        end
    end,
    press_play = function(self)
        if #G.jokers.cards > 0 then
            G.jokers:unhighlight_all()

            if #G.jokers.cards > 1 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 0.85)
                                return true
                            end,
                        }))
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 1.15)
                                return true
                            end
                        }))
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:shuffle('aajk')
                                play_sound('cardSlide1', 1)
                                return true
                            end
                        }))
                        delay(0.3)
                        return true
                    end
                }))
            end
        end
    end,
}

-- Hazard Leaf
SMODS.Blind {
    key = "hazard_leaf",
    dollars = 8,
    mult = 2,
    atlas = "AbandoniaBlinds",
    pos = { x = 0, y = 3 },
    boss = { showdown = true },
    boss_colour = HEX("56a786"),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                blind.hazard_leaf_sold = 0
            end

            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                if (blind.hazard_leaf_sold or 0) < 2 then
                    return {
                        debuff = true
                    }
                end
            end

            if context.selling_card and context.card.ability.set == 'Joker' then
                blind.hazard_leaf_sold = (blind.hazard_leaf_sold or 0) + 1

                if blind.hazard_leaf_sold >= 2 then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        func = function()
                            blind:disable()
                            return true
                        end
                    }))
                else
                    blind:wiggle()
                end
            end
        end
    end,
}

-- Hazard Vessel
SMODS.Blind {
    key = "hazard_vessel",
    dollars = 8,
    mult = 8,
    atlas = "AbandoniaBlinds",
    pos = { x = 0, y = 4 },
    boss = { showdown = true },
    boss_colour = HEX("8a71e1"),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.hand_drawn then
                for _, card in ipairs(G.hand.cards) do
                    if card.ability.hazard_vessel_chosen then
                        card.ability.hazard_vessel_chosen = nil
                        if card.debuff then SMODS.recalc_debuff(card) end
                    end
                end

                if G.hand.cards[1] then
                    G.hand.cards[1].ability.hazard_vessel_chosen = true
                    SMODS.recalc_debuff(G.hand.cards[1])
                    G.hand.cards[1]:juice_up()
                    blind:wiggle()
                end
            end

            if context.debuff_card and context.debuff_card.area == G.hand then
                if context.debuff_card.ability.hazard_vessel_chosen then
                    return {
                        debuff = true
                    }
                end
            end
        end
    end,

    disable = function(self)
        for _, card in ipairs(G.playing_cards) do
            card.ability.hazard_vessel_chosen = nil
            if card.debuff then SMODS.recalc_debuff(card) end
        end
    end,

    defeat = function(self)
        for _, card in ipairs(G.playing_cards) do
            card.ability.hazard_vessel_chosen = nil
            if card.debuff then SMODS.recalc_debuff(card) end
        end
    end
}
