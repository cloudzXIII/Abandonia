
SMODS.Joker {
    key = 'paradox_chip',
    abn_coder = "LasagnaFelidae",
    
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { } 
        }
    end,
    
    rarity = 2,
    atlas = 'ABNJokerSheet4',
    pos = { x = 9, y = 5 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { chips = 10, mult = 3 } },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and ABN.is_number(context.other_card) and context.other_card.base.suit.nominal > 10 then
            return {mult = context.other_card.base.suit.nominal}
        end
    
    end,
    abn_artist_credits = {
        artist = "Jabo",
    },
}
