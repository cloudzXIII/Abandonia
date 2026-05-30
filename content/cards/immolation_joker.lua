SMODS.Joker {
  key = 'immolation_joker',
  rarity = 2, 
  atlas = 'ABNJokerSheet1', 
  pos = { x = 8, y = 5 }, 
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  in_pool = function(self)
    if not G.playing_cards then return false end

	for _, card in ipairs(G.playing_cards) do
		if card and card.config and card.config.center then
			if card.config.center == G.P_CENTERS.m_abn_oilfire then
				return true
			end
		end
	end
	return false
  end,

  abn_artist_credits = {
    artist = "Vlambambo",
  },
}