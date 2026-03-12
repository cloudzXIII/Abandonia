SMODS.Joker {
  key = 'gag_flower',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.type, 'poker_hands'),
        card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.chips_gain,
        card.ability.extra.mult_gain
      }
    }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 7, y = 10 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      type = "Four of a Kind",
      chips = 0,
      mult = 0,
      chips_gain = 100,
      mult_gain = 2
    },
  },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and next(context.poker_hands[card.ability.extra.type]) then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'chips',
        scalar_value = 'chips_gain',
        message_key = "a_chips"
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'mult',
        scalar_value = 'mult_gain',
        message_key = "a_mult"
      })
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "SmoliconBoi"
  },
}
