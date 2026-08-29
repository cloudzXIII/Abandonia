SMODS.Joker {
  key = 'sweepstakes_card',
  rarity = 3,
  atlas = 'ABNJokerSheet18',
  pos = { x = 7, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = false,
  config = {
    extra = {
      percent = 20
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.percent,
      }
    }
  end,
  
  add_to_deck = function(self, card)
	G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra.percent
  end,

  remove_from_deck = function(self, card)
	G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.percent
  end,
  
  update = function(self, card)
    if card.area == G.jokers then
		if G.shop_jokers and G.shop_jokers.cards then
			for _, j in ipairs(G.shop_jokers.cards) do 
				if j.config.center.original_mod and j.ability.set == "Joker" then
					j.cost = 1
				end
			end
		end
	end
  end,

  abn_artist_credits = {
    artist = "Cosine Rave",
  },
}