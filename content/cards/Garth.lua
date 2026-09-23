SMODS.Joker {
  key = "garth",

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
    local cae = card.ability.extra
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.score } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 18 },
  soul_pos = { x = 7, y = 18 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = {
    extra = {
      x_mult = 1.5,
      x_mult_gain = 0.04,
      score = 300
    }
  },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Arrow") then
      if next(SMODS.find_card("j_joker")) then
        context.other_card.ability.perma_score = (context.other_card.ability.perma_score or 0) + card.ability.extra
            .score
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
        })
      end
      return {
        x_mult = card.ability.extra.x_mult,
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
