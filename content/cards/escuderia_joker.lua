SMODS.Joker {
  key = 'escuderia_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult, 1 + (card.ability.extra.x_mult * ABN.count_stickers()) } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 1, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 1 } },

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        x_mult = 1 + (card.ability.extra.x_mult * ABN.count_stickers())
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
