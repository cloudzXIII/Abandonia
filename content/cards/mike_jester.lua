-- Mike Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'mike_jester',

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
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.percent * 100 } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 10 },
  soul_pos = { x = 1, y = 10 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1, x_mult_gain = 0.04, percent = 0.04 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Tie") then
      if next(SMODS.find_card("j_joker")) then
        ABN.balance_percent(context.other_card, card.ability.extra.percent)
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

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Inky & Vlambambo",
  },
  in_pool = function(self, args)
    for _, playing in ipairs(G.playing_cards or {}) do
      if playing:is_suit("abn_Penumbra") then
        return true
      end
    end
  end
}
