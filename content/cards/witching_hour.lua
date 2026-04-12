SMODS.Joker {
  key = 'witching_hour',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_gain } }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 3, y = 20 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 1, x_mult_gain = 0.1 } },

  calculate = function(self, card, context)
    if context.stay_flipped and context.to_area == G.hand and ABN.is_dark(context.other_card) then
      return {
        stay_flipped = true
      }
    end
    if context.hand_drawn then
      for i = 1, #context.hand_drawn do
        if context.hand_drawn[i].facing == "back" then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "x_mult",
            scalar_value = "x_mult_gain",
            operation = '+',
            message_key = 'a_xmult'
          })
        end
      end
    end
    if context.joker_main then
      if card.ability.extra.x_mult >= 1 then
        return {
          x_mult = card.ability.extra.x_mult,
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Eggymari"
  },
}
