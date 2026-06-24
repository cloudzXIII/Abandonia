-- Mitch Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'mitch_jester',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 15 },
  soul_pos = { x = 3, y = 15 },
  cost = 20,
  config = {
    extra = { d_size = 5 }
  },
  rarity = 4,
  blueprint_compat = true,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.d_size
      }
    }
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
    ease_discard(card.ability.extra.d_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
    ease_discard(-card.ability.extra.d_size)
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat, Vlambambo, Inky"
  },
}
