SMODS.Joker {
  key = "owen",

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local sell_value = 0

    if G.jokers then
      for _, joker in ipairs(G.jokers.cards) do
        sell_value = sell_value + (joker.sell_cost or 0)
      end
    end

    return { vars = { cae.x_chips, cae.x_chips_gain, sell_value } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 8, y = 18 },
  soul_pos = { x = 9, y = 18 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = {
    extra = {
      x_chips = 1.5,
      x_chips_gain = 0.04,
    }
  },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Arrow") then
      local sell_value = 0

      if G.jokers then
        for _, joker in ipairs(G.jokers.cards) do
          sell_value = sell_value + (joker.sell_cost or 0)
        end
      end
      context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + sell_value
      SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)

      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
        })
      end
      return {
        x_chips = card.ability.extra.x_chips,
        card = card,
        colour = G.C.RED
      }
    end
  end,

  abn_artist_credits = {
    artist = "Inky"
  },

  in_pool = function(self, args)
    for _, playing in ipairs(G.playing_cards or {}) do
      if playing:is_suit("abn_Arrow") then
        return true
      end
    end
  end
}
