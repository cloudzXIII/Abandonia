SMODS.Joker {
  key = 'fairytale_book',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 9, y = 4 },
  cost = 5,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
    },
  },
  add_to_deck = function(self, card, from_debuff)
    G.GAME.abn.legendary_pool.in_shop = true
    G.GAME.abn.legendary_pool.rate = G.GAME.abn.legendary_pool.rate - 0.04 -- 4%
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.abn.legendary_pool.in_shop = false
    G.GAME.abn.legendary_pool.rate = G.GAME.abn.legendary_pool.rate + 0.04 -- 4%
  end,
  abn_artist_credits = {
    artist = "Usual Boo"
  },
}
