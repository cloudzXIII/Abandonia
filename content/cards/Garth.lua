SMODS.Joker{
  key = "Garth",

  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 18 },
  soul_pos = { x = 7, y = 18 },
  cost = 20,
  rarity = 4,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = {
    extra = {
      xmult = 1.5,
      gain = 0.04,
      score = 300
    }
  },


  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.gain,
        card.ability.extra.score
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card then
      if context.other_card.base.suit == "Arrow" or context.other_card.base.suit == "abn_Arrow" then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

        return {
          x_mult = card.ability.extra.xmult,
          chip_mod = card.ability.extra.score,
          message = "placeholder - iris!"
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Inky"
  }
}