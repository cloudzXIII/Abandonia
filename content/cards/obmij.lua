SMODS.Joker {
    key = 'obmij',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 0, y = 7 },
    soul_pos = { x = 1, y = 7},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = #G.jokers.cards
            }
        end
    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}