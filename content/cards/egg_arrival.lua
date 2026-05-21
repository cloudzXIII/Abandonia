-- Egg Arrival (coded by cloudzXIII)
SMODS.Joker {
  key = 'egg_arrival',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.sell_value, card.ability.extra.dollars } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet10',
  pos = { x = 1, y = 5 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { sell_value = 4, dollars = 20 } },
  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "weather_report" then
      for _, other_card in ipairs(G.jokers.cards) do
        if other_card.set_cost then
          other_card.ability.extra_value = (other_card.ability.extra_value or 0) +
              card.ability.extra.sell_value
          other_card:set_cost()
        end
      end
      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
    if context.retrigger_joker_check and context.other_card ~= card and context.other_card.sell_cost >= card.ability.extra.dollars then
      return { repetitions = 1 }
    end
  end,
  abn_artist_credits = {
    artist = "Grass",
  },
}
