SMODS.Joker {
  key = 'j_for_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 0, y = 6 },
  cost = 4,
  discovered = true,
  blueprint_compat = true,

  config = { extra = { x_mult = 4, } },

  calculate = function(self, card, context)
    if G.jokers and #G.jokers.cards >= G.jokers.config.card_limit and context.joker_main then
      return {
        xmult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Omega"
  },
  in_pool = function(self, args)
    return G.jokers and #G.jokers.cards == G.jokers.config.card_limit - 1
  end,
}
