SMODS.Joker {
  key = 'totally_naked',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips
      }
    }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 8, y = 14 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 6, chips = 20 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card.config.center == G.P_CENTERS.c_base then
        return {
          mult = card.ability.extra.mult,
          chips = card.ability.extra.chips,
          card = card
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "TinningMan",
  },
}
