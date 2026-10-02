SMODS.Joker {
  key = 'gavin',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.x_chips, cae.x_chips_gain, cae.chips, } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 18 },
  soul_pos = { x = 1, y = 18 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_chips = 1.5, x_chips_gain = 0.04, chips = 30 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Star") then
      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
        })
      end

      local star_count = 0
      for _, v in ipairs(context.scoring_hand) do
        if v:is_suit("abn_Star") then
          star_count = star_count + 1
        end
      end

      return {
        x_chips = card.ability.extra.x_chips,
        chips = card.ability.extra.chips * star_count,
        card = card,
      }
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly",
  },

  in_pool = function(self, args)
    for _, playing in ipairs(G.playing_cards or {}) do
      if playing:is_suit("abn_Star") then
        return true
      end
    end
  end
}
