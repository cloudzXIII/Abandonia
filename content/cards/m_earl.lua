SMODS.Joker {
  key = 'm_earl',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 4, y = 0 },
  soul_pos = { x = 5, y = 0 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,
  
  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
		G.GAME.blind.chips = G.GAME.blind.chips * 0.1
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end
	
	if context.joker_main then
		return {
			message = "hehehe",
			colour = G.C.GREEN,
		}
	end
  end,

  abn_artist_credits = {
    artist = "GeorgetheRat",
  },
}