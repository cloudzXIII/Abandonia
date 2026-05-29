SMODS.Joker {
    key = 'memory_dump_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet11',
    pos = { x = 0, y = 5 },
    config = {extra = {xmult = 0.25},imm = {hand_size = 0}},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.imm.hand_size,
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.before then
            if (#context.scoring_hand > card.ability.imm.hand_size) then
                card.ability.imm.hand_size = #context.scoring_hand
                for _, j in ipairs(G.jokers.cards) do
                    j.ability.abn_perma_xmult = (j.ability.abn_perma_xmult or 1) + card.ability.extra.xmult
                    return {
                        message = 'Upgraded!',
                        colour = G.C.RED
                    }
                end
            else
                for _, j in ipairs(G.jokers.cards) do
                    SMODS.debuff_card(j,true,"j_memory_dump_joker")
                end
                SMODS.destroy_cards(G.jokers.cards, nil, true,nil)     
            end
        end
        if context.blind_defeated then
            card.ability.imm.hand_size = 0
            return {
                message = 'Reset!',
                colour = G.C.FILTER
            }
        end
    end,
    abn_artist_credits = {
        artist = "Notextify",
    },
    
    
}