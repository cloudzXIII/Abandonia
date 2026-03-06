SMODS.Joker {
  key = 'square_rekoj',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod, card.ability.extra.x_mult, card.ability.extra.x_mult_mod } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 5, y = 2 },
  cost = 10,
  discovered = true,
  blueprint_compat = true,
  pixel_size = { h = 71 },

  config = { extra = { chips = 0, x_mult = 1, chip_mod = 20, x_mult_mod = 0.5 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint and #context.scoring_hand == 4 then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_mult",
        scalar_value = "x_mult_mod",
        operation = '+',
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chip_mod",
        operation = '+',
        no_message = true,
      })
    end
    if context.joker_main and card.ability.extra.x_mult > 1 then
      return {
        chips = card.ability.extra.chips,
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Wikypedia",
  },
}
