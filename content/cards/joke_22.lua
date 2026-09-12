SMODS.Joker{
    key = "joke_22",
    atlas = "ABNJokerSheet23",
    pos = { x = 5, y = 3 },               
    rarity = 2,                           
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    abn_coder = "LasagnaFelidae",
    config = {
        extra = {
            mult = 0,
            chips = 0,
            mod = 0,
        }
    },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
    end,
    
    is_modded_hand = function(self, hand)
        if SMODS.PokerHands[hand] and SMODS.PokerHands[hand].mod then   
            return true
        end
        return false
    end,
    is_modded_suit = function(self, c)
        if c.base and c.base.suit and SMODS.Suits[c.base.suit].mod then   
            return true
        end
        return false
    end,
    
    calculate = function(self, card, context)
        
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
        
        if context.before and not context.blueprint then
            local scoring = context.scoring_hand
            if not scoring or #scoring == 0 then return end
            if context.scoring_name == "High Card" then return end
            
            card.ability.extra.mod = 0
            local flipped = self:is_modded_hand(context.scoring_name) == true and "chips" or "mult"
            print(context.scoring_name, "is modded hand?", self:is_modded_hand(context.scoring_name) and "yes" or "no")
            
            for _, c in ipairs(scoring) do
                print(c.base.suit, "is modded suit?", self:is_modded_suit(c) and "yes" or "no")
                if self:is_modded_suit(c) == true and flipped == "mult" then
                    card.ability.extra.mod = card.ability.extra.mod + c.base.nominal
                elseif self:is_modded_suit(c) == false and flipped == "chips" then
                    card.ability.extra.mod = card.ability.extra.mod + c.base.nominal
                end
            end
            if card.ability.extra.mod > 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = flipped,
                    scalar_value = "mod",
                    scaling_message = {
                        message = localize{type = 'variable', key = 'a_'..flipped, vars = {card.ability.extra.mod}},
                        colour = flipped == "chips" and G.C.CHIPS or G.C.MULT
                    }
                })
            end    
        end
    end,
    
    in_pool = function(self, args)
        for hand_key, hand in pairs(G.GAME.hands) do
            if self:is_modded_hand(hand_key) and hand.played > 0 then
                return true
            end
        end
        return false
    end,
    
    abn_artist_credits = {
        artist = "GM36",
    },
    
}