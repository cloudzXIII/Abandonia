SMODS.Joker {
  key = 'dual_identity',
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, } }
  end,
  rarity = 2,
  atlas = 'ABNJokerSheet6',
  pos = { x = 5, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  config = { extra = { xmult = 4 } },
  calculate = function(self, card, context)
    if context.joker_main then
      local counts = {}
      for _, j in ipairs(G.jokers.cards) do
        local r = j.config.center.rarity
        counts[r] = (counts[r] or 0) + 1
      end
      local even_rarities = 0
      for _, count in pairs(counts) do
        if count % 2 == 0 then
          even_rarities = even_rarities + 1
        end
      end
      if even_rarities >= 2 then
        return { xmult = card.ability.extra.xmult }
      end
    end
  end,
  abn_artist_credits = { artist = "b.b.b.b.", },
}
