SMODS.Joker {
    key = 'rubicante',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 4, y = 0 },
    soul_pos = { x = 5, y = 0 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if ABN.is_even(context.other_card) then
				return {
					mult = context.other_card.base.nominal * 3	
				}
			end
		end
    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}