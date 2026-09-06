-- just putting all my jokers in one file for convenience's sake
SMODS.Joker {
    key = 'crease_joker',
    rarity = 2,
    abn_coder = "ImaginaryNeon",
    atlas = 'ABNJokerSheet24',
    pos = { x = 6, y = 5 },
    --atlas = 'jonklers',
    --pos = { x = 1, y = 0 },
    cost = 6,
    discovered = false,
    blueprint_compat = false,
    demicoloncompat = false,
    config = { extra = { x_size = 2, discard_limit = 1, is_real = false }, immutable = { discard_limit_store = 0, size_store = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_size, card.ability.extra.discard_limit } }
    end,
    add_to_deck = function(self, card, from_debuff)
        -- store values for safekeeping
        card.ability.immutable.size_store = G.hand.config.card_limit
        if G.GAME.starting_params.discard_limit <= 0 then
            card.ability.immutable.discard_limit_store = 5 - card.ability.extra.discard_limit
        else
            card.ability.immutable.discard_limit_store = G.GAME.starting_params.discard_limit -
                card.ability.extra.discard_limit
        end
        -- change values
        G.hand:change_size(((card.ability.extra.x_size) - 1) * card.ability.immutable.size_store) -- hand size increase
        SMODS.change_discard_limit(-1 * card.ability.immutable.discard_limit_store)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-((card.ability.extra.x_size) - 1) * card.ability.immutable.size_store)
        --if card.ability.extra.is_real == true then
        SMODS.change_discard_limit(card.ability.immutable.discard_limit_store)
        --end
    end,
    --[[calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and not card.getting_sliced then
            if G.GAME.starting_params.discard_limit <= 0 then
                card.ability.immutable.discard_limit_store = 5 - card.ability.extra.discard_limit
            else
                card.ability.immutable.discard_limit_store = G.GAME.starting_params.discard_limit -
                    card.ability.extra.discard_limit
            end
            card.ability.extra.is_real = true
            SMODS.change_discard_limit(-card.ability.immutable.discard_limit_store)
        end
        if context.end_of_round and context.game_over == false and card.ability.extra.is_real == true and context.main_eval and not context.blueprint then
            SMODS.change_discard_limit(card.ability.immutable.discard_limit_store)
            card.ability.extra.is_real = false
        end
    end,--]]
    abn_artist_credits = {
        artist = "CebeeDrawz",
    },
}

SMODS.Joker {
    key = 'double_dip',
    rarity = 2,
    abn_coder = "ImaginaryNeon",
    atlas = 'ABNJokerSheet22',
    pos = { x = 8, y = 2 },
    --atlas = 'jonklers', -- test sprites from my own mod
    --pos = { x = 1, y = 0 }, -- Portal Radio
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    demicoloncompat = true,
    config = { extra = { is_real = false } },
    loc_vars = function(self, info_queue, card)
        return { vars = { "the" } }
    end,
    calculate = function(self, card, context) --attempt to work around weird bugs with prior method that no longer are relevant (probably)
        if context.joker_main or context.forcetrigger then
            local text = context.scoring_name
            if next(SMODS.find_card("j_neonmod_flowery")) then -- Literally just for compatibility with my own mod because I can
                return {
                    chips = math.max(G.GAME.hands[text].chips, 999),
                    mult = math.max(G.GAME.hands[text].mult, 99)
                }
            else
                return {
                    chips = G.GAME.hands[text].chips,
                    mult = G.GAME.hands[text].mult
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "Tisisrealnow",
    },
}

-- Messing with add_to_deck and remove_from_deck stuff is very easy and not at all prone to mishap with multiple copies
SMODS.Joker {
    key = 'big_raff',
    rarity = 3,
    abn_coder = "ImaginaryNeon",
    atlas = 'ABNJokerSheet24',
    pos = { x = 9, y = 5 },
    --atlas = 'jonklers', -- test sprites from my own mod
    --pos = { x = 1, y = 0 }, -- Portal Radio
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    demicoloncompat = true,
    config = { immutable = { common_rate = 0, uncommon_rate = 0, joker_rate = 0 } },
    add_to_deck = function(self, card, from_debuff)
        card.ability.immutable.joker_rate = (G.GAME.joker_rate or 1)
        card.ability.immutable.common_rate = (G.GAME.common_mod or 0.7)
        card.ability.immutable.uncommon_rate = (G.GAME.uncommon_mod or 0.25)
        G.GAME.common_mod = 0
        G.GAME.uncommon_mod = 0
        G.GAME.joker_rate = G.GAME.joker_rate * (2 * G.GAME.rare_mod)
    end,
    remove_from_deck = function(self, card, from_debuff) -- probably janky as hell with multiple copies but fuck you
        G.GAME.common_mod = (card.ability.immutable.common_rate or 0.7)
        G.GAME.uncommon_mod = (card.ability.immutable.common_rate or 0.25)
        G.GAME.joker_rate = (card.ability.immutable.joker_rate or 10)
    end,
    calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card {
                        set = 'Joker',
                        rarity = 'Rare',
                        key_append = 'abn_mega_raff'
                    }
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
    end,
    abn_artist_credits = {
        artist = "CebeeDrawz",
    },
}

SMODS.Joker {
    key = 'wiimotionplus',
    rarity = 2,
    abn_coder = "ImaginaryNeon",
    atlas = 'ABNJokerSheet21',
    pos = { x = 8, y = 2 },
    --atlas = 'jonklers', -- test sprites from my own mod
    --pos = { x = 3, y = 0 }, -- Wii Remote (a MUCH more convoluted rendition than this one, though)
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    demicoloncompat = true,
    config = { extra = { mult = 0, mult_gain = 8 }, immutable = { slots = {} } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, (table.concat(card.ability.immutable.slots, ', ') or "None") } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    local found = false
                    for k, v in pairs(card.ability.immutable.slots) do
                        if v == i then
                            found = true
                        end
                    end
                    if found == false then
                        table.insert(card.ability.immutable.slots, i)
                        SMODS.scale_card(card, {
                            ref_table = card.ability.extra,
                            ref_value = 'mult',
                            scalar_value = 'mult_gain',
                            message_colour = G.C.ATTENTION
                        })
                    end
                end
            end
        end
        if context.joker_main or context.forcetrigger then
            if not (card.ability.extra.mult == 0) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "Pitissaria 2",
    }
}

SMODS.Joker {
    key = 'chips_to_mult', -- Mult Matthew
    rarity = 3,
    abn_coder = "ImaginaryNeon",
    atlas = 'ABNJokerSheet23',
    pos = { x = 0, y = 0 },
    --atlas = 'jonklers', -- test sprites from my own mod
    --pos = { x = 2, y = 3 }, -- Stupendi-Joker
    cost = 8,
    discovered = false,
    blueprint_compat = false,
    demicoloncompat = false,
    config = { extra = { mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.post_trigger and not context.blueprint then
            local other_ret = context.other_ret.jokers or {}
            --print("other_ret good")
            if other_ret.chips --[[and not (context.other_card.config.center.key == card.config.center.key)]] then
                --print("other_ret.jokers.chips good")
                return {
                    mult = tonumber(other_ret.chips),
                    message_card = card,
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "GM36",
    }
}

SMODS.Joker {
    key = 'mult_to_chips', -- Bonus Bradly
    rarity = 2,
    abn_coder = "ImaginaryNeon",
    atlas = 'ABNJokerSheet23',
    pos = { x = 1, y = 0 },
    --atlas = 'jonklers', -- test sprites from my own mod
    --pos = { x = 5, y = 4 }, -- Cheat Code
    cost = 6,
    discovered = false,
    blueprint_compat = false,
    demicoloncompat = false,
    config = { extra = { chips = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.post_trigger and not context.blueprint then
            local other_ret = context.other_ret.jokers or {}
            if other_ret.mult --[[and not (context.other_card.config.center.key == card.config.center.key)]] then
                return {
                    chips = tonumber(other_ret.mult),
                    message_card = card,
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "GM36",
    }
}
