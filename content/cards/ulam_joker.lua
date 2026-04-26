SMODS.Joker {
    key = 'ulam_joker',
    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 4, y = 23 },
    cost = 5,
    discovered = false,
    blueprint_compat = true, 
    
    config = { 
        extra = { 
            chips = 0, 
            mult = 0, 
        } 
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.chips, 
            card.ability.extra.mult, 
        } }
    end,
    
    in_pool = function(self)
        local spectrum_hands = {
            "abn_Spectrum", 
            "abn_Specflush", 
            "abn_Straight Specflush", 
            "abn_Specflush House", 
            "abn_Specflush Five", 
            "abn_Specflush Six"
        }

        if G.GAME and G.GAME.hands then
            for _, hand_name in ipairs(spectrum_hands) do
                if G.GAME.hands[hand_name] and G.GAME.hands[hand_name].played > 0 then
                    return true
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        -- SCALING LOGIC
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            local valid_hands = {
                ["abn_Spectrum"] = true, 
                ["abn_Specflush"] = true, 
                ["abn_Straight Specflush"] = true, 
                ["abn_Specflush House"] = true, 
                ["abn_Specflush Five"] = true, 
                ["abn_Specflush Six"] = true
            }

            if valid_hands[context.scoring_name] then
                local min_rank = 15
                local max_rank = 0

                -- Find the range of the scored cards
                for i = 1, #context.scoring_hand do
                    local rank = context.scoring_hand[i].base.id
                    if rank < min_rank then min_rank = rank end
                    if rank > max_rank then max_rank = rank end
                end

                local diff = max_rank - min_rank
                
                -- Apply multiplier if the joker has an edition (Gains twice the difference)
                local gain = card.edition and (diff * 2) or diff

                if diff > 0 then
                    card.ability.extra.chips = card.ability.extra.chips + gain
                    card.ability.extra.mult = card.ability.extra.mult + gain
                    
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Upgrade!", colour = G.C.Mult})
                    card:juice_up()
                end
            end
        end
        
        -- SCORING LOGIC
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Flowr",
    },
}