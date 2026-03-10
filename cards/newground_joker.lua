SMODS.Joker {
  key = 'newground_joker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
        card.ability.extra.mult_gain,
        card.ability.extra.chips_gain
      }
    }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 2, y = 5 },
  cost = 6,
  discovered = true,
  blueprint_compat = true,

  config = { extra = { mult = 0, chips = 0, mult_gain = 2, chips_gain = 20 } },

  calculate = function(self, card, context)
    if context.setting_blind then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
        no_message = true
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = '+',
      })
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
      }
    end
  end,
  abn_artist_credits = {
    artist = "TanTanich",
  },
}
