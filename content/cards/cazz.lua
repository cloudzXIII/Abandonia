SMODS.Joker{
  key = "cazz",

  atlas = 'AbandoniaLegendary',
  pos = { x = 4, y = 18 },
  soul_pos = { x = 5, y = 18 },
  cost = 20,
  rarity = 4,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = {
    extra = {
      xmult = 1.5,
      gain = 0.04,
      asc = 0.1
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.gain,
        card.ability.extra.asc
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card then
      if context.other_card.base.suit == "Talon" or context.other_card.base.suit == "abn_Talon" then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain

        local asc = 0

        if context.scoring_name and G.GAME.hands[context.scoring_name] then
          asc = G.GAME.hands[context.scoring_name].level or 0
        end

        return {
          x_mult = card.ability.extra.xmult,
          asc = card.ability.extra.asc * asc,
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly"
  }
}