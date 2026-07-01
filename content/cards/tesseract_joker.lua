SMODS.Joker {
    key = 'tesseract_joker',
    rarity = "abn_SuperRare",
    atlas = 'ABNJokerSheet15',
    pos = { x = 0, y = 1 },  
    cost = 20,
    discovered = false,
    blueprint_compat = false,

    config = { extra = { base_slots = 0, current_bonus = 0, triggered = 0 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.current_bonus }
        }
    end,

    update = function(self, card)
        if card.area == G.jokers then
            if G.consumeables and G.consumeables.cards then
                local unique_rarities = {}
                local rarity_count = 0

                for _, c in ipairs(G.consumeables.cards) do
                    if c.ability and c.ability.set == "Joker" and c.config and c.config.center then
                        local rarity = c.config.center.rarity
                        if rarity and not unique_rarities[rarity] then
                            unique_rarities[rarity] = true
                            rarity_count = rarity_count + 1
                        end
                    end
                end

                local old_bonus = card.ability.extra.current_bonus or 0
                local diff = rarity_count - old_bonus

                if diff ~= 0 then
                    card.ability.extra.current_bonus = rarity_count
                    G.consumeables.config.card_limit = G.consumeables.config.card_limit + diff
                end
            end
        end
    end,
    
    add_to_deck = function(self, card)
        card.ability.extra.base_slots = G.consumeables.config.card_limit
    end,
    
    remove_from_deck = function(self, card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - (card.ability.extra.current_bonus or 0)
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.triggered = 0
        end

        if context.end_of_round and card.ability.extra.triggered == 0 and not context.repetition and G.GAME.blind and G.GAME.blind.boss then
            if G.jokers and G.jokers.cards and #G.jokers.cards > 0 then
                local rightmost_joker = G.jokers.cards[#G.jokers.cards]
                
                if rightmost_joker then
                    card.ability.extra.triggered = 1
                    
                    
                    rightmost_joker:start_dissolve()
                    
                    local copy = copy_card(rightmost_joker, nil, nil, G.consumeables)
                    copy:add_to_deck()
                    G.consumeables:emplace(copy)
                    copy:start_materialize()
                    
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Sustato"
    },
}