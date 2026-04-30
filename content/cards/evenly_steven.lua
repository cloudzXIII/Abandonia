SMODS.Joker {
  key = 'evenly_steven',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 2, y = 0 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 10 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_even(context.other_card) then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0)
            + card.ability.extra.chips
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "b.b.b.b."
  },
}
