SMODS.Joker {
  key = 'annihilated_joker',

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 9, y = 0 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  config = { extra = {
    immutable = {
      jokers_destroyed = 0,
      jokers_needed = 3,
    },
  } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.immutable.jokers_needed,
        card.ability.extra.immutable.jokers_destroyed
      }
    }
  end,


  calculate = function(self, card, context)
    if context.abn_card_destroyed and not context.blueprint then
      card.ability.extra.immutable.jokers_destroyed = card.ability.extra.immutable.jokers_destroyed + 1
      if card.ability.extra.immutable.jokers_destroyed >= card.ability.extra.immutable.jokers_needed then
        card.ability.extra.immutable.jokers_destroyed = 0
        if #G.consumeables.cards < G.consumeables.config.card_limit then
          local created_card = SMODS.create_card {
            set = "calamity_cards",
          }
          G.consumeables:emplace(created_card)
          return {
            message = "+1",
            colour = G.C.CALAMITY,
          }
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "HyperReal63",
  },
}
