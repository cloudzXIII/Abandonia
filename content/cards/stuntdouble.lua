SMODS.Joker {
    key = 'stuntdouble',
    rarity = 3, 
    atlas = 'ABNJokerSheet1',
    pos = { x = 8, y = 1 },   
    cost = 7,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 60,
            handsize = 2,
			stuntmanbonus = 8,
			stuntman = false
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.handsize,
				card.ability.extra.stuntmanbonus
            }
        }
    end,
	
	add_to_deck = function(self, card)
		G.hand.config.card_limit = G.hand.config.card_limit - card.ability.extra.handsize
    end,
	
	remove_from_deck = function(self, card)
        G.hand.config.card_limit = G.hand.config.card_limit + card.ability.extra.handsize
		if next(SMODS.find_card("j_stuntman")) then
			G.hand.config.card_limit = G.hand.config.card_limit - card.ability.extra.stuntmanbonus + card.ability.extra.handsize
		end
    end,
	
	update = function(self, card)
        if card.area == G.jokers and card.ability.extra.stuntman == false and next(SMODS.find_card("j_stuntman")) then
			G.hand.config.card_limit = G.hand.config.card_limit + card.ability.extra.stuntmanbonus
			card.ability.extra.stuntman = true
		elseif card.area == G.jokers and card.ability.extra.stuntman == true and not next(SMODS.find_card("j_stuntman")) then
			G.hand.config.card_limit = G.hand.config.card_limit - card.ability.extra.stuntmanbonus
			card.ability.extra.stuntman = false
		end
    end,
	
	
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}