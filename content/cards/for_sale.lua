SMODS.Joker {
    key = 'for_sale_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet11',
    pos = { x = 2, y = 4 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { chips = 0, } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips} }
    end,

    
    calculate = function(self, card, context)
        if context.joker_main then
            local sell_cost = 0
            for _, j in ipairs(G.jokers.cards) do
                sell_cost = sell_cost + j.sell_cost
            end
            card.ability.extra.chips = card.ability.extra.chips + sell_cost
            SMODS.calculate_effect({message = "+"..sell_cost.." Chips",
                        colour = G.C.BLUE,
                        }, card)
			return {
                chips = card.ability.extra.chips
            }
		end


    end,
    abn_artist_credits = {
        artist = "Swizik",
    },
}

