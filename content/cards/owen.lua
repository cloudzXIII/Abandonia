SMODS.Joker{
  key = "owen",

  atlas = 'AbandoniaLegendary',
  pos = { x = 8, y = 18 },
  soul_pos = { x = 9, y = 18 },
  cost = 10,
  rarity = 4,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = {
    extra = {
      xchips = 1.5,
      gain = 0.04
    }
  },

  loc_vars = function(self, info_queue, card)
    local sell_value = 0

    if G.jokers then
      for _, joker in ipairs(G.jokers.cards) do
        sell_value = sell_value + (joker.sell_cost or 0)
      end
    end

    return {
      vars = {
        card.ability.extra.xchips,
        card.ability.extra.gain,
        sell_value
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card then
      if context.other_card.base.suit == "Arrow" or context.other_card.base.suit == "abn_Arrow" then
        card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.gain

        local sell_value = 0

        if G.jokers then
          for _, joker in ipairs(G.jokers.cards) do
            sell_value = sell_value + (joker.sell_cost or 0)
          end
        end

        return {
          x_chips = card.ability.extra.xchips,
          mult = sell_value,
          message = "ph - iris"
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Inky"
  }
}