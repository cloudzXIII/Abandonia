SMODS.Joker {
    key = "stereogram",
    name = "Stereogram Joker",
    config = { extra = { balance = 5 } },
    pos = { x = 8, y = 3 },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    atlas = "ABNJokerSheet4",
    attributes = { "balance", "rank" },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.balance } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if ABN.is_number(context.other_card) then
                return {
                    abn_balance_percent = card.ability.extra.balance
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "Yahooyowza",
    },
    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.selected_back.effect.center.key ~= "b_plasma" then
                return true
            end
        end
        return false
    end
}
