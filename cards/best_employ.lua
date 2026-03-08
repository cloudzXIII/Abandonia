SMODS.Joker {
  key = 'best_employ',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.x_mult_gain
      }
    }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 8, y = 4 },
  cost = 6,
  discovered = true,
  blueprint_compat = true,

  config = {
    extra = {
      xmult = 1,
      x_mult_gain = 1
    },
  },

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        x_mult = card.ability.extra.xmult
      }
    end
    if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "xmult",
        scalar_value = "x_mult_gain",
        operation = '+',
      })
    end
  end,
  abn_artist_credits = {
    artist = "Dr.K.J.Schuester"
  },
}
