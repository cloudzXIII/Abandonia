SMODS.Joker {
    key = "stereogram",
    name = "Stereogram Joker",
    config = { extra = { balance = 5 } },
    pos = { x = 8, y = 3 },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    atlas = "ABNJokerSheet4",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.balance } }
    end,
    calculate = function(self, card, context)
        -- 1. Check if individual context is even reaching the joker
        if context.individual and context.cardarea == G.play then
            local other_card = context.other_card
            local id = other_card:get_id()
            print("[Stereogram] Fired for card ID: " .. tostring(id))
            
            local rank_key = nil
            -- Scan the object buffer for the rank
            for _, key in ipairs(SMODS.Rank.obj_buffer) do
                local rank = SMODS.Ranks[key]
                if rank and rank.id == id then
                    rank_key = key
                    break
                end
            end
            
            print("[Stereogram] Found Rank Key: " .. tostring(rank_key))
            
            if rank_key then
                local rank = SMODS.Ranks[rank_key]
                -- Check face card and Ace logic
                print("[Stereogram] Is Face: " .. tostring(rank.face) .. " | Is Ace: " .. tostring(rank_key == 'Ace'))
                
                if rank_key ~= 'Ace' and not rank.face then
                    print("[Stereogram] SUCCESS: Card is a number rank! Returning abn_balance_percent = " .. tostring(card.ability.extra.balance))
                    return {
                        abn_balance_percent = card.ability.extra.balance,
                        card = card
                    }
                else
                    print("[Stereogram] EXCLUDED: Card is a face card or an Ace.")
                end
            else
                print("[Stereogram] ERROR: Could not map card ID to any SMODS rank.")
            end
        end
    end,
    
    abn_artist_credits = {
        artist = "Yahooyowza",
    },
    
    in_pool = function(self, args)
        if G.GAME and G.GAME.selected_back then
            if G.GAME.selected_back.effect.center.key ~= "b_plasma" then
                return true
            end
        end
        return false
    end
}