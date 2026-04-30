SMODS.Joker {
  key = 'pankert',

  loc_vars = function(self, info_queue, card)
    local val = G.consumeables and (1 + (card.ability.extra.xmult * #G.consumeables.cards)) or 1
    return { vars = { card.ability.extra.xmult, val } }
  end,

  rarity = "abn_ParallelRare",
  atlas = 'AbandoniaParallel',
  pos = { x = 2, y = 0 },
  soul_pos = { x = 3, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1.5 } },

  calculate = function(self, card, context)
    if context.joker_main and G.consumeables and #G.consumeables.cards > 0 then
      return {
        xmult = 1 + (card.ability.extra.xmult * #G.consumeables.cards)
      }
    end
  end,
  abn_artist_credits = {
    artist = "Olsberg",
  },
}
