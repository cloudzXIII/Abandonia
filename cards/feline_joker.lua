SMODS.Joker {
    key = 'feline_joker',
    atlas = 'AbandoniaJokers',
    pos = {
        x = 9,
        y = 4
    },
    config = {
        extra = {
            xmult = 2,
            chips = 100,
            money = 1
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

            }
        }  
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if ABANDONIA.random_chance(.3) then
              return
            {
                xmult = card.ability.extra.xmult
            }  
            elseif ABANDONIA.random_chance(.6) then
                return
            {
                chips = card.ability.extra.chips
            }
            else 
                ease_dollars(card.ability.extra.money)
            end
        end
    end,
}