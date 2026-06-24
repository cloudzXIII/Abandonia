-- Mikhail Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'mikhail_jester',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  atlas = 'AbandoniaLegendary',
  pos = { x = 4, y = 15 },
  soul_pos = { x = 5, y = 15 },
  cost = 20,
  config = {
    extra = { hands = 5 }
  },
  rarity = 4,
  blueprint_compat = true,
  unlocked = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.hands
      }
    }
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    ease_hands_played(card.ability.extra.hands)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    ease_hands_played(-card.ability.extra.hands)
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat, Vlambambo, Inky"
  },
}
