SMODS.ConsumableType {
  key = "tonality",
  primary_colour = HEX("d6d6d6"),
  secondary_colour = HEX("d6d6d6"),
  text_colour = HEX("798c90"),
  collection_rows = { 5, 5 },
  shop_rate = 0.4,
  select_card = "consumeables",
}

local can_sell_ref = Card.can_sell_card
function Card:can_sell_card(context)
    if self.config and self.config.center and self.config.center.set == "tonality" then
        return false
    end
    return can_sell_ref(self, context)
end

SMODS.Consumable {
    key = "whole",
    set = "tonality",
    config = { extra = { uses = 3, active_charges = 0, amp = 10 } },
    pos = { x = 6, y = 0 },
    atlas = "AbandoniaTonality",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)        
        return { vars = { card.ability.extra.uses, card.ability.extra.amp, card.ability.extra.active_charges } }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0
    end,

    keep_on_use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        return (card.ability.extra.uses > 0) or (card.ability.extra.active_charges > 0)
    end,

    use = function(self, card, area, copier)
        card.ability.extra.active_charges = card.ability.extra.active_charges + 1

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if card.ability.extra.active_charges > 0 then
                local other = context.other_card
                local is_rankless = other.config.center == G.P_CENTERS.m_stone 
                    or other:get_id() == nil

                if is_rankless then
                    card.ability.extra.active_charges = card.ability.extra.active_charges - 1

                    if card.ability.extra.uses <= 0 and card.ability.extra.active_charges <= 0 then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:start_dissolve()
                                return true
                            end
                        }))
                    end

                    return {
                        amp = card.ability.extra.amp,
                        card = card
                    }
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b",
    },
}

SMODS.Consumable {
    key = "arpeggio",
    set = "tonality",
    config = { extra = { uses = 3, active_charges = 0 } },
    pos = { x = 3, y = 0 },
    atlas = "AbandoniaTonality",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses, card.ability.extra.active_charges } }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0
    end,

    keep_on_use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        return (card.ability.extra.uses > 0) or (card.ability.extra.active_charges > 0)
    end,

    use = function(self, card, area, copier)
        card.ability.extra.active_charges = card.ability.extra.active_charges + 1

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if card.ability.extra.active_charges > 0 then
                if SMODS.has_no_suit(context.other_card) then
                    card.ability.extra.active_charges = card.ability.extra.active_charges - 1

                    if card.ability.extra.uses <= 0 and card.ability.extra.active_charges <= 0 then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:start_dissolve()
                                return true
                            end
                        }))
                    end

                    return {
                        modulate = context.other_card.base.nominal,
                        card = card
                    }
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b",
    },
}

SMODS.Consumable {
    key = "vibrato",
    set = "tonality",
    config = { extra = { uses = 3, active_charges = 0 } },
    pos = { x = 2, y = 0 },
    atlas = "AbandoniaTonality",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses, card.ability.extra.active_charges } }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0
    end,

    keep_on_use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        return (card.ability.extra.uses > 0) or (card.ability.extra.active_charges > 0)
    end,

    use = function(self, card, area, copier)
        card.ability.extra.active_charges = card.ability.extra.active_charges + 1

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if card.ability.extra.active_charges > 0 then
                if SMODS.has_no_suit(context.other_card) then
                    card.ability.extra.active_charges = card.ability.extra.active_charges - 1

                    if card.ability.extra.uses <= 0 and card.ability.extra.active_charges <= 0 then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:start_dissolve()
                                return true
                            end
                        }))
                    end

                    return {
                        dollars = context.other_card.base.nominal,
                        card = card
                    }
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b",
    },
}

SMODS.Consumable {
    key = "tremolo",
    set = "tonality",
    config = { extra = { uses = 3, active_charges = 0 } },
    pos = { x = 1, y = 0 },
    atlas = "AbandoniaTonality",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses, card.ability.active_charges } }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0
    end,

    keep_on_use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        return (card.ability.extra.uses > 0) or (card.ability.extra.active_charges > 0)
    end,

    use = function(self, card, area, copier)
        card.ability.extra.active_charges = card.ability.extra.active_charges + 1

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual
            and card.ability.extra.active_charges > 0
            and SMODS.has_no_suit(context.other_card) then

            card.ability.extra.active_charges = card.ability.extra.active_charges - 1
            local rank = context.other_card.base.nominal

            for _, scored in ipairs(context.scoring_hand) do
                SMODS.calculate_effect({ chips = rank }, scored)
            end

            if card.ability.extra.uses <= 0 and card.ability.extra.active_charges <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b",
    },
}

SMODS.Consumable {
    key = "cresendo",
    set = "tonality",
    config = { extra = { uses = 3, active_charges = 0, levels = 2 } },
    pos = { x = 0, y = 0 },
    atlas = "AbandoniaTonality",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses, card.ability.extra.active_charges, card.ability.extra.levels } }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0
    end,

    keep_on_use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        return (card.ability.extra.uses > 0) or (card.ability.extra.active_charges > 0)
    end,

    use = function(self, card, area, copier)
        card.ability.extra.active_charges = card.ability.extra.active_charges + 1

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        if context.before and card.ability.extra.active_charges > 0 then
            local triggered = false

            for _, scored in ipairs(context.scoring_hand) do
                if card.ability.extra.active_charges <= 0 then break end

                if SMODS.has_no_suit(scored) and scored.base and scored.base.value
                    and G.GAME.abn_rank_upgrades[scored.base.value] then

                    card.ability.extra.active_charges = card.ability.extra.active_charges - 1
                    triggered = true

                    ABN.level_up_rank(card, scored.base.value, card.ability.extra.levels, false)

                    SMODS.calculate_effect({
                        message = localize('k_level_up_ex'),
                    }, scored)
                end
            end

            if triggered and card.ability.extra.uses <= 0 and card.ability.extra.active_charges <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b",
    },
}

SMODS.Consumable {
    key = "flat",
    set = "tonality",
    config = { extra = { uses = 3, active_charges = 0, mult = 6 } },
    pos = { x = 1, y = 1 },
    atlas = "AbandoniaTonality",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses, card.ability.extra.active_charges, card.ability.extra.mult } }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0
    end,

    keep_on_use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        return (card.ability.extra.uses > 0) or (card.ability.extra.active_charges > 0)
    end,

    use = function(self, card, area, copier)
        card.ability.extra.active_charges = card.ability.extra.active_charges + 1

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        if context.before and card.ability.extra.active_charges > 0 then
            local triggered = false

            for _, scored in ipairs(context.scoring_hand) do
                if card.ability.extra.active_charges <= 0 then break end

                if ABN.is_even(scored) then
                    card.ability.extra.active_charges = card.ability.extra.active_charges - 1
                    triggered = true

                    SMODS.change_base(scored, 'abn_Vortex')
                    scored.ability.perma_mult = (scored.ability.perma_mult or 0) + card.ability.extra.mult

                    scored:juice_up(0.3, 0.5)
                    SMODS.calculate_effect({
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT,
                    }, scored)
                end
            end

            if triggered and card.ability.extra.uses <= 0 and card.ability.extra.active_charges <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b",
    },
}

SMODS.Consumable {
    key = "sharp",
    set = "tonality",
    config = { extra = { uses = 3, active_charges = 0, chips = 10 } },
    pos = { x = 0, y = 1 },
    atlas = "AbandoniaTonality",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses, card.ability.extra.active_charges, card.ability.extra.chips } }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0
    end,

    keep_on_use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        return (card.ability.extra.uses > 0) or (card.ability.extra.active_charges > 0)
    end,

    use = function(self, card, area, copier)
        card.ability.extra.active_charges = card.ability.extra.active_charges + 1

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        if context.before and card.ability.extra.active_charges > 0 then
            local triggered = false

            for _, scored in ipairs(context.scoring_hand) do
                if card.ability.extra.active_charges <= 0 then break end

                if ABN.is_odd(scored) then
                    card.ability.extra.active_charges = card.ability.extra.active_charges - 1
                    triggered = true

                    SMODS.change_base(scored, 'abn_suitless')
                    scored.ability.perma_bonus = (scored.ability.perma_bonus or 0) + card.ability.extra.chips

                    scored:juice_up(0.3, 0.5)
                    SMODS.calculate_effect({
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS,
                    }, scored)
                end
            end

            if triggered and card.ability.extra.uses <= 0 and card.ability.extra.active_charges <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b",
    },
}

SMODS.Consumable {
    key = "quarter",
    set = "tonality",
    config = { extra = { uses = 3, active_charges = 0, amp = 2, modulate = 2 } },
    pos = { x = 7, y = 0 },
    atlas = "AbandoniaTonality",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.uses,
            card.ability.extra.active_charges,
            card.ability.extra.amp,
            card.ability.extra.modulate,
        } }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0
    end,

    keep_on_use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        return (card.ability.extra.uses > 0) or (card.ability.extra.active_charges > 0)
    end,

    use = function(self, card, area, copier)
        card.ability.extra.active_charges = card.ability.extra.active_charges + 1

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if card.ability.extra.active_charges > 0 then
                local other = context.other_card
                local id = other:get_id()

                local is_modded_rank = not SMODS.has_no_rank(other)
                    and not ABN.is_number(other)
                    and id ~= 11 and id ~= 12 and id ~= 13 and id ~= 14

                if SMODS.has_no_suit(other) and is_modded_rank then
                    card.ability.extra.active_charges = card.ability.extra.active_charges - 1

                    if card.ability.extra.uses <= 0 and card.ability.extra.active_charges <= 0 then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:start_dissolve()
                                return true
                            end
                        }))
                    end

                    return {
                        amp = card.ability.extra.amp,
                        modulate = card.ability.extra.modulate,
                        card = card
                    }
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b",
    },
}

SMODS.Consumable {
    key = "alto",
    set = "tonality",
    config = { extra = { uses = 3, active_charges = 0, asc = 0.25 } },
    pos = { x = 5, y = 1 },
    atlas = "AbandoniaTonality",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses, card.ability.extra.active_charges, card.ability.extra.asc } }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0
    end,

    keep_on_use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        return (card.ability.extra.uses > 0) or (card.ability.extra.active_charges > 0)
    end,

    use = function(self, card, area, copier)
        card.ability.extra.active_charges = card.ability.extra.active_charges + 1

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if card.ability.extra.active_charges > 0 then
                local other = context.other_card

                if SMODS.has_no_suit(other)
                    and not SMODS.has_no_rank(other)
                    and other:get_id() == 14 then

                    card.ability.extra.active_charges = card.ability.extra.active_charges - 1

                    local suitless = 0
                    for _, c in ipairs(context.scoring_hand) do
                        if SMODS.has_no_suit(c) then suitless = suitless + 1 end
                    end

                    if card.ability.extra.uses <= 0 and card.ability.extra.active_charges <= 0 then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:start_dissolve()
                                return true
                            end
                        }))
                    end

                    return {
                        asc = card.ability.extra.asc * suitless,
                        card = card
                    }
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b",
    },
}

SMODS.Consumable {
    key = "diminuendo",
    set = "tonality",
    config = { extra = { uses = 3, active_charges = 0, asc = 1 } },
    pos = { x = 2, y = 1 },
    atlas = "AbandoniaTonality",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses, card.ability.extra.active_charges, card.ability.extra.asc } }
    end,

    can_use = function(self, card)
        return card.ability.extra.uses > 0
    end,

    keep_on_use = function(self, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        return (card.ability.extra.uses > 0) or (card.ability.extra.active_charges > 0)
    end,

    use = function(self, card, area, copier)
        card.ability.extra.active_charges = card.ability.extra.active_charges + 1

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            if card.ability.extra.active_charges > 0 then
                local other = context.other_card

                if SMODS.has_no_suit(other)
                    and not SMODS.has_no_rank(other)
                    and other:get_id() == 2 then

                    local upgrade = G.GAME.abn_rank_upgrades[other.base.value]
                    local level = upgrade and upgrade.level or 1

                    card.ability.extra.active_charges = card.ability.extra.active_charges - 1

                    if card.ability.extra.uses <= 0 and card.ability.extra.active_charges <= 0 then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:start_dissolve()
                                return true
                            end
                        }))
                    end

                    return {
                        asc = card.ability.extra.asc * level,
                        card = card
                    }
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "B.b.b.b",
    },
}