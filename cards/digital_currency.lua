SMODS.Joker {
  key = 'digital_currency',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 3, y = 6 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) +
          card.ability.extra.dollars
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MONEY
      }
    end
  end,
  abn_artist_credits = {
    artist = "DankPastaMaster"
  },
}
