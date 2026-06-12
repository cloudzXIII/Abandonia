
SMODS.Joker {
    key = "even_stephen",
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    atlas = 'ABNJokerSheet15',
    pos = { x = 1, y = 4 },
    abn_coder = "LasagnaFelidae",
    config = { extra = { mult = 8 } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local rank = context.other_card.base.id
            if context.other_card.base.value == "abn_14" 
            or context.other_card.base.value == "abn_13"
            or context.other_card.base.value == "abn_12"
            or context.other_card.base.value == "abn_11" then 
                rank = context.other_card.base.nominal 
            end
            if rank <= 10 and rank >= 0 and rank % 2 == 0 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
    abn_artist_credits = {
        artist = "The Majin00",
    },
}