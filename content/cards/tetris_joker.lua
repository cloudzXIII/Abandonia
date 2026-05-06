SMODS.Joker {
  key = 'tetris_joker',
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,
  rarity = 3,
  atlas = 'ABNJokerSheet6',
  pos = { x = 1, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { xmult = 8 } },
  calculate = function(self, card, context)
    if context.joker_main then
      if #G.jokers.cards % 2 == 0 then
        return { xmult = card.ability.extra.xmult }
      end
    end
  end,
  abn_artist_credits = { artist = "IPreferCheddar", },
}
