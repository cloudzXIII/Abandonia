SMODS.Joker{
  key = "travis",

  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 18 },
  soul_pos = { x = 3, y = 18 },
  cost = 20,
  rarity = 4,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = {
    extra = {
      xmult = 1.5,
      gain = 0.04,
      mult = 10
    }
  },

  loc_vars = function(self, info_queue, card)
    local hand_count = G.hand and G.hand.cards and #G.hand.cards or 0

    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.gain,
        card.ability.extra.mult * hand_count
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card then
      if context.other_card.base.suit == "Star" or context.other_card.base.suit == "abn_Star" then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

        local hand_count = G.hand and G.hand.cards and #G.hand.cards or 0
        local mult = card.ability.extra.mult * hand_count

        return {
          x_mult = card.ability.extra.xmult,
          mult = mult,
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly"
  }
}