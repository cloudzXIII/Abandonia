SMODS.Joker {
  key = 'pankert',
  rarity = "abn_ParallelRare",
  atlas = 'AbandoniaParallel',
  pos = { x = 2, y = 0 },
  soul_pos = { x = 3, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { echips = 1.4 } },
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.echips, } }
  end,

  calculate = function(self, card, context)
    if context.joker_main and G.consumeables and #G.consumeables.cards >= 4 then
      return {
        echips = card.ability.extra.echips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Olsberg",
  },
}
