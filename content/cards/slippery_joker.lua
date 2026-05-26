-- Slippery Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'slippery_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.dollars, cae.sell_value } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet5',
  pos = { x = 4, y = 5 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 3, sell_value = 1 } },
  calculate = function(self, card, context)
    if context.abn_weather_destroyed_but_not_triggered then
      return {
        dollars = card.ability.extra.dollars
      }
    end
    if (context.using_consumeable and context.consumeable.ability.set == "weather_report") or (context.post_trigger and context.other_card.ability.set == "weather_report") then
      if card.set_cost then
        card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell_value
        card:set_cost()
      end
      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
  end,
  abn_artist_credits = {
    artist = "BrownieBread",
  },
  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report and
        G.GAME.consumeable_usage_total.weather_report > 0
  end
}
