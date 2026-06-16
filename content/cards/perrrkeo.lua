SMODS.Joker {
  key = 'perrrkeo',
  loc_vars = function(self, info_queue, card)
    local current_percent = G.consumeables and
        (card.ability.extra.balance + (card.ability.extra.balance_gain * #G.consumeables.cards)) or 0
    return { vars = { card.ability.extra.balance, card.ability.extra.balance_gain, current_percent } }
  end,

  rarity = "abn_ParallelRare",
  atlas = 'AbandoniaParallel',
  pos = { x = 4, y = 2 },
  soul_pos = { x = 5, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { balance = 50, balance_gain = 10 } },

  calculate = function(self, card, context)
    if context.final_scoring_step then
      local percent = (card.ability.extra.balance + (card.ability.extra.balance_gain * #G.consumeables.cards))
      return {
        abn_balance_percent = percent
      }
    end
  end,

  abn_artist_credits = {
    artist = "Bunnet and floweringashes",
  },
}
