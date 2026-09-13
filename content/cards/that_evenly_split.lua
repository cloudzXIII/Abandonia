SMODS.Joker {
  key = 'evenly_split',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.xmult } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet1',
  pos = { x = 3, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1.5, chips = 20 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_odd(context.other_card) then
        return {
          chips = card.ability.extra.chips
        }
      end
      if ABN.is_even(context.other_card) then
        return {
          x_mult = card.ability.extra.xmult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Inky"
  },
}
