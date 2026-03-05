SMODS.Joker {
  key = 'superhero',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 2, y = 2 },
  cost = 5,
  discovered = true,
  blueprint_compat = true,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.other_card:is_face() then
      return {
        chips = context.other_card.base.nominal,
      }
    end
  end,
  abn_artist_credits = {
    artist = "iprefercheddar",
  },
}
