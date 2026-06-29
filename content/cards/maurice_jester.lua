-- Maurice Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'maurice_jester',

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
    return { vars = { cae.x_chips, cae.x_chips_gain, cae.xmult_gain } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 9 },
  soul_pos = { x = 7, y = 9 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_chips = 1.5, x_chips_gain = 0.04, xmult_gain = 0.1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
      if next(SMODS.find_card("j_joker")) then
        context.other_card.ability.perma_x_mult = (context.other_card.ability.perma_x_mult or 1) +
            card.ability.extra.xmult_gain
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
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
        colour = G.C.CHIPS
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
