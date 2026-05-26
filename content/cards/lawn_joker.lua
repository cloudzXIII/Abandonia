-- Lawn Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'lawn_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.chips_gain, cae.mult, cae.mult_gain, cae.spade_chips, cae.spade_mult } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet2',
  pos = { x = 8, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, chips_gain = 5, mult = 0, mult_gain = 2, spade_chips = 5, spade_mult = 2 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
      local continent_count = 0
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability.set == "continent" then
          continent_count = continent_count + 1
        end
      end
      if continent_count > 0 then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
            (card.ability.extra.spade_chips * continent_count)
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
            (card.ability.extra.spade_mult * continent_count)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
    end

    if context.using_consumeable and context.consumeable.ability.set == "weather_report" then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = '+',
        no_message = true
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
    artist = "Vlambambo",
  },
  in_pool = function(self)
    local has_continent = G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.continent and
        G.GAME.consumeable_usage_total.continent > 0
    local has_weather = G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report and
        G.GAME.consumeable_usage_total.weather_report > 0
    return has_continent or has_weather
  end
}
