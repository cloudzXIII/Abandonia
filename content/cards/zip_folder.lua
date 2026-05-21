-- Zip Folder (coded by cloudzXIII)
SMODS.Joker {
  key = 'zip_folder',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 0, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  config = { extra = { chips = 0, chips_gain = 10, slots = 0 } },

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
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
  add_to_deck = function(self, card, from_debuff)
    card.ability.extra.slots = G.consumeables.config.card_limit
    G.consumeables:change_size(card.ability.extra.slots)
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.consumeables:change_size(-card.ability.extra.slots)
  end,

  abn_artist_credits = {
    artist = "Gan",
  },
}
