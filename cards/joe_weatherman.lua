SMODS.Joker {
  key = 'joe_weatherman',

  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
      'abn_weatherman')
    return { vars = { numerator, denominator } }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 4, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { base = 1, odds = 8 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and ABN.is_number(context.other_card) and SMODS.pseudorandom_probability(card, 'weatherman', card.ability.extra.base, card.ability.extra.odds, "abn_weatherman") then
      if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.add_card {
              set = 'Tarot',
              key_append = 'abn_joe_weatherman'
            }
            G.GAME.consumeable_buffer = 0
            return true
          end
        }))
        SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
          context.other_card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "AmaibleYak",
  },
}
