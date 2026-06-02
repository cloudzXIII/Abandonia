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

    apply = function()
        G.E_MANAGER:add_event(Event({

            func = function()
                for _, card in pairs(G.playing_cards) do
                    if card:get_id() > 10 then
                        card:start_dissolve()
                    end
                end

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

            -- display text
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1', 1.1, 0.6)
                    attention_text({
                        scale = 0.8,
                        text = "New Suit: " .. chosen_suit,
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
        return { vars = { G.GAME.paint_deck_suit or 'Spades' } }
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

            update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
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
