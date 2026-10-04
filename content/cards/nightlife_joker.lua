SMODS.Joker {
    key = 'nightlife_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet26',
    pos = { x = 3, y = 3 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,

    config = {
        extra = {
            amp = 1,
            dollars = 2,
        }
    },

    in_pool = function(self, args)
        if G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if SMODS.has_no_rank(card) then
                    return true
                end
            end
        end
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.amp, card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_no_rank(context.other_card) then
                local amp_repetitions = (card.edition and card.edition.polychrome) and 1 or 0

                
				
                return {
                    amp = card.ability.extra.amp,
                    card = card
                }
            end
        end
		
		if context.repetition and context.cardarea == G.play then
			if card.edition and card.edition.polychrome then
				ease_dollars(-card.ability.extra.dollars)
				return {
                    repetitions = 1,
                    card = card,
                }
            end
		end
    end,

    abn_artist_credits = {
        artist = "Vlambambo",
    },
}