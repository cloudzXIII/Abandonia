SMODS.Joker {
    key = 'perrrkeo',
    loc_vars = function(self, info_queue, card)
        -- Calculating the current percentage for the tooltip
        local current_percent = card.ability.extra.balance + (card.ability.extra.balanceadd * #G.consumeables.cards)
        return { vars = { card.ability.extra.balance, card.ability.extra.balanceadd, current_percent } }
    end,

    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 4, y = 2 },
    soul_pos = { x = 5, y = 2 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,

    config = { extra = { balance = 50, balanceadd = 10 } },
    
    calculate = function(self, card, context)
        if context.final_scoring_step then
            -- Calculate the dynamic percentage based on held consumables
            local effect_percent = (card.ability.extra.balance + (card.ability.extra.balanceadd * #G.consumeables.cards)) / 100
            
            -- Determine the "Balanced" target (Plasma Deck logic)
            local target = (hand_chips + mult) / 2
            
            -- Calculate the shift toward the target
            local chips_diff = (target - hand_chips) * effect_percent
            local mult_diff = (target - mult) * effect_percent
            
            -- Apply the weighted balance to the global scoring variables
            hand_chips = hand_chips + chips_diff
            mult = mult + mult_diff

            -- Return the visual notification
            return {
                message = localize('k_balanced'),
                colour = G.C.PURPLE,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Bunnet and floweringashes",
    },
}