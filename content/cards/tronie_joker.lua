SMODS.Joker {
  key = 'tronie_joker',

  loc_vars = function(self, info_queue, card)
    return {
        vars={
            card.ability.extra.joker_slots,
            card.ability.extra.blind_size,
            card.ability.extra.add,
        },
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 7, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  config={
    extra={
    joker_slots = 2,
    blind_size = 1.5,
    add = 0.5,
    },
  },

  add_to_deck = function(self, card, from_debuff)
    G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
	G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * card.ability.extra.blind_size
  end,
  
  remove_from_deck = function(self, card, from_debuff)
    G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
	G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling / card.ability.extra.blind_size
  end,
  
  calculate = function(self, card, context)
	if context.end_of_round and context.main_eval and G.GAME.blind.boss then
		card.ability.extra.blind_size = card.ability.extra.blind_size + card.ability.extra.add
		G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling + (G.GAME.starting_params.ante_scaling * card.ability.extra.add)
		return {
			message = localize('k_upgrade_ex'),
			colour = G.C.ATTENTION,
			card = card
		}
	end
  end,

  abn_artist_credits = {
    artist = "Pooper McFart",
  },
}
