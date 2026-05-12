-- Will (coded by cloudzXIII)
SMODS.Joker {
  key = 'will',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 2 },
  soul_pos = { x = 7, y = 2 },
  cost = 20,
  config = {
    extra = { x_chips = 1, x_chips_gain = 0.1 }
  },
  rarity = 4,
  blueprint_compat = true,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_chips,
        card.ability.extra.x_chips_gain
      }
    }
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_odd(context.other_card) then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
          message_colour = G.C.CHIPS,
        })
      end
    end
    if context.joker_main then
      return {
        x_chips = card.ability.extra.x_chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Long Rooster"
  },
}
