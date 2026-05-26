-- Under Black Cloud (coded by cloudzXIII)
SMODS.Joker {
  key = 'underblackcloudz',

  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 0, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, chips_gain = 5, mult = 0, mult_gain = 2 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain, cae.chips, cae.chips_gain } }
  end,

  calculate = function(self, card, context)
    if context.retrigger_joker_check and context.other_card.ability.set == "weather_report" then
      return { repetitions = 1 }
    end

    if (context.using_consumeable and context.consumeable.ability.set == "weather_report") or (context.post_trigger and context.other_card.ability.set == "weather_report") then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = '+',
        no_message = true,
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
      })
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Grass",
  },
  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report and
        G.GAME.consumeable_usage_total.weather_report > 0
  end
}
