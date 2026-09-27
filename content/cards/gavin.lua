SMODS.Joker{
  key = "gavin",

  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 18 },
  soul_pos = { x = 1, y = 18 },
  cost = 20,
  rarity = 4,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = {
    extra = {
      xchips = 1.50,
      gain = 0.04,
      chips = 30
    }
  },


  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips,
        card.ability.extra.gain,
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card then
      if context.other_card.base.suit == "Star" or context.other_card.base.suit == "abn_Star" then
        card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.gain

        return {
          x_chips = card.ability.extra.xchips,
          chips = card.ability.extra.chips,
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly"
  }
}