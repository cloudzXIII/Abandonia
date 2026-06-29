SMODS.Joker {
  key = 'fanart_joker',
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,
  rarity = 3,
  atlas = 'ABNJokerSheet6',
  pos = { x = 2, y = 3 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { xmult = 3 } },
  calculate = function(self, card, context)
    if context.joker_main then
      if #G.jokers.cards % 2 == 1 then
        return { xmult = card.ability.extra.xmult }
      end
    end
  end,
  abn_artist_credits = { artist = "Sustato" },
}
