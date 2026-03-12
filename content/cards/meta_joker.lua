SMODS.Joker {
  key = 'meta_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult, 1 + (card.ability.extra.x_mult * ABN.count_rarities()) } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 6, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 0.25 } },

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        x_mult = 1 + (card.ability.extra.x_mult * ABN.count_rarities())
      }
    end
  end,
  abn_artist_credits = {
    artist = "Weasel.13"
  },
}
