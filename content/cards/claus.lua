SMODS.Joker {
  key = 'claus',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 3 },
  soul_pos = { x = 7, y = 3 },
  cost = 20,
  rarity = 4,
  blueprint_compat = true,
  unlocked = false,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
      return {
        repetitions = G.GAME.current_round.hands_left
      }
    end
  end,

  abn_artist_credits = {
    artist = "Long Rooster",
  },
}
