local add_to_deckref = Card.add_to_deck

function Card.add_to_deck(self, from_debuff)
    if not self.added_to_deck then
        if not from_debuff then
            if self.ability and self.ability.set == "Joker" and self.config and self.config.center and self.config.center.original_mod then
                G.GAME.purchased_modded_jokers = G.GAME.purchased_modded_jokers or {}
                local key = self.config.center.key
                local already_added = false
                for _, stored_key in ipairs(G.GAME.purchased_modded_jokers) do
                    if stored_key == key then
                        already_added = true
                        break
                    end
                end
                if not already_added then
                    table.insert(G.GAME.purchased_modded_jokers, key)
                end
            end
        end
    end

    return add_to_deckref(self, from_debuff)
end

SMODS.Joker {
    key = 'fortlatro',
    rarity = 3,
    atlas = 'AbandoniaTeamJokers',
    pos = { x = 0, y = 0 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = { 
        extra = { 
            xchips = 1, 
            xchipsadd = 0.02,
            xmult = 1,
            xmultadd = 0.1
        } 
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.xchips, 
                card.ability.extra.xchipsadd,
                card.ability.extra.xmult,
                card.ability.extra.xmultadd
            } 
        }
    end,

    update = function(self, card, dt)
        if G.GAME then
            local unique_modded_consumables = 0
            if G.GAME.consumeable_usage then
                for k, v in pairs(G.GAME.consumeable_usage) do
                    local count = type(v) == 'table' and v.count or v
                    if count and count > 0 then
                        local center = G.P_CENTERS[k]
                        if center and center.original_mod then
                            unique_modded_consumables = unique_modded_consumables + 1
                        end
                    end
                end
            end
            card.ability.extra.xchips = 1 + (unique_modded_consumables * card.ability.extra.xchipsadd)

            if G.GAME.purchased_modded_jokers then
                local unique_modded_jokers = #G.GAME.purchased_modded_jokers
                card.ability.extra.xmult = 1 + (unique_modded_jokers * card.ability.extra.xmultadd)
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.banned_keys = G.GAME.banned_keys or {}
        for k, v in pairs(G.P_CENTERS) do
			if (v.set == 'Joker' or v.set == 'Tarot' or v.set == 'Planet' or v.set == 'Spectral') and not v.original_mod then
				G.GAME.banned_keys[k] = true
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if not next(SMODS.find_card('j_abn_fortlatro')) then
            if G.GAME.banned_keys then
                for k, v in pairs(G.P_CENTERS) do
                    if (v.set == 'Joker' or v.set == 'Tarot' or v.set == 'Planet' or v.set == 'Spectral') and not v.original_mod then
                        G.GAME.banned_keys[k] = nil
                    end
                end
            end
        end
    end,

    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.blind.name == 'Small Blind' and not context.blueprint then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local new_card = create_card('Consumeables', G.consumeables)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
            end
        elseif context.setting_blind and G.GAME.blind.name == 'Big Blind' and not context.blueprint then
            if #G.jokers.cards < G.jokers.config.card_limit then
                local new_card = create_card('Joker', G.jokers, false, nil, nil, nil, nil, "mno")
                new_card:add_to_deck()
                G.jokers:emplace(new_card)
            end
        end

        if context.joker_main then
            return {
				xmult = card.ability.extra.xmult,
				xchips = card.ability.extra.xchips,
			}
        end
    end,

    abn_artist_credits = {
        artist = "Comykel",
    },
}