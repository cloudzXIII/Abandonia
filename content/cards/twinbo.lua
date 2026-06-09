SMODS.Joker {
    key = 'twinbo',
    rarity = 3, 
    atlas = 'ABNJokerSheet9',
    pos = { x = 3, y = 4 },   
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            jokers = 2,
            xmult = 2,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.jokers,
                card.ability.extra.xmult
            }
        }
    end,
    
    add_to_deck = function(self, card)
        
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokers

        local current_play_limit = G.GAME.starting_params.play_limit
        local limit_reduction = 2 - current_play_limit
        
        card.ability.extra.play_limit_reduced_by = limit_reduction
        
        SMODS.change_play_limit(limit_reduction)
    end,
    
    remove_from_deck = function(self, card)
        
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jokers

        local restore_amount = -(card.ability.extra.play_limit_reduced_by or -3) 
        
        SMODS.change_play_limit(restore_amount)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local currentCard = context.other_card
            if currentCard then
                return {
                    xmult = card.ability.extra.xmult,
                    card = currentCard
                }
            end
        end
    end,

    abn_artist_credits = {
        artist = "Kyao",
    },
}