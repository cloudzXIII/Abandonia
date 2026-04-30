SMODS.Joker {
  key = 'haunted_recording',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_gain, localize(card.ability.extra.poker_hand, 'poker_hands') } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet2',
  pos = { x = 1, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { poker_hand = "High Card", x_mult = 1, x_mult_gain = 0.5 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      if context.scoring_name == card.ability.extra.poker_hand then
        if card.ability.extra.x_mult > 1 then
          card.ability.extra.x_mult = 1
          return {
            message = localize('k_reset')
          }
        end
      else
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          operation = '+',
        })
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Strawberry_cereal"
  },
}
