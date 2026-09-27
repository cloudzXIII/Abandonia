SMODS.ConsumableType {
  key = "crepuscular",
  primary_colour = HEX("547799"),
  secondary_colour = HEX("547799"),
  text_colour = HEX("0f1725"),
  collection_rows = { 6, 6 },
  shop_rate = 4,
}

SMODS.UndiscoveredSprite {
  key = 'crepuscular',
  atlas = 'abn_AbandoniaUndiscovered',
  pos = { x = 3, y = 3 },
}

SMODS.Consumable {
  key = "sailboat",
  set = 'crepuscular',
  cost = 4,
  atlas = "AbandoniaCrepuscular",
  pos = { x = 7, y = 0 },
  config = { max_highlighted = 2, mod_conv = 'm_abn_ocean' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
  abn_artist_credits = {
    artist = "SmoliconBoi",
  },
}

SMODS.Consumable {
  key = "stone_of_destiny",
  set = 'crepuscular',
  cost = 4,
  atlas = "AbandoniaCrepuscular",
  pos = { x = 2, y = 1 },
  config = { max_highlighted = 2, mod_conv = 'm_abn_kinship' },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
    return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
  end,
  abn_artist_credits = {
    artist = "SmoliconBoi",
  },
}

SMODS.Consumable {
    key = "life",
    set = 'crepuscular',
    cost = 4,
    atlas = "AbandoniaCrepuscular",
    pos = { x = 5, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_abn_flypaper' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        local target = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local new_card = copy_card(target, nil, nil, G.playing_card)
                new_card:set_ability(G.P_CENTERS[card.ability.mod_conv])
                new_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, new_card)
                G.hand:emplace(new_card)
                new_card:start_materialize()
                
                playing_card_joker_effects({new_card})
                return true
            end
        }))
    end,
    abn_artist_credits = {
        artist = "SmoliconBoi",
    },
}

SMODS.Consumable {
    key = "vassal",
    set = 'crepuscular',
    cost = 4,
    atlas = "AbandoniaCrepuscular",
    pos = { x = 3, y = 0 }, 
    config = { max_highlighted = 2, mod_conv = 'm_abn_discontinued' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for i = 1, #G.hand.highlighted do
                    local highlighted_card = G.hand.highlighted[i]
                    highlighted_card:set_ability(G.P_CENTERS[card.ability.mod_conv])
                    highlighted_card:juice_up()
                end
                return true
            end
        }))
    end,
    abn_artist_credits = {
        artist = "Vega",
    },
}

SMODS.Consumable {
    key = "serf",
    set = 'crepuscular',
    cost = 4,
    atlas = "AbandoniaCrepuscular",
    pos = { x = 4, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_abn_plank', odds = 4, cards = 2, },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { 
            vars = { 
                card.ability.max_highlighted, 
                localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv },
                G.GAME.probabilities.normal,
                card.ability.odds,
				card.ability.cards
            } 
        }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for i = 1, #G.hand.highlighted do
                    local highlighted_card = G.hand.highlighted[i]
                    highlighted_card:set_ability(G.P_CENTERS[card.ability.mod_conv])
                    highlighted_card:juice_up()
                end
                return true
            end
        }))

        if pseudorandom('serf') < G.GAME.probabilities.normal / card.ability.odds then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local cards_to_create = math.min(card.ability.cards, G.consumeables.config.card_limit - #G.consumeables.cards)
                    for i = 1, cards_to_create do
                        local new_card = create_card('crepuscular', G.consumeables, nil, nil, nil, nil, nil, 'serf')
                        new_card:add_to_deck()
                        G.consumeables:emplace(new_card)
                    end
                    return true
                end
            }))
        end
    end,
    abn_artist_credits = {
        artist = "Vega",
    },
}

SMODS.Consumable {
    key = "mountebank",
    set = 'crepuscular',
    cost = 4,
    atlas = "AbandoniaCrepuscular",
    pos = { x = 5, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_abn_papermache' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for i = 1, #G.hand.highlighted do
                    local highlighted_card = G.hand.highlighted[i]
                    highlighted_card:set_ability(G.P_CENTERS[card.ability.mod_conv])
                    highlighted_card:juice_up()
                end
                return true
            end
        }))
    end,
    abn_artist_credits = {
        artist = "Vega",
    },
}

SMODS.Consumable {
    key = "trollop",
    set = 'crepuscular',
    cost = 4,
    atlas = "AbandoniaCrepuscular",
    pos = { x = 6, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_abn_honey' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for i = 1, #G.hand.highlighted do
                    local highlighted_card = G.hand.highlighted[i]
                    highlighted_card:set_ability(G.P_CENTERS[card.ability.mod_conv])
                    highlighted_card:juice_up()
                end
                return true
            end
        }))
    end,
    abn_artist_credits = {
        artist = "Vega",
    },
}

SMODS.Consumable {
    key = "below",
    set = 'crepuscular',
    cost = 4,
    atlas = "AbandoniaCrepuscular",
    pos = { x = 0, y = 2 },
    config = { max_highlighted = 1, mod_conv = 'm_abn_bramble' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for i = 1, #G.hand.highlighted do
                    local highlighted_card = G.hand.highlighted[i]
                    highlighted_card:set_ability(G.P_CENTERS[card.ability.mod_conv])
                    highlighted_card:juice_up()
                end
                return true
            end
        }))
    end,
    abn_artist_credits = {
        artist = "SmoliconBoi",
    },
}

SMODS.Consumable {
    key = "bathypelagic",
    set = 'crepuscular',
    cost = 4,
    atlas = "AbandoniaCrepuscular",
    pos = { x = 1, y = 2 },
    config = { max_highlighted = 3, mod_conv = 'm_abn_bubble' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        local valid_suits = {}
        for k, v in pairs(SMODS.Suits) do
            if v.mod and v.mod.id then
                valid_suits[#valid_suits + 1] = k
            end
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for i = 1, #G.hand.highlighted do
                    local highlighted_card = G.hand.highlighted[i]
                    
                    highlighted_card:set_ability(G.P_CENTERS[card.ability.mod_conv])
                    
                    if #valid_suits > 0 then
                        local chosen_suit = pseudorandom_element(valid_suits, pseudoseed('bathypelagic'))
                        highlighted_card:change_suit(chosen_suit)
                    end

                    highlighted_card:juice_up()
                end
                return true
            end
        }))
    end,
    abn_artist_credits = {
        artist = "SmoliconBoi",
    },
}