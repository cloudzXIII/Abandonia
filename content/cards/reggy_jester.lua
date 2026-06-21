-- Reggy Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'reggy_jester',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.blind_req * 100 } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 4, y = 9 },
  soul_pos = { x = 5, y = 9 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1, x_mult_gain = 0.04, blind_req = 0.04 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("abn_Snow") then
      if next(SMODS.find_card("j_joker")) then
        SMODS.calculate_effect({ xblindsize = 1 - card.ability.extra.blind_req, }, context.other_card)
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
}
