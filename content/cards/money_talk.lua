SMODS.Joker {
    key = 'money_talk',
    rarity = 3,
    atlas = 'ABNJokerSheet16',
    pos = { x = 9, y = 2 },
    cost = 8,
    discovered = false,
    blueprint_compat = false,
    config = { extra = { dollars = 1, bosses = 1 } },

    loc_vars = function(self, info_queue, card)
        local current_gain = card.ability.extra.dollars * card.ability.extra.bosses
        return {
            vars = { card.ability.extra.dollars, current_gain }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.repetition and G.GAME.blind and G.GAME.blind.boss then            
            local gain_amount = card.ability.extra.dollars * card.ability.extra.bosses

            if G.consumeables and G.consumeables.cards then
                for _, consumable in ipairs(G.consumeables.cards) do
                    consumable.ability.extra_value = (consumable.ability.extra_value or 0) + gain_amount
                    consumable:set_cost()
                end
            end

            card.ability.extra.bosses = card.ability.extra.bosses + 1

            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            })
        end
    end,

    abn_artist_credits = {
        artist = "Inky"
    },
}