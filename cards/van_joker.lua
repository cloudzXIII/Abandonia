SMODS.Joker {
    key = 'van_joker',
    atlas = 'AbandoniaJokers',
    pos = {
        x = 3,
        y = 3
    },
    config = {
        extra = {
            voucher_slots = 1
        },
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.voucher_slots
            }
        }  
    end,
    add_to_deck = function(self, card, from_debuff)
       SMODS.change_voucher_limit(card.ability.extra.voucher_slots)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(-card.ability.extra.voucher_slots)
    end,
}