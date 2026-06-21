-- Faruk Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'faruk_jester',

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
    return { vars = { cae.x_chips, cae.x_chips_gain, cae.mult_gain } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 8, y = 9 },
  soul_pos = { x = 9, y = 9 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_chips = 1, x_chips_gain = 0.04, mult_gain = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and context.other_card:is_suit("Spades") and not context.blueprint then
      if next(SMODS.find_card("j_joker")) then
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 1) +
            card.ability.extra.mult_gain * #G.hand.cards
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
    end
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
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
