SMODS.Joker {
  key = 'travis',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local hand_count = G.hand and G.hand.cards and #G.hand.cards or 0
    local cae = card.ability.extra
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.mult, cae.mult * hand_count } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 18 },
  soul_pos = { x = 3, y = 18 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1.5, x_mult_gain = 0.04, mult = 10 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Star") then
      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
        })
      end

      local hand_count = G.hand and G.hand.cards and #G.hand.cards or 0

      return {
        x_mult = card.ability.extra.x_mult,
        mult = card.ability.extra.mult * hand_count,
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
