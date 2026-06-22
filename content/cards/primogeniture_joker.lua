SMODS.Joker {
    key = "primogeniture_joker",
    name = "Primogeniture Joker",
    config = { extra = { xmult = 2, chipsadd = 10, chips = 0 } },
    pos = { x = 9, y = 1 },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    atlas = "ABNJokerSheet12", 
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.chipsadd, card.ability.extra.chips } }
    end,
    
    update = function(self, card)
        if card.area == G.jokers then
            if G.shop_jokers and G.shop_jokers.cards then
                for _, j in ipairs(G.shop_jokers.cards) do 
                    if j.config.center.set == 'Joker' then
                        if j.config.center.rarity == 1 then
                            j.cost = 0
                        end
                    end
                end
            end
        end
    end,
    
    calculate = function(self, card, context)
        if context.other_joker and context.other_joker.config.center.rarity and context.other_joker.config.center.rarity == 1 and not next(SMODS.find_card('j_joker')) then
            return {
                xmult = card.ability.extra.xmult
            }
        elseif context.other_joker and context.other_joker.config.center.rarity and context.other_joker.config.center.rarity == 1 and next(SMODS.find_card('j_joker')) then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                xmult = card.ability.extra.xmult
            }
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    
    abn_artist_credits = {
        artist = "Heart of [Crow]",
    }
}