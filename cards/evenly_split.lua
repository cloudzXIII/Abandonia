SMODS.Joker {
  key = 'evenly_split',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.x_mult } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 3, y = 0 },
  cost = 8,
  discovered = true,
  blueprint_compat = true,

  config = { extra = { x_mult = 1.5, chips = 20 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_odd(context.other_card) then
        return {
          chips = card.ability.extra.chips
        }
      end
      if ABN.is_even(context.other_card) then
        return {
          x_mult = card.ability.extra.x_mult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "christopherjacobsanderson"
  },
}
