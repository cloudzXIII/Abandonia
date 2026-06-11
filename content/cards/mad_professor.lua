SMODS.Joker {
    key = 'mad_professor',
    rarity = 1,
    atlas = 'ABNJokerSheet9',
    pos = { x = 2, y = 4 },
    cost = 4,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { chips = 1, }},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, } }
    end,
    
    calculate = function(self, card, context)
        if context.before then
            card.ability.rank_scoring = {}
            print(card.ability.rank_scoring)
        end
        if context.individual and context.cardarea == G.play then
            local rank = context.other_card.base.id 
            
            card.ability.rank_scoring[rank] = (card.ability.rank_scoring[rank] or 0) + 1

            print (rank, card.ability.rank_scoring[rank], context.other_card.ability.perma_bonus)

            local triggers = card.ability.rank_scoring[rank]

            context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + (triggers * card.ability.extra.chips)

            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.CHIPS
            }
        end


    end,


    
    abn_artist_credits = {
        artist = "Kyao",
    },
}