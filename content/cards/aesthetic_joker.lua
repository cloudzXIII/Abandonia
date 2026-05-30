
SMODS.Joker {
    key = 'aesthetic_joker',
    abn_coder = "LasagnaFelidae",
    
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.chips_mod, card.ability.extra.chips} 
        }
    end,
    
    rarity = 2,
    atlas = 'ABNJokerSheet4',
    pos = { x = 5, y = 4 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { chips = 0, chips_mod = 10 } },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and next(SMODS.get_enhancements(context.other_card)) then
            if card.edition then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra, -- the table that has the value you are changing in
                    ref_value = "chips", -- the key to the value in the ref_table
                    scalar_value = "chips_mod", -- the key to the value to scale by, in the ref_table by default
                })
            end
            return {mult = context.other_card.base.suit.nominal}
        end
        if context.joker_main then
            
        end
    
    end,
    abn_artist_credits = {
        artist = "inky",
    },
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then
                return true
            end
        end
        return false
    end
}
