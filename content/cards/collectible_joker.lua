-- Save reference to original add_to_deck
local add_to_deckref = Card.add_to_deck

function Card.add_to_deck(self, from_debuff)
    if not self.added_to_deck then
        if not from_debuff then
            
            -- Tracking joker rarities
            if self.ability and self.ability.set == "Joker" then
                G.GAME.abn_purchased_jokers = G.GAME.abn_purchased_jokers or {}
                G.GAME.abn_purchased_joker_rarities = G.GAME.abn_purchased_joker_rarities or {}
                
                local key = self.config.center.key
                local rarity = self.config.center.rarity or "Unknown"

                -- Duplicate check
                local already_added = false
                for _, stored_key in ipairs(G.GAME.abn_purchased_jokers) do
                    if stored_key == key then
                        already_added = true
                        break
                    end
                end
                
                if not already_added then
                    table.insert(G.GAME.abn_purchased_jokers, key)
                    
                    -- Increment the count for this specific rarity
                    G.GAME.abn_purchased_joker_rarities[rarity] = (G.GAME.abn_purchased_joker_rarities[rarity] or 0) + 1
                end
            end

        end
    end

    return add_to_deckref(self, from_debuff)
end


SMODS.Joker {
    key = 'collectible_joker',
    rarity = 'abn_SuperRare',
    atlas = 'ABNJokerSheet3', 
    pos = { x = 8, y = 5 }, 
    cost = 20,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            xmultadd = 0.3,
            xchipsadd = 1,
            multadd = 5,
            chipsadd = 10
        }
    },

    loc_vars = function(self, info_queue, card)
        local rarities = G.GAME and G.GAME.abn_purchased_joker_rarities or {}
        
        local common_count = (rarities[1] or 0) + (rarities['Common'] or 0)
        local uncommon_count = (rarities[2] or 0) + (rarities['Uncommon'] or 0)
        local rare_count = (rarities[3] or 0) + (rarities['Rare'] or 0)
        local legendary_count = (rarities[4] or 0) + (rarities['Legendary'] or 0)

        local current_xmult = 1 + (rare_count * card.ability.extra.xmultadd)
        local current_xchips = 1 + (legendary_count * card.ability.extra.xchipsadd)
        local current_mult = uncommon_count * card.ability.extra.multadd
        local current_chips = common_count * card.ability.extra.chipsadd

        return { 
            vars = { 
                current_xmult, 
                current_xchips, 
                current_mult, 
                current_chips, 
                card.ability.extra.xmultadd, 
                card.ability.extra.xchipsadd, 
                card.ability.extra.multadd, 
                card.ability.extra.chipsadd 
            } 
        }
    end,

    calculate = function(self, card, context)
        -- Scoring
        if context.joker_main then
            local rarities = G.GAME and G.GAME.abn_purchased_joker_rarities or {}
            
            local common_count = (rarities[1] or 0) + (rarities['Common'] or 0)
            local uncommon_count = (rarities[2] or 0) + (rarities['Uncommon'] or 0)
            local rare_count = (rarities[3] or 0) + (rarities['Rare'] or 0)
            local legendary_count = (rarities[4] or 0) + (rarities['Legendary'] or 0)

            return {
                xmult = 1 + (rare_count * card.ability.extra.xmultadd),
                xchips = 1 + (legendary_count * card.ability.extra.xchipsadd),
                mult = uncommon_count * card.ability.extra.multadd,
                chips = common_count * card.ability.extra.chipsadd,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Vlambambo",
    },
}