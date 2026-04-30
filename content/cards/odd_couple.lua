SMODS.Joker {
  key = 'odd_couple',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet2',
  pos = { x = 4, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.other_card:is_face() then
      return {
        mult = context.other_card.base.nominal,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Julisnivy",
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card:is_face() then
        return false
      end
    end
    return true
  end
}
