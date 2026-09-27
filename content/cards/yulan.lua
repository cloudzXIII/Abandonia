SMODS.Joker{
  key = "yulan",

  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 19 },
  soul_pos = { x = 1, y = 19 },
  cost = 20,
  rarity = 4,

  config = {
    extra = {
      xchips = 1.5,
      gain = 0.04,
      xmult = 0.50
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips,
        card.ability.extra.gain,
        card.ability.extra.xmult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card then
      if context.other_card.base.suit == "Talon" or context.other_card.base.suit == "abn_Talon" then
        card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.gain

        local planet_rank = 0

        if context.scoring_name and G.GAME.hands[context.scoring_name] then
          planet_rank = G.GAME.hands[context.scoring_name].level or 0
        end

        return {
          x_chips = card.ability.extra.xchips,
          x_mult = card.ability.extra.xmult * planet_rank,
          message = "Yulan!"
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly"
  }
}