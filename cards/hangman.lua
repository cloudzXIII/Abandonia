SMODS.Joker {
  key = 'hangman',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 8, y = 3 },
  cost = 4,
  discovered = true,
  blueprint_compat = true,

  config = { extra = { chips = 0, chips_gain = 40 } },

  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      local face_cards = 0
      for _, removed_card in ipairs(context.removed) do
        if removed_card:is_face() then face_cards = face_cards + 1 end
      end
      if face_cards > 0 then
        SMODS.scale_card(self, {
          ref_table = card.ability,
          ref_value = 'chips',
          scalar_value = 'chips_gain',
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + face_cards * change
          end,
        })
        return { message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } } }
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "lolhappy909_lol"
  },
}
