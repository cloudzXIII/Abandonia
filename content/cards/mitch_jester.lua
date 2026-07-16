-- Mitch Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'mitch_jester',

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
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.rep_gain } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 15 },
  soul_pos = { x = 1, y = 15 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1.5, x_mult_gain = 0.04, rep_gain = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Tie") then
      if next(SMODS.find_card("j_joker")) then
        local count = #G.consumeables.cards or 0
        context.other_card.ability.perma_repetitions = (context.other_card.ability.perma_repetitions or 0) +
            (card.ability.extra.rep_gain * count)
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
    artist = "Da Gorbage Rat, Vlambambo, Inky"
  },
  in_pool = function(self, args)
    for _, playing in ipairs(G.playing_cards or {}) do
      if playing:is_suit("abn_Tie") then
        return true
      end
    end
  end
}
