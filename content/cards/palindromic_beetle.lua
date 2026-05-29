SMODS.Joker {
    key = 'palindromic_beetle',
    
    rarity = 2,
    atlas = 'ABNJokerSheet11',
    pos = { x = 2, y = 5 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",

    
    calculate = function(self, card, context)
        if context.setting_blind then
            for _, joker in ipairs(G.jokers.cards or {}) do
                if joker.ability.perishable then
                    joker:remove_sticker("perishable")
                    joker:juice_up()
                end
            end
        end
    end,
    abn_artist_credits = {
        artist = "Swizik",
    },

    in_pool = function(self, args) 
        for _, joker in ipairs(G.jokers.cards or {}) do
            if joker.ability.perishable then
                return true
            end
            if SMODS.is_eternal(joker, trigger) then
                return true
            end
        end
        return false
    end
    
}
