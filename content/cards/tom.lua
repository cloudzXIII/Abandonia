SMODS.Joker {
  key = 'tom',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 4 },
  soul_pos = { x = 7, y = 4 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    -- target the rightmost card
    if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[#context.scoring_hand] then
      return {
        repetitions = G.GAME.current_round.hands_left
      }
    end
  end,

  abn_artist_credits = {
    artist = "Long Rooster",
  },
}
