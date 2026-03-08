SMODS.Joker {
  key = 'malicious_entity',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_gain } }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 5, y = 3 },
  cost = 6,
  discovered = true,
  blueprint_compat = true,

  config = { extra = { x_mult = 1, x_mult_gain = 0.5 } },

  calculate = function(self, card, context)
    if context.before then
      local leftmost = context.scoring_hand[1]
      if leftmost and G.GAME.current_round.hands_played == 0 then
        SMODS.destroy_cards(leftmost)
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
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Gappie",
  },
}
