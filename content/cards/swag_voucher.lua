SMODS.Joker{
    key = "voucher_jimbo",
    atlas = "ABNJokerSheet23",
    pos = { x = 1, y = 1 },               
    rarity = 2,                           
    cost = 4,
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
            mult_mod = 10,
            chips_mod = 20,
        }
    },
    
    loc_vars = function(self, info_queue, card)
        local ante_bonus = (G.vouchers and #G.vouchers.cards or 0)
        local mult, chips =   (card.ability.extra.mult == 0 
                                and card.ability.extra.mult + (card.ability.extra.mult_mod * ante_bonus) 
                                or card.ability.extra.mult), 
                                (card.ability.extra.chips == 0
                                and card.ability.extra.chips + (card.ability.extra.chips_mod * ante_bonus) 
                                or card.ability.extra.chips)
        return { vars = { card.ability.extra.mult_mod, card.ability.extra.chips_mod, mult, chips, } }
    end,
    
    calculate = function(self, card, context)
        
        if context.joker_main then
            local ret = {}
            ret.mult = math.max(card.ability.extra.mult > 0 and card.ability.extra.mult or 0, 0)
            ret.chips = math.max(card.ability.extra.chips > 0 and card.ability.extra.chips or 0, 0)

            return ret
        end
        
        if context.buying_card and context.card and context.card.config.center.set == "Voucher" then
            
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "mult_mod"
            })
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_value = "chips_mod",
                no_message = true,
            })
        end
        

    end,
    
    in_pool = function(self, args)
        for i, v in ipairs(G.vouchers and G.vouchers.cards or {}) do
            if v.config.center.set == "Voucher" then
                return true
            end
        end
        return false
    end,
    
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod * (G.vouchers and #G.vouchers.cards or 0)   )
            card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chips_mod * (G.vouchers and #G.vouchers.cards or 0))
        end
    end,
    abn_artist_credits = {
        artist = "GM36",
    },
    
}

SMODS.Joker{
    key = "swag_voucher",
    atlas = "ABNJokerSheet23",
    pos = { x = 2, y = 1 },               
    rarity = 3,                           
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    abn_coder = "LasagnaFelidae",
    config = {
        extra = {
            xmult = 1,
            xchips = 1,
            xmult_mod = 1.25,
            xchips_mod = 1.25,
        }
    },
    
    loc_vars = function(self, info_queue, card)
        local ante_bonus = (G.vouchers and #G.vouchers.cards or 0)
        local xmult, xchips =   (card.ability.extra.xmult == 1 
                                and card.ability.extra.xmult + (card.ability.extra.xmult_mod * ante_bonus) 
                                or card.ability.extra.xmult), 
                                (card.ability.extra.xchips == 1 
                                and card.ability.extra.xchips + (card.ability.extra.xchips_mod * ante_bonus) 
                                or card.ability.extra.xchips)
        return { vars = { card.ability.extra.xmult_mod, card.ability.extra.xchips_mod,xmult, xchips, } }
    end,
    
    calculate = function(self, card, context)
        
        if context.joker_main then
            local ret = {}
            ret.xmult = math.max(card.ability.extra.xmult > 1 and card.ability.extra.xmult or 1, 1)
            ret.xchips = math.max(card.ability.extra.xchips > 1 and card.ability.extra.xchips or 1, 1)

            return ret
        end
        
        if context.buying_card and context.card and context.card.config.center.set == "Voucher" then
            
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_mod"
            })
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xchips",
                scalar_value = "xchips_mod",
                no_message = true,
            })
        end
        

    end,
    
    in_pool = function(self, args)
        for i, v in ipairs(G.vouchers and G.vouchers.cards or {}) do
            if v.config.center.set == "Voucher" and v.config.center.mod then
                return true
            end
        end
        return false
    end,
    
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod * (G.vouchers and #G.vouchers.cards or 0)   
            card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_mod * (G.vouchers and #G.vouchers.cards or 0)
        end
    end,
    abn_artist_credits = {
        artist = "GM36",
    },
    
}