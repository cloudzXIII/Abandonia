local config = SMODS.current_mod.config


SMODS.Sound({
    key = 'music_bluff',
    path = 'music_bluff.ogg',
	pitch = 1,
	speed = 1,
    select_music_track = function(self)
        -- cool theme made by Firch
        if G.jokers then
			for i = 1, #G.jokers.cards do
				local j = G.jokers.cards[i]
				if j.config.center.key and j.config.center.key == 'j_abn_number_44' and config.Music ~= false then
					return 1e10
				end
			end
		end
    end
})

SMODS.Joker {
  key = 'number_44',
  loc_txt = {
    ['en-us'] = {
		unlock = {
			"?????",
		},
	}
  },
  rarity = 4,
  atlas = 'AbandoniaJokers',
  pos = { x = 0, y = 28 },
  soul_pos = { x = 1, y = 28 },
  cost = 20,
  blueprint_compat = true,
  config = { extra = { jokers = 2, } }, 

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.jokers,
      }
    }
  end,

  abn_artist_credits = {
    artist = "StellarBlue",
  },

  calculate = function(self, card, context)
	if context.setting_blind then
        for i = 1, card.ability.extra.jokers do
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokers
            local new_card = create_card('Joker', G.jokers, false, nil, nil, nil, nil, "mno")
            new_card:add_to_deck()
			G.jokers:emplace(new_card)
        end
    end
  end
}
