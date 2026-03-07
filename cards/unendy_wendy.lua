SMODS.Joker {
  key = 'unendy_wendy',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.repetitions } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 4, y = 0 },
  cost = 9,
  discovered = true,
  blueprint_compat = false,

  config = { extra = { repetitions = 1 } },

  calculate = function(self, card, context)
    if context.debuff_card and context.debuff_card:is_face() then
      return { debuff = true }
    end
    if context.repetition and context.cardarea == G.play and not context.other_card:is_face() and not context.other_card:get_id() == 14 then
      return {
        repetitions = card.ability.extra.repetitions
      }
    end
  end,
  abn_artist_credits = {
    artist = "Firch",
  },
}
