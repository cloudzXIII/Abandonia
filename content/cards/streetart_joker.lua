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
	for _, card in ipairs(G.playing_cards) do
		if SMODS.has_enhancement(card, "m_stone") then return true end
	end
	return false
  end,

  add_to_deck = function(self, joker, from_debuff)
    for _, card in ipairs(G.playing_cards) do
      if SMODS.has_enhancement(card, "m_stone") then
        card:set_sprites(card.config.center, card.config.card)
      end
    end
  end,

  remove_from_deck = function(self, joker, from_debuff)
    for _, card in ipairs(G.playing_cards) do
      if SMODS.has_enhancement(card, "m_stone") then
        card:set_sprites(card.config.center, card.config.card)
      end
    end
  end,
  
  abn_artist_credits = {
    artist = "EverSoNitro",
  },
}

--See SMODS.has_playing_card_property hook in utilities/hooks.lua
