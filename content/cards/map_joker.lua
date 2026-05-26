-- Map Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'map_joker',

  rarity = 3,
  atlas = 'ABNJokerSheet7',
  pos = { x = 9, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 5, mult = 2, chips_gain = 5, mult_gain = 2 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.mult, cae.chips_gain, cae.mult_gain } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
      local continent_count = 0
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability.set == "continent" then
          continent_count = continent_count + 1
        end
      end
      if continent_count > 0 then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
            (card.ability.extra.chips * continent_count)
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
            (card.ability.extra.mult * continent_count)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
    end

    if context.using_consumeable and context.consumeable.ability.set == "continent" then
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
  end,
  abn_artist_credits = {
    artist = "IPreferCheddar ",
  },
  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.continent and
        G.GAME.consumeable_usage_total.continent > 0
  end
}
