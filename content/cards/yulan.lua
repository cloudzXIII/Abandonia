SMODS.Joker {
  key = 'yulan',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.x_chips, cae.x_chips_gain, cae.xmult } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 19 },
  soul_pos = { x = 1, y = 19 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_chips = 1.5, x_chips_gain = 0.04, xmult = 0.5 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Talon") then
      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
        })
      end

      local planet_rank = 0
      if context.scoring_name and G.GAME.hands[context.scoring_name] then
        planet_rank = G.GAME.hands[context.scoring_name].level or 0
      end

      return {
        x_chips = card.ability.extra.x_chips,
        x_mult = card.ability.extra.xmult * planet_rank,
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
      if playing:is_suit("abn_Talon") then
        return true
      end
    end
  end
}
