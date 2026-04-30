SMODS.Joker {
  key = 'superhero',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 1, y = 2 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and ABN.is_number(context.other_card) then
      return {
        chips = context.other_card.base.nominal,
      }
    end
  end,
  abn_artist_credits = {
    artist = "iprefercheddar",
  },
}
