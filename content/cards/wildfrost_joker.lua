-- Wildfrost Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'wildfrost_joker',

  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 6, y = 4 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 0,
      chips = 0,
      mult_gain = 10,
      chips_gain = 3,
      type = "Three of a Kind"
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return {
      vars = {
        cae.mult, cae.chips, cae.mult_gain, cae.chips_gain, cae.type
      },
    }
  end,

  calculate = function(self, card, context)
    if context.before and context.scoring_name == card.ability.extra.type then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        message_colour = G.C.MULT,
      })
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("abn_Snow") then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          message_colour = G.C.CHIPS,
        })
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Grassy",
  },
}
