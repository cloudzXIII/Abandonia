SMODS.Joker {
  key = 'escuderia_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.mult * ABN.count_unique_stickers() } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 1, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 10 } },

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = card.ability.extra.mult * ABN.count_unique_stickers()
      }
    end
  end,

  abn_artist_credits = {
    artist = "Tisisrealnow",
  },
  in_pool = function(self, args)
    for key, _ in pairs(SMODS.Sticker.obj_table or {}) do
      for _, joker in pairs(G.jokers.cards or {}) do
        if joker.ability and joker.ability[key] then
          return true
        end
      end
    end
    return false
  end
}
