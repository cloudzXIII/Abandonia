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
        if context.individual and context.cardarea == G.play then
            local other_card = context.other_card
            
            if other_card:get_id() ~= 14 and not other_card:is_face() then
                
                ABN.balance_percent(other_card, (card.ability.extra.balance * 0.01))

                return {
                    card = other_card
                }
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