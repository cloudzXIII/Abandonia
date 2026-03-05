SMODS.Joker {
  key = 'melty_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 5, y = 0 },
  cost = 14,
  discovered = true,
  blueprint_compat = false,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.before and context.cardarea == G.play then
      local pos = ABN.get_pos(card, context.scoring_hand)
      if pos then
        local left = context.scoring_hand[pos - 1]
        if left then
          card.ability.change = left.base.nominal / 2
          SMODS.destroy_cards(left)
          SMODS.scale_card(card, {
            ref_table = card.ability,
            ref_value = "mult",
            scalar_value = "change",
            operation = '+',
          })
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "emmythegremlin",
  },
}
