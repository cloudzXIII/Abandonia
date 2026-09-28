SMODS.Joker {
  key = 'the_joker',
  rarity = "abn_ParallelRare",
  atlas = 'AbandoniaParallel',
  pos = { x = 6, y = 4 },
  soul_pos = { x = 7, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {extra = {percent = 10}},
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.percent } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      return { xblindsize = 1 - card.ability.extra.percent / 100 }
    end
  end,

  abn_artist_credits = {
    artist = "Tje.tsu"
  },
}
