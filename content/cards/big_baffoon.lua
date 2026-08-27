-- Big Baffoon (coded by cloudzXIII)
SMODS.Joker {
  key = 'big_baffoon',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return {
      vars = {
        cae.chips,
        cae.chips_gain
      },
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet20',
  pos = { x = 7, y = 0 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      chips = 0,
      chips_gain = 50
    }
  },
  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.current_round.hands_left == 0 then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = '+',
        message_colour = G.C.CHIPS
      })
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Hehey",
  },

}
