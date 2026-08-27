SMODS.Joker {
  key = 'top_secret',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips
      }
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet4',
  pos = { x = 7, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,

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
