-- Explorer Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'explorer_joker',

  rarity = 3,
  atlas = 'ABNJokerSheet1',
  pos = { x = 4, y = 5 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { diamond_chips = 5, diamond_mult = 2, mult = 0, chips = 0, chips_gain = 20, mult_gain = 4, sell_value = 5 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.chips_gain, cae.mult, cae.mult_gain, cae.sell_value, cae.diamond_chips, cae.diamond_mult } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
      local continent_count = 0
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability.set == "continent" then
          continent_count = continent_count + 1
        end
      end
      if continent_count > 0 then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
            (card.ability.extra.diamond_chips * continent_count)
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
            (card.ability.extra.diamond_mult * continent_count)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
    end

    if context.selling_card and context.card.ability.set == "continent" then
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
    artist = "Vlambambo",
  },
  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.continent and
        G.GAME.consumeable_usage_total.continent > 0
  end
}

-- check continents.lua ~line 15 for the hook i used to change the continent card sell value
