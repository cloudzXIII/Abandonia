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
        local cfg = card and card.ability.extra or self.config.extra
        return { vars = { cfg.uses, cfg.active_charges } }
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