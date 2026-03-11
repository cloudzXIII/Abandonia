SMODS.Joker {
  key = 'joe_kert',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
      }
    }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 9, y = 7 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 4 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card.config.center == G.P_CENTERS.c_base then
        return {
          mult = card.ability.extra.mult,
          card = card
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Pictoract",
  },
}
