SMODS.Joker {
  key = 'tronie_joker',

  loc_vars = function(self, info_queue, card)
    return {
        vars={
            card.ability.extra.joker_slots,
            card.ability.extra.blind_size,
            card.ability.extra.blind_size_increase,
        },
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 0, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  config={
    extra={
    joker_slots=2,
    blind_size=1.5,
    blind_size_increase=0.5,
    },
    immutable={
        joker_slots_current=2,
    },
  },

  add_to_deck = function(self, card, from_debuff)
    G.jokers.config.card_limit=G.jokers.config.card_limit+card.ability.extra.joker_slots
    card.ability.immutable.joker_slots_current=card.ability.extra.joker_slots
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.jokers.config.card_limit=G.jokers.config.card_limit-card.ability.extra.joker_slots
  end,
  update = function (self,card)
    if card.ability.extra.joker_slots >card.ability.immutable.joker_slots_current then
        local difference = card.ability.extra.joker_slots-card.ability.immutable.joker_slots_current
        G.jokers.config.card_limit=G.jokers.config.card_limit+difference
        card.ability.immutable.joker_slots_current = card.ability.extra.joker_slots
    end
  end,
  abn_modify_blind_size = function (self,card,context)
    return context.amount*card.ability.blind_size_increase
  end,

  abn_artist_credits = {
    artist = "Pooper McFart",
  },
}
