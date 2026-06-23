loc_colour()
G.C.ASTRO = HEX("d4c6ff")
G.C.ASTRO_SECONDARY = HEX("5204ff")
G.ARGS.LOC_COLOURS["abn_Astro"] = G.C.ASTRO

SMODS.ConsumableType {
    key = "astro_cards",
    collection_rows = { 6, 6 },
    shop_rate = 0,
    primary_colour = G.C.ASTRO,
    secondary_colour = G.C.ASTRO_SECONDARY,
}

SMODS.Consumable {
    key = "aquar",
    set = "astro_cards",
    config = { extra = { used = 0, hand_snapshot = {}, odds = 6 } },
    pos = { x = 0, y = 0 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            },

        }
    end,

    add_to_deck = function(self, card)
        if card.ability.extra.used == 0 then
            card.ability.extra.used = 1
            card.ability.extra.hand_snapshot = {}
            for k, v in pairs(G.GAME.hands) do
                card.ability.extra.hand_snapshot[k] = v.level or 0
            end
        end
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        card.ability.extra.used = 2
        card:start_dissolve()

        card.ability.extra.hand_snapshot = {}
        for k, v in pairs(G.GAME.hands) do
            card.ability.extra.hand_snapshot[k] = v.level or 0
        end

        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_aquar')
        _card.ability.extra.used = 2
        _card.ability.extra.hand_snapshot = {}
        for k, v in pairs(G.GAME.hands) do
            _card.ability.extra.hand_snapshot[k] = v.level or 0
        end

        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if card.ability.extra.used == 2
            and context.using_consumeable
            and context.consumeable.config
            and context.consumeable.config.center
            and context.consumeable.config.center.set == 'Planet' then
            local snapshot = card.ability.extra.hand_snapshot
            for k, v in pairs(G.GAME.hands) do
                local old_level = snapshot[k]
                if old_level and v.level ~= old_level then
                    -- Check Odds
                    if SMODS.pseudorandom_probability(card, 'aquar', 1, card.ability.extra.odds) then
                        -- SUCCESS CASE ("Level Up!")
                        update_hand_text(
                            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                            {
                                handname = localize(k, 'poker_hands'),
                                chips = v.chips,
                                mult = v.mult,
                                level = v.level
                            }
                        )

                        level_up_hand(card, k)
                        card:start_dissolve()

                        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_aquar')
                        _card:add_to_deck()
                        G.play:emplace(_card)

                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.1,
                            func = function()
                                attention_text({
                                    text = localize('k_level_up_ex'),
                                    scale = 1.3,
                                    hold = 1.4,
                                    major = _card,
                                    backdrop_colour = G.C.ATTENTION,
                                    align = 'tm',
                                    offset = { x = 0, y = -0.2 },
                                    silent = true
                                })
                                _card:juice_up(0.3, 0.5)

                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.6,
                                    func = function()
                                        _card:start_dissolve()
                                        return true
                                    end
                                }))
                                return true
                            end
                        }))

                        update_hand_text(
                            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
                            { mult = 0, chips = 0, handname = '', level = '' }
                        )
                        break
                    else
                        -- FAILURE CASE ("Nope!")
                        card:start_dissolve()

                        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_aquar')
                        _card:add_to_deck()
                        G.play:emplace(_card)

                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.1,
                            func = function()
                                attention_text({
                                    text = localize('k_nope_ex'),
                                    scale = 1.3,
                                    hold = 1.4,
                                    major = _card,
                                    backdrop_colour = G.C.SECONDARY_SET.Tarot,
                                    align = 'tm',
                                    offset = { x = 0, y = -0.2 },
                                    silent = true
                                })
                                play_sound('tarot2', 0.76, 0.4)
                                _card:juice_up(0.3, 0.5)

                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.6,
                                    func = function()
                                        _card:start_dissolve()
                                        return true
                                    end
                                }))
                                return true
                            end
                        }))
                        break
                    end
                end
            end
            card.ability.extra.used = 2
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "aries",
    set = "astro_cards",
    config = { extra = { odds = 4, used = 0 } },
    pos = { x = 1, y = 0 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            },

        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, "aquar", 1, card.ability.extra.odds) then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
            ease_discard(1)
            local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_aries')
            _card:add_to_deck()
            _card.ability.extra.used = 1
            G.vouchers:emplace(_card)
        else
            -- Failure case: show Nope!
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    calculate = function(self, card, context)
        if context.end_of_round and card.area == G.vouchers and card.ability.extra.used == 1 then
            card.ability.extra.used = 0
            card:start_dissolve()
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
            ease_discard(-1)
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "cancer",
    set = "astro_cards",
    config = { extra = { odds = 3 } },
    pos = { x = 2, y = 0 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            },

        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'cancer', 1, card.ability.extra.odds) then
            ease_dollars(G.GAME.dollars * 2)
        else
            -- Failure case: show Nope!
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "capri",
    set = "astro_cards",
    config = { extra = { odds = 8, chips = 50 } },
    pos = { x = 3, y = 0 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { numerator, denominator, card.ability.extra.odds, card.ability.extra.chips } }
    end,

    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'caprisun', 1, card.ability.extra.odds) then
            for i = 1, #G.jokers.cards do
                local j = G.jokers.cards[i]
                -- Gain chips
                j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.chips

                -- Feedback
                card_eval_status_text(j, 'extra', nil, nil, nil, {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.BLUE
                })
            end
        else
            -- Failure case: show Nope!
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "gemini",
    set = "astro_cards",
    config = { extra = { odds = 10, cards = 1 } },
    pos = { x = 4, y = 0 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { numerator, denominator, card.ability.extra.odds, card.ability.extra.chips } }
    end,

    can_use = function(self, card)
        if G.jokers and G.jokers.highlighted and card.ability and card.ability.extra then
            local n = #G.jokers.highlighted
            return n > 0 and n <= card.ability.extra.cards and #G.jokers.cards < G.jokers.config.card_limit
        end
        return false
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'gemini', 1, card.ability.extra.odds) then
            if G.jokers and G.jokers.highlighted then
                for _, j in ipairs(G.jokers.highlighted) do
                    --create a copy
                    local copy = copy_card(j)
                    copy:add_to_deck()
                    G.jokers:emplace(copy)
                    copy:juice_up(0.3, 0.5)
                end
            end
        else
            -- Failure case: show Nope!
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "leo",
    set = "astro_cards",
    config = { extra = { odds = 6 } },
    pos = { x = 5, y = 0 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS.tag_double
        return {
            vars = {
                SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            },

        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'leo', 1, card.ability.extra.odds) then
            add_tag(Tag('tag_double'))
        else
            -- Failure case: show Nope!
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "libra",
    set = "astro_cards",
    config = { extra = { odds = 6, chips = 10, mult = 2 } },
    pos = { x = 0, y = 1 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { numerator, denominator, card.ability.extra.chips, card.ability.extra.mult } }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'libral', 1, card.ability.extra.odds) then
            for _, v in ipairs(G.playing_cards) do
                v.ability.perma_bonus = (v.ability.perma_bonus or 0) + card.ability.extra.chips
                v.ability.perma_mult = (v.ability.perma_mult or 0) + card.ability.extra.mult
            end
        else
            -- Failure case: show Nope!
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "pisces",
    set = "astro_cards",
    config = { extra = { odds = 4, used = 0 } },
    pos = { x = 1, y = 1 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            },
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'pisces', 1, card.ability.extra.odds) then
            -- Double the hands for the current round setup
            local hands_to_add = G.GAME.round_resets.hands
            G.GAME.round_resets.hands = G.GAME.round_resets.hands * 2
            ease_hands_played(hands_to_add)
            
            local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_pisces')
            _card:add_to_deck()
            _card.ability.extra.used = 1
            G.vouchers:emplace(_card)
        else
            -- Failure case: show Nope!
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    calculate = function(self, card, context)
        if context.end_of_round and card.area == G.vouchers and card.ability.extra.used == 1 then
            card.ability.extra.used = 0
            card:start_dissolve()
            
            -- Revert the doubling by dividing by 2 and removing the excess from the current UI
            local half_hands = G.GAME.round_resets.hands / 2
            G.GAME.round_resets.hands = half_hands
            ease_hands_played(-half_hands)
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "sagitt",
    set = "astro_cards",
    config = { extra = { odds = 10 } },
    pos = { x = 2, y = 1 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { numerator, denominator, card.ability.extra.chips, card.ability.extra.mult } }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'sagitt', 1, card.ability.extra.odds) then
            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        else
            -- Failure case: show Nope!
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "scorpio",
    set = "astro_cards",
    config = { extra = { odds = 6, chips = 10, mult = 2 } },
    pos = { x = 3, y = 1 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { numerator, denominator, card.ability.extra.chips, card.ability.extra.mult } }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'scorpio', 1, card.ability.extra.odds) then
            for _, v in ipairs(G.consumeables.cards) do
                if v.scopied ~= true then
                    local copy = copy_card(v)
                    copy:add_to_deck()
                    G.consumeables:emplace(copy)
                    copy:set_edition({ negative = true }, true)
                    copy.scopied = true
                    copy:juice_up(0.3, 0.5)
                end
            end
        else
            -- Failure case: show Nope!
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "taurus",
    set = "astro_cards",
    config = { extra = { odds = 10, cards = 2 } },
    pos = { x = 4, y = 1 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { numerator, denominator, card.ability.extra.cards } }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        -- Probability check (affected by Oops! All 6s)
        if SMODS.pseudorandom_probability(card, 'taurus', 1, card.ability.extra.odds) then
            -- Success Case: Create and redeem the number of vouchers specified in config
            for i = 1, card.ability.extra.cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    -- Stagger the vouchers: First one starts at 0.4s, second at 1.4s
                    delay = (i == 1) and 0.4 or 1.0,
                    func = function()
                        local _pool, _ = get_current_pool('Voucher', nil, nil, nil)
                        local _voucher_key = nil
                        local _pool_key = 'taurus_vouch'
                        local iv = 1

                        -- Pick a random voucher from the current pool
                        _voucher_key = pseudorandom_element(_pool, pseudoseed(_pool_key))

                        -- Loop until we find a voucher that isn't 'UNAVAILABLE'
                        -- and doesn't require a Tier 1 the player doesn't have
                        while _voucher_key == 'UNAVAILABLE' or (G.P_CENTERS[_voucher_key] and G.P_CENTERS[_voucher_key].requires) do
                            iv = iv + 1
                            _voucher_key = pseudorandom_element(_pool, pseudoseed(_pool_key .. '_resample' .. iv))
                        end

                        -- Create the card object
                        local voucher_card = create_card('Voucher', G.play, nil, nil, nil, nil, _voucher_key, 'tau')

                        -- Offset the second card slightly so they don't overlap perfectly
                        if i > 1 then
                            voucher_card.T.x = voucher_card.T.x + 2
                        end

                        -- Trigger visual effects and the redemption logic
                        voucher_card:juice_up(0.3, 0.5)
                        voucher_card:redeem()
                        G.GAME.dollars = G.GAME.dollars + 10

                        -- Cleanup: Remove the card object after the animation finishes
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                voucher_card:remove()
                                return true
                            end
                        }))
                        return true
                    end
                }))
            end
        else
            -- Failure Case: Display "Nope!"
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Consumable {
    key = "virgo",
    set = "astro_cards",
    config = { extra = { odds = 10, cards = 2 } },
    pos = { x = 5, y = 1 },
    atlas = "AbandoniaAstro",
    cost = 4,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_black_hole
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { numerator, denominator, card.ability.extra.cards } }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        -- Probability check (affected by Oops! All 6s)
        if SMODS.pseudorandom_probability(card, 'virgo', 1, card.ability.extra.odds) then
            SMODS.add_card { set = "Tarot", key = "c_black_hole", edition = "e_negative" }
        else
            -- Failure Case: Display "Nope!"
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm',
                        offset = { x = 0, y = -0.2 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    abn_artist_credits = {
        artist = "Maw",
    },
}

SMODS.Voucher({
    key = "chaos",
    atlas = "AbandoniaVouchers",
    pos = { x = 0, y = 2 },
    cost = 10,

    redeem = function(self, card)
        --print("Voucher Redeemed: Chaos (Global Override Active)")

        SMODS.Booster:take_ownership_by_kind('Arcana', {
            create_card = function(_, card, i)
                -- Define variables at the top of the function scope
                local _card = nil
                local choice = nil

                -- Check if the voucher is active
                if G.GAME.used_vouchers.v_abn_chaos then
                    local tarot_pool = {
                        "c_abn_aquar", "c_abn_aries", "c_abn_cancer", "c_abn_capri",
                        "c_abn_gemini", "c_abn_leo", "c_abn_libra", "c_abn_pisces",
                        "c_abn_sagitt", "c_abn_scorpio", "c_abn_taurus", "c_abn_virgo",
                        "c_abn_eruption", "c_abn_tsunami", "c_abn_cyclone", "c_abn_flood",
                        "c_abn_tremor", "c_abn_avalanche", "c_abn_blizzard", "c_abn_plague",
                        "c_abn_drought", "c_abn_heatwave", "c_abn_humans", "c_abn_heatdeath",
                        "c_abn_rapture", "c_abn_furtive", "c_abn_intrusion", "c_abn_aparition",
                        "c_abn_bael", "c_abn_botis", "c_abn_vinea", "c_abn_morax", "c_abn_bune",
                        "c_abn_furfur", "c_abn_bifrons", "c_abn_crocell", "c_abn_belial",
                        "c_abn_astaroth", "c_abn_asmodeus", "c_abn_camio", "c_abn_digitization",
						"c_abn_paste", "c_abn_power", "c_abn_hotspot", "c_abn_bookmark", "c_abn_translate",
						"c_abn_incognito", "c_abn_upload", "c_abn_brightness", "c_abn_dark_web", "c_abn_database",
						"c_abn_zoom", "c_abn_recycle", "c_abn_a", "c_abn_b", "c_abn_c", "c_abn_d", "c_abn_e", "c_abn_f",
						"c_abn_g", "c_abn_h", "c_abn_i", "c_abn_j", "c_abn_k", "c_abn_l", "c_abn_m", "c_abn_n", "c_abn_o",
						"c_abn_p", "c_abn_q", "c_abn_r", "c_abn_s", "c_abn_t", "c_abn_u", "c_abn_v", "c_abn_w", "c_abn_x",
						"c_abn_y", "c_abn_z", "c_abn_thorn", "c_abn_yogh", "c_abn_eth",
                    }

                    -- This gives a 20% chance for ANY slot to be replaced
                    if pseudorandom('chaos_chance' .. G.GAME.round_resets.ante .. i) > 0.8 then
                        choice = tarot_pool[math.floor(pseudorandom('supply_tarot' .. i) * #tarot_pool) + 1]
                        --print("Slot " .. i .. ": Chaos hit! Selected " .. tostring(choice))
                    end

                    _card = {
                        set = "Tarot",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key = choice, -- If choice is nil, Balatro defaults to a random Tarot
                        key_append = "ar1"
                    }

                    -- If we found a custom card, return it immediately
                    if choice then return _card end
                end

                -- Fallback logic for Omen Globe or Standard Arcana
                if G.GAME.used_vouchers.v_omen_globe and pseudorandom('omen_globe' .. i) > 0.8 then
                    --print("Slot " .. i .. ": Omen Globe triggered")
                    _card = {
                        set = "Spectral",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "ar2"
                    }
                else
                    _card = {
                        set = "Tarot",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "ar1"
                    }
                end

                return _card
            end
        }, true)
    end,
})

SMODS.Voucher({
    key = "invasion",
    atlas = "AbandoniaVouchers",
    pos = {
        x = 1,
        y = 2,
    },
    cost = 10,
    requires = { "v_abn_chaos" },

    redeem = function(self, card)
        G.GAME.sigils_rate = 1
        G.GAME.astro_cards_rate = 1
        G.GAME.calamity_cards_rate = 1
        G.GAME.nightshift_cards_rate = 1
		G.GAME.solid_state_rate = 1
    end,
})
