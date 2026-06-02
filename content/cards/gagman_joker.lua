local csa = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
  csa(self, center, initial, delay_sprites)
  if center == G.P_CENTERS.m_abn_polkadot and next(SMODS.find_card('j_abn_gagman_joker')) then
    self.config.center.replace_base_card = false
    self.config.center.no_rank = false
    self.config.center.no_suit = false
  end
end

local shf = Card.should_hide_front
function Card:should_hide_front()
  if self.config.center == G.P_CENTERS.m_abn_polkadot and next(SMODS.find_card('j_abn_gagman_joker')) then return false end
  return shf(self)
end

SMODS.Joker {
  key = 'gagman_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet13',
  pos = { x = 2, y = 2 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_polkadot
  end,
  
  in_pool = function(self)
	if not G.playing_cards then return false end

	for _, card in ipairs(G.playing_cards) do
		if card and card.config and card.config.center then
			if card.config.center == G.P_CENTERS.m_abn_polkadot then
				return true
			end
		end
	end
	return false
  end,
  
  abn_artist_credits = {
    artist = "B.b.b.b",
  },
}
