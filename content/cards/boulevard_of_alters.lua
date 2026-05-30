SMODS.Joker {
    key = 'boulevard_of_alters',
    rarity = 2,
    --atlas = 'ABNJokerSheet11',
    atlas = "placeholder",
    pos = { x = 0, y = 0 },
    config = {extra = {chips = 10, xmult = 0.1, xchips = 0.1}},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.xmult,
                card.ability.extra.xchips,
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.post_trigger and context.other_card ~= card and (context.other_card.ability and context.other_card.config and context.other_card.config.center and context.other_card.area == G.jokers) then
            if context.other_card:is_rarity(3) then
                for _, j in ipairs(G.jokers.cards) do
                    if j:is_rarity(1) then 
                        j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.chips
                        return {
                            message = 'Upgraded!',
                            colour = G.C.BLUE,
                            card = j,
                        }
                    end
                end
			end
            if context.other_card:is_rarity(2) then
                for _, j in ipairs(G.jokers.cards) do
                    if j:is_rarity(3) then 
                        j.ability.abn_perma_xmult = (j.ability.abn_perma_xmult or 1) + card.ability.extra.xmult
                        return {
                            message = 'Upgraded!',
                            colour = G.C.RED,
                            card = j,
                        }
                    end
                end
            end
            if context.other_card:is_rarity(1) then
                for _, j in ipairs(G.jokers.cards) do
                    if j:is_rarity(2) then 
                        j.ability.abn_perma_xchips = (j.ability.abn_perma_xchips or 1) + card.ability.extra.xchips
                        return {
                            message = 'Upgraded!',
                            colour = G.C.BLUE,
                            card = j,
                        }
                    end
                end
            end
        end
    end,
    abn_artist_credits = {
        artist = "Comykel",
    },

    
}
