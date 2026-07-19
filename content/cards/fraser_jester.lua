-- Fraser Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'fraser_jester',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  atlas = 'AbandoniaLegendary',
  pos = { x = 8, y = 14 },
  soul_pos = { x = 9, y = 14 },
  cost = 20,
  config = {
    extra = { h_size = 5 }
  },
  rarity = 4,
  blueprint_compat = true,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.h_size
      }
    }
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
    G.hand:change_size(card.ability.extra.h_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.h_size)
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat, Vlambambo, Notmario"
  },
}
