local csa = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
  csa(self, center, initial, delay_sprites)
  if (center == G.P_CENTERS.m_stone and next(SMODS.find_card('j_abn_streetart_joker'))) or (center == G.P_CENTERS.m_stone or center == G.P_CENTERS.m_abn_petroleum) and next(SMODS.find_card('j_abn_stone_calendar')) then
    self.config.center.replace_base_card = false
    self.config.center.no_rank = false
    self.config.center.no_suit = false
  end
end

local shf = Card.should_hide_front
function Card:should_hide_front()
  if (self.ability.effect == 'Stone Card' and next(SMODS.find_card('j_abn_streetart_joker'))) or (self.ability.effect == 'Stone Card' or self.ability.name == 'm_abn_petroleum') and next(SMODS.find_card('j_abn_stone_calendar')) then return false end
  return shf(self)
end

SMODS.Joker {
  key = 'streetart_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet3',
  pos = { x = 1, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
  end,
  
  in_pool = function(self)
	if not G.playing_cards then return false end

	for _, card in ipairs(G.playing_cards) do
		if card and card.config and card.config.center then
			if card.config.center == G.P_CENTERS.m_stone then
				return true
			end
		end
	end
	return false
  end,
  
  abn_artist_credits = {
    artist = "EverSoNitro",
  },
}
