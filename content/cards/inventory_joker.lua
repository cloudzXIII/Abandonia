-- Inventory Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'inventory_joker',

  rarity = 1,
  atlas = 'ABNJokerSheet13',
  pos = { x = 4, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { chips = 0, chips_gain = 10 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain }, }
  end,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint and #G.consumeables.cards > 0 then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        message_key = "a_chips",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + #G.consumeables.cards * change
        end,
      })
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Crazy Dave",
  },
}
