-- Yorick Deluxe (coded by cloudzXIII)
SMODS.Joker {
  key = 'yorick_deluxe',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = G.P_CENTERS.j_abn_jorick
    return { vars = { cae.x_chips_gain, cae.discards, cae.discards_remaining, cae.x_chips, cae.mult_gain, cae.mult } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 16 },
  soul_pos = { x = 7, y = 16 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_chips = 1, x_chips_gain = 1, discards = 23, discards_remaining = 23, mult_gain = 1, mult = 0 } },

  calculate = function(self, card, context)
    if context.discard and not context.blueprint then
      if next(SMODS.find_card("j_abn_jorick")) then
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
            context.other_card.base.nominal
        SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
      end
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        message_colour = G.C.MULT,
      })
      if card.ability.extra.discards_remaining <= 1 then
        card.ability.extra.discards_remaining = card.ability.extra.discards
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
          message_colour = G.C.CHIPS,
          message_key = "a_xchips"
        })
      else
        card.ability.extra.discards_remaining = card.ability.extra.discards_remaining - 1
        return nil, true -- This is for Joker retrigger purposes
      end
    end
    if context.joker_main then
      return {
        x_chips = card.ability.extra.x_chips,
        mult = card.ability.extra.mult
      }
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Grummy",
  },
}
