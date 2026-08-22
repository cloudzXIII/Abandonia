-- Rectangular Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'rectangular_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.asc, cae.asc_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet23',
  pos = { x = 6, y = 4 },
  pixel_size = { h = 71 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { asc = 0, asc_gain = 0.24 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint and #context.scoring_hand == 6 then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "asc",
        scalar_value = "asc_gain",
        operation = '+',
        message_colour = G.C.GOLD
      })
    end
    if context.joker_main then
      return {
        asc = card.ability.extra.asc
      }
    end
  end,

  in_pool = function(self, args)
    return G.GAME.abn_has_played_six_hand
  end,

  abn_artist_credits = {
    artist = "Inky",
  },
}
