

SMODS.Joker {
    key = 'scrapbook_joker',
    rarity = 1,
    atlas = 'ABNJokerSheet13',
    pos = { x = 2, y = 3 },
    cost = 4,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { chips = 2} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            for _, j in ipairs(G.jokers.cards) do
                local list = ABN.listStickers(j)
                if list and #list > 0 then 
                    j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + (card.ability.extra.chips * #list)
                    return {
                        message = 'Upgraded!',
                        colour = G.C.BLUE,
                        card = j,
                    }
                end
            end
        end
    end,
    in_pool = function(self, args)
        for _, j in ipairs(G.jokers.cards) do
            local list = ABN.listStickers(j)
            if list and #list > 0 then 
                return true
            end
        end
        return false
    end,

    
    abn_artist_credits = {
        artist = "Jolly+",
    },
}

