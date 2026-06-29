SMODS.Joker {
  key = 'insomniac_joker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.chips_gain
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 8, y = 4 },
  cost = 3,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, chips_gain = 8 } },

  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = '+',
        no_message = true
      })
      return {
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
      }
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Alex",
  },
}
