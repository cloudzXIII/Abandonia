SMODS.Joker {
    key = 'best_employ',
    atlas = 'AbandoniaJokers',
    pos = {
        x = 8,
        y = 4
    },
    config = {
        extra = {
            xmult = 0
        },
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmul  
            }
        }  
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return
            {
                xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            card.ability.extra.xmult = card.ability.extra.xmult + 1
        end
    end,
}