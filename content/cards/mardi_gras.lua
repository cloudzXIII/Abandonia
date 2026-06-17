SMODS.Joker {
  key = 'mardi_gras',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.choice } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 8, y = 2 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },
  abn_artist_credits = {
    artist = "iprefercheddar"
  },
}
