-- woooo 400!! ~Eric

SMODS.Joker {
  key = 'mariner_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 3, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "continent" then
		local planet_cards = {
			'c_abn_lauto', 'c_abn_urcurme', 'c_abn_nevus', 'c_abn_aerth', 'c_abn_sarh', 'c_abn_unpter', 'c_abn_urno', 'c_abn_ranu', 'c_abn_etnup',
			'c_abn_zabures', 'c_abn_pergus', 'c_abn_vugmado', 'c_abn_abandia',
		}
        local random_card_id = planet_cards[math.random(1, #planet_cards)]
        local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, random_card_id)
        _card:add_to_deck()
        G.consumeables:emplace(_card)
    end
  end,
  abn_artist_credits = {
    artist = "Vlambambo",
  },
}
