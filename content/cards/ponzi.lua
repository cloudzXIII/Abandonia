SMODS.Joker {
    key = 'ponzi',
	loc_txt = {
        ['en-us'] = {
			unlock = {
				"?????",
			},
        }
    },
    rarity = 4,
    atlas = 'AbandoniaJokers',
    pos = { x = 1, y = 26 },
	soul_pos = { x = 2, y = 26 },
    cost = 20,
    discovered = false,
    blueprint_compat = true, 
	unlocked = false,
    
	config = { extra = { mult = 3, chips = 10, loss = 1, money = 99999999 } },

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.loss  }}
    end,
	
	add_to_deck = function(self, card)
		card.ability.extra.money = G.GAME.dollars
		unlock_card(self)
	end,
	
	update = function(self, card)
        if card.area == G.jokers then
			if G.GAME.dollars < card.ability.extra.money then
				card.ability.extra.money = G.GAME.dollars
				for _, v in ipairs(G.playing_cards) do
					v.ability.perma_mult = (v.ability.perma_mult or 0) + card.ability.extra.mult
					v.ability.perma_bonus = (v.ability.perma_bonus or 0) + card.ability.extra.chips
				end
			end
			
			if G.GAME.dollars > card.ability.extra.money then
				card.ability.extra.money = G.GAME.dollars
			end
		end
    end,

    calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual and not context.end_of_round then
            return {
                dollars = -card.ability.extra.loss,
                card = card,
            }
        end
    end,

    abn_artist_credits = {
        artist = "Gfs",
    },
}