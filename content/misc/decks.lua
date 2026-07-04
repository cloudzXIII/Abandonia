Abandonia = SMODS.current_mod

SMODS.Back {
    key = 'CrimsonDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 0, y = 0 },

    config = {
        hand_size = 0
    },

    apply = function()
        G.E_MANAGER:add_event(Event({

            func = function()
                -- Halve base chips for all hands
                for k, v in pairs(G.GAME.hands) do
                    v.chips = v.chips / 2
                end

                local known_hands = {}
                for hand, data in pairs(G.GAME.hands) do
                    if data.visible then
                        known_hands[#known_hands + 1] = hand
                    end
                end

                -- If somehow nothing is known yet, do nothing safely
                if #known_hands == 0 then return end

                SMODS.upgrade_poker_hands({
                    hands = known_hands,
                    parameters = { "chips", "mult" },
                    level_up = 0,
                    instant = true,

                    from = card,
                })

                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.8


                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        if context.final_scoring_step then
            return {
                xmult = 2,
                card = card,
            }
        end
    end,
}


SMODS.Back {
    key = 'AzulDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 1, y = 0 },

    config = {
        hand_size = 0
    },

    apply = function()
        G.E_MANAGER:add_event(Event({

            func = function()
                SMODS.change_play_limit(1)
                SMODS.change_discard_limit(1)

                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        if context.final_scoring_step then
            if context.full_hand and #context.full_hand < 6 then
                return {
                    dollars = -3,
                    colour = G.C.MONEY,
                }
            end
        end
    end,
}

SMODS.Back {
    key = 'GoldenDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 2, y = 0 },

    config = {
        hand_size = 0
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local currentCard = context.other_card
            if currentCard then
                return {
                    dollars = 1,
                    colour = G.C.MONEY,
                }
            end
        end

        if G.GAME.dollars <= 0 and G.GAME.blind and G.GAME.blind.chips and G.GAME.blind.chips > 0 and not context.game_over and G.STATE ~= G.STATES.GAME_OVER then
            G.STATE = G.STATES.HAND_PLAYED
            G.STATE_COMPLETE = true
            end_round()
        end
    end,
}

SMODS.Back {
    name = 'Emerald Deck',
    key = 'EmeraldDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 3, y = 0 },

    config = {
        hand_size = 0
    },

    apply = function()
        G.E_MANAGER:add_event(Event({

            func = function()
                --give vouchers
                local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'v_reroll_surplus')
                _card:add_to_deck()
                G.vouchers:emplace(_card)

                local _card2 = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'v_reroll_glut')
                _card2:add_to_deck()
                G.vouchers:emplace(_card2)

                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - 4
                G.consumeables.config.card_limit = 0

                return true
            end
        }))
    end,
}

local old_negative_get_weight = G.P_CENTERS.e_negative.get_weight
--print("Original Negative weight function captured: ", old_negative_get_weight)

G.P_CENTERS.e_negative.get_weight = function(self)
    -- Get the base weight from the original function
    local weight = old_negative_get_weight(self)

    -- Debug: Check initial weight and current deck
    local deck_key = (G.GAME and G.GAME.selected_back) and G.GAME.selected_back.effect.center.key or "None"
    --print("Base weight: " .. tostring(weight) .. " | Current Deck: " .. tostring(deck_key))

    -- Apply multiplier if White Deck is active
    if G.GAME and G.GAME.selected_back and G.GAME.selected_back.effect.center.key == 'b_abn_WhiteDeck' then
        weight = weight * 2
        --print("White Deck detected! Doubled weight: " .. tostring(weight))
    end

    return weight
end

SMODS.Back {
    name = 'White Deck',
    key = 'WhiteDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 4, y = 0 },

    config = {
        hand_size = 0
    },

    apply = function()
        G.E_MANAGER:add_event(Event({

            func = function()
                G.jokers.config.card_limit = G.jokers.config.card_limit - 2

                return true
            end
        }))
    end,
}



SMODS.Back {
    name = 'Catastrophe Deck',
    key = 'CatastropheDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 5, y = 0 },

    config = {
        hand_size = 0
    },

    calculate = function(self, card, context)
        -- Check if a booster pack is currently open and has cards
        if G.shop_booster and G.shop_booster.cards and #G.shop_booster.cards >= 2 then
            for _, booster_card in ipairs(G.shop_booster.cards) do
                if booster_card.config.center.key and string.find(booster_card.config.center.key, "arcana") then
                    booster_card:start_dissolve()

                    local new_card = SMODS.create_card {
                        key = 'p_abn_sigil_normal_1',
                        area = G.shop_booster
                    }
                    G.shop_booster:emplace(new_card)
                    create_shop_card_ui(new_card)
                end
            end
        end
    end
}

SMODS.Back {
    key = 'EvenOddDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 1, y = 2 },

    config = {
        hand_size = 0
    },

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                if not G.playing_cards or #G.playing_cards == 0 then
                    return false
                end

                local rank_mapping = {
                    [11] = 'abn_11',
                    [12] = 'abn_12',
                    [13] = 'abn_13',
                    [14] = 'abn_14'
                }

                for i = 1, #G.playing_cards do
                    local card = G.playing_cards[i]
                    local card_id = card:get_id()

                    if rank_mapping[card_id] then
                        local suit_prefix = string.sub(card.base.suit, 1, 1) .. '_'
                        local target_suffix = rank_mapping[card_id]

                        local target_card_def = G.P_CARDS[suit_prefix .. target_suffix]

                        if target_card_def then
                            card:set_base(target_card_def)
                        end
                    end
                end

                if G.deck then G.deck:sort() end
                return true
            end
        }))
    end,
}

SMODS.Back {
    key = 'SnowDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 4, y = 2 },

    config = {
        hand_size = 0,
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                local diamonds = {}
                for _, v in pairs(G.playing_cards) do
                    if v.base.suit == 'Diamonds' then
                        table.insert(diamonds, v)
                    end
                end

                for _, card in ipairs(diamonds) do
                    local new_card = copy_card(card)

                    new_card:change_suit('abn_Snow')

                    new_card:add_to_deck()
                    G.deck:emplace(new_card)
                    table.insert(G.playing_cards, new_card)
                end

                G.deck.config.card_limit = #G.playing_cards
                return true
            end
        }))
    end
}

SMODS.Back {
    key = 'PenumbraDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 0, y = 1 },

    config = {
        hand_size = 0,
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                local diamonds = {}
                for _, v in pairs(G.playing_cards) do
                    if v.base.suit == 'Diamonds' then
                        table.insert(diamonds, v)
                    end
                end

                for _, card in ipairs(diamonds) do
                    local new_card = copy_card(card)

                    new_card:change_suit('abn_Penumbra')

                    new_card:add_to_deck()
                    G.deck:emplace(new_card)
                    table.insert(G.playing_cards, new_card)
                end

                G.deck.config.card_limit = #G.playing_cards
                return true
            end
        }))
    end
}

SMODS.Back {
    name = 'Dark Nebula Deck',
    key = 'DarkNebulaDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 1, y = 1 },

    config = {
        hand_size = 0
    },

    apply = function()
        G.E_MANAGER:add_event(Event({

            func = function()
                G.GAME.astro_cards_rate = 2

                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        -- Check if a booster pack is currently open and has cards
        if G.shop_booster and G.shop_booster.cards and #G.shop_booster.cards >= 2 then
            for _, booster_card in ipairs(G.shop_booster.cards) do
                if booster_card.config.center.key and string.find(booster_card.config.center.key, "celestial") then
                    booster_card:start_dissolve()

                    local new_card = SMODS.create_card {
                        key = 'p_abn_sigil_normal_1',
                        area = G.shop_booster
                    }
                    G.shop_booster:emplace(new_card)
                    create_shop_card_ui(new_card)
                end
            end
        end
    end
}

SMODS.Back {
    name = 'Poltergiest Deck',
    key = 'PoltergiestDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 2, y = 1 },

    config = {
        hand_size = 0
    },

    calculate = function(self, card, context)
        if context.using_consumeable then
            G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling +
                (G.GAME.starting_params.ante_scaling * 0.02)
        end
    end
}


local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    -- First, check the original game logic
    local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)

    -- If the original check was false and the card isn't "suitless"
    if not ret and not SMODS.has_no_suit(self) then
        -- Check if the Deck's special suit is currently active
        if G.GAME and G.GAME.paint_deck_suit then
            -- If THIS card's base suit is the one chosen by Inverted Qualia...
            if self.base.suit == G.GAME.paint_deck_suit then
                -- ...then it counts as the suit being checked (All Suits)
                return true
            end
        end
    end

    return ret
end

SMODS.Back {
    name = 'Inverted Qualia',
    key = 'InvertedQualia',
    atlas = 'AbandoniaDecks',
    pos = { x = 3, y = 1 },

    -- pick suit and show the text
    trigger_suit_change = function(self, seed_suffix)
        local available_suits = {}
        local seen = {}

        -- Identify which suits actually exist in the deck
        for _, c in ipairs(G.deck.cards) do
            local s = c.base.suit
            if not seen[s] then
                table.insert(available_suits, s)
                seen[s] = true
            end
        end

        if #available_suits > 0 then
            local chosen_suit = pseudorandom_element(available_suits, pseudoseed('paint_deck' .. seed_suffix))
            G.GAME.paint_deck_suit = chosen_suit


            local clean_suit_name = chosen_suit:gsub("^[^_]+_", "")


            clean_suit_name = clean_suit_name:sub(1, 1):upper() .. clean_suit_name:sub(2)

            -- display text
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1', 1.1, 0.6)
                    attention_text({
                        scale = 0.8,
                        text = "New Suit: " .. clean_suit_name,
                        hold = 2,
                        align = 'cm',
                        offset = { x = 0, y = -1 },
                        major = G.play
                    })
                    return true
                end
            }))
            return chosen_suit
        end
    end,

    loc_vars = function(self, info_queue)
        local display_suit = G.GAME.paint_deck_suit or 'Spades'
        local clean_display = display_suit:gsub("^[^_]+_", "")
        clean_display = clean_display:sub(1, 1):upper() .. clean_display:sub(2)

        return { vars = { clean_display } }
    end,

    apply = function(self)
        -- pick suit
        G.E_MANAGER:add_event(Event({
            func = function()
                self:trigger_suit_change('start')
                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        -- boss defeated
        if context.end_of_round and G.GAME.blind.boss
        and not context.repetition and not context.individual then
            self:trigger_suit_change(G.GAME.round_resets.ante)
        end
    end
}


local Card_set_debuff_ref = Card.set_debuff

function Card:set_debuff(should_debuff)
    if self.config.center and self.config.center == G.P_CENTERS.c_base and G.GAME.selected_back.effect.center.key == 'b_abn_OxidizedDeck' then
        self.debuff = false
        return
    end

    Card_set_debuff_ref(self, should_debuff)
end

SMODS.Back {
    name = 'Oxidized Deck',
    key = 'OxidizedDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 4, y = 1 },

    config = {
        hand_size = 0
    },

    calculate = function(self, card, context)
        if context.final_scoring_step then
            for _, played_card in ipairs(G.play.cards) do
                if played_card.config.center ~= G.P_CENTERS.c_base then
                    played_card.permadebuff = true
                end
            end
        end
    end
}

SMODS.Back {
    name = 'Platinum Deck',
    key = 'PlatinumDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 5, y = 1 },

    config = {
        hand_size = 0
    },

    apply = function()
        G.E_MANAGER:add_event(Event({

            func = function()
                --give vouchers
                local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'v_hone')
                _card:add_to_deck()
                G.vouchers:emplace(_card)

                local _card2 = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'v_glow_up')
                _card2:add_to_deck()
                G.vouchers:emplace(_card2)

                G.GAME.edition_rate = 4

                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint then
            for i = 1, #G.jokers.cards do
                local jkr = G.jokers.cards[i]
                if not jkr.edition then
                    if pseudorandom('Platinum') < G.GAME.probabilities.normal / 5 then
                        jkr:start_dissolve()
                    else
                        -- Use status_text to show "Safe!" above the specific joker
                        card_eval_status_text(jkr, 'extra', nil, nil, nil, { message = localize('k_safe_ex') })
                    end
                end
            end
        end
    end
}

SMODS.Back {
    name = 'Convergence Deck',
    key = 'ConvergenceDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 5, y = 3 },

    config = {
        hand_size = 0
    },

    apply = function()
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 2.5
                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        if context.modify_hand then
            local current_chips = G.GAME.hands[context.scoring_name].chips
            local current_mult = G.GAME.hands[context.scoring_name].mult

            hand_chips = mod_chips(current_mult)
            mult = mod_mult(current_chips)

            update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
        end
    end,
}

local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)
    if G.GAME and G.GAME.selected_back and G.GAME.selected_back.effect and G.GAME.selected_back.effect.center and G.GAME.selected_back.effect.center.key == 'b_abn_JugglerDeck' and G.STATE ~= 8 then
        G.GAME.round_resets.hands = G.GAME.current_round.hands_left
    end
end

SMODS.Back {
    name = 'Juggler Deck',
    key = 'JugglerDeck',
    atlas = 'AbandoniaDecks',
    pos = { x = 0, y = 4 },

    config = {
        hands = 6
    },

    calculate = function(self, card, context)
        if context.selling_card and context.card ~= card and context.card.config.center.rarity and context.card.ability.set == 'Joker' then
            local card_rarity = context.card.config.center.rarity
            if card_rarity == 1 then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                ease_hands_played(1)
            elseif card_rarity == 2 then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
                ease_hands_played(2)
            elseif card_rarity == 3 then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 5
                ease_hands_played(5)
            elseif card_rarity == 4 then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 10
                ease_hands_played(10)
            elseif card_rarity ~= 1 and card_rarity ~= 2 and card_rarity ~= 3 and card_rarity ~= 4 then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 3
                ease_hands_played(3)
            end
        end
    end,
}

SMODS.Back {
    key = "ensnared",
    name = "Ensnared Deck",
    config = {
        extra = {
            slots = 0,
            slots_mod = 1,
            debt = 10
        }
    },
    atlas = "AbandoniaDecks",
    pos = { x = 4, y = 4 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.slots,
                self.config.extra.slots_mod,
                self.config.extra.debt
            }
        }
    end,
    apply = function(self, card, context)
        G.GAME.starting_params.consumable_slots = self.config.extra.slots
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - self.config.extra.debt
    end,
    calculate = function(self, card, context)
        if context.beat_boss and context.main_eval then
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + self.config.extra.slots_mod
            self.config.extra.slots = self.config.extra.slots + self.config.extra.slots_mod
        end
    end,
}

SMODS.Back {
    key = 'treaty',
    name = "Treaty Of Colors",
    atlas = 'AbandoniaDecks',
    pos = { x = 5, y = 4 },
    config = {
        hand_size = 0,
    },

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                local original_cards = {}
                for _, v in pairs(G.playing_cards) do
                    table.insert(original_cards, v)
                end

                for _, card in ipairs(original_cards) do
                    local new_card = copy_card(card)


                    if card.base.suit == 'Spades' then
                        new_card:change_suit('abn_Snow')
                    elseif card.base.suit == 'Hearts' then
                        new_card:change_suit('abn_Penumbra')
                    elseif card.base.suit == 'Diamonds' then
                        new_card:change_suit('abn_Tie')
                    elseif card.base.suit == 'Clubs' then
                        new_card:change_suit('abn_Bow')
                    end


                    new_card:add_to_deck()
                    G.deck:emplace(new_card)
                    table.insert(G.playing_cards, new_card)
                end

                G.deck.config.card_limit = #G.playing_cards
                return true
            end
        }))
    end
}

SMODS.Back {
    key = 'photometry',
    name = "Photometry Deck",
    atlas = 'AbandoniaDecks',
    pos = { x = 0, y = 5 },
    config = {
        hand_size = 0,
    },

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                local suit_map = {
                    Spades = 'abn_Snow',
                    Hearts = 'abn_Penumbra',
                    Diamonds = 'abn_Tie',
                    Clubs = 'abn_Bow'
                }

                local original_cards = {}
                for _, v in pairs(G.playing_cards) do
                    table.insert(original_cards, v)
                end

                for _, card in ipairs(original_cards) do
                    local current_suit = card.base.suit
                    if suit_map[current_suit] then
                        card:change_suit(suit_map[current_suit])
                    end
                end

                for _, card in ipairs(original_cards) do
                    if card.base.suit == 'abn_Bow' then
                        local new_card = copy_card(card)

                        new_card:change_suit('abn_suitless')
                        new_card:add_to_deck()
                        G.deck:emplace(new_card)
                        table.insert(G.playing_cards, new_card)
                    end
                end

                G.deck.config.card_limit = #G.playing_cards
                return true
            end
        }))
    end
}

SMODS.Back {
    key = 'synesthic',
    name = "Synesthic Circle",
    atlas = 'AbandoniaDecks',
    pos = { x = 0, y = 6 },
    config = {
        hand_size = 0,
    },

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.change_play_limit(1)
                local suit_map = {
                    Spades = 'abn_Snow',
                    Hearts = 'abn_Penumbra',
                    Diamonds = 'abn_Tie',
                    Clubs = 'abn_Bow'
                }

                local original_cards = {}
                for _, v in pairs(G.playing_cards) do
                    table.insert(original_cards, v)
                end

                for _, card in ipairs(original_cards) do
                    if card.base.value == 'Jack' or card.base.value == 'Queen' or card.base.value == 'King' then
                        card:start_dissolve()
                        for i, gc in ipairs(G.playing_cards) do
                            if gc == card then
                                table.remove(G.playing_cards, i)
                                break
                            end
                        end
                        G.deck:remove_card(card)
                        card:remove()
                    end
                end

                local remaining_cards = {}
                for _, v in pairs(G.playing_cards) do
                    table.insert(remaining_cards, v)
                end

                for _, card in ipairs(remaining_cards) do
                    local current_suit = card.base.suit
                    if suit_map[current_suit] then
                        local new_card = copy_card(card)
                        new_card:change_suit(suit_map[current_suit])
                        new_card:add_to_deck()
                        G.deck:emplace(new_card)
                        table.insert(G.playing_cards, new_card)

                        if current_suit == 'Clubs' then
                            local suitless_card = copy_card(card)
                            suitless_card:change_suit('abn_suitless')
                            suitless_card:add_to_deck()
                            G.deck:emplace(suitless_card)
                            table.insert(G.playing_cards, suitless_card)
                        end
                    end
                end

                G.deck.config.card_limit = #G.playing_cards
                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.blind and G.GAME.blind.boss then
            G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.3
        end
    end,
}

SMODS.Back {
    key = 'epoch',
    name = 'New Epoch',
    atlas = 'AbandoniaDecks',
    pos = { x = 1, y = 6 },

    config = {
        hand_size = 0,
        vouchers = { "v_antimatter", "v_blank", "v_clearance_sale", "v_crystal_ball", "v_directors_cut", "v_glow_up", "v_grabber", "v_hieroglyph", "v_hone", "v_illusion", "v_liquidation", "v_magic_trick", "v_money_tree", "v_nacho_tong", "v_observatory", "v_omen_globe", "v_overstock_norm", "v_overstock_plus", "v_paint_brush", "v_palette", "v_petroglyph", "v_planet_merchant", "v_planet_tycoon", "v_recyclomancy", "v_reroll_glut", "v_reroll_surplus", "v_retcon", "v_seed_money", "v_tarot_merchant", "v_tarot_tycoon", "v_telescope", "v_wasteful", }
    },


    calculate = function(self, card, context)
        if G.GAME.round_resets.blind_choices.Small then
            G.GAME.round_resets.blind_choices.Small = 'bl_big'
        end
    end,
}

SMODS.Back {
    key = 'shackle',
    name = "Shackle Maniac",
    atlas = 'AbandoniaDecks',
    pos = { x = 5, y = 2 },
    config = {
        hand_size = 0,
    },

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    local current_suit = card.base.suit

                    card:set_edition({ abn_chthonian = true }, true, true)

                    if current_suit == 'Hearts' then
                        card:change_suit('abn_Penumbra')
                    elseif current_suit == 'Diamonds' then
                        card:change_suit('abn_Bow')
                    end
                end
                G.deck.config.card_limit = #G.playing_cards
                return true
            end
        }))
    end
}

--[[
SMODS.Back {
    key = 'poneglyph',
    name = "Poneglyph",
    atlas = 'AbandoniaDecks',
    pos = { x = 3, y = 4 },
    config = {
        hand_size = 0,
    },

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                -- 1. Snapshot the initial deck before we push any duplicates into it
                local original_cards = {}
                for _, card in ipairs(G.playing_cards) do
                    table.insert(original_cards, card)
                end

                -- 2. Loop through and instantly clone/modify every card in a single frame
                for _, original_card in ipairs(original_cards) do
                    local copy = copy_card(original_card)
                    local current_suit = copy.base.suit

                    -- Assigning completely different suits and enhancements all at once
                    if current_suit == 'Clubs' then
                        copy:change_suit('abn_suitless')
                    elseif current_suit == 'Hearts' then
                        copy:change_suit('Diamonds')                             -- Changes suit
                        copy:set_ability(G.P_CENTERS.m_abn_petroleum, nil, true)  -- Appends Petroleum
                    elseif current_suit == 'Diamonds' then
                        copy:change_suit('Spades')                               -- Changes suit
                        copy:set_ability(G.P_CENTERS.m_abn_polkadot, nil, true)   -- Appends Polkadot
                    elseif current_suit == 'Spades' then
                        copy:change_suit('Hearts')                               -- Changes suit
                        copy:set_ability(G.P_CENTERS.m_stone, nil, true)          -- Appends Stone
                    end

                    -- Add the card data and physical reference directly into the engine
                    copy:add_to_deck()
                    G.deck:emplace(copy)
                    table.insert(G.playing_cards, copy)
                end

                -- 3. Instantly recalculate the card limit
                G.deck.config.card_limit = #G.playing_cards

                -- Briefly play a single screen-wide visual deck update instead of 52 tiny ones
                G.deck:shuffle()
                return true
            end
        }))
    end
}
--]]

SMODS.Back {
    key = "cyber",
    atlas = 'AbandoniaDecks',
    pos = { x = 3, y = 2 },
    config = { solid_state_rate = 2, consumables = { 'c_abn_database' } },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.solid_state_rate, self.config.consumables[1] } }
    end,
    apply = function(self, back)
        G.GAME.solid_state_rate = self.config.solid_state_rate
    end,
}
