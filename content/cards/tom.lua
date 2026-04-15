SMODS.Joker {
  key = 'tom',
  rarity = 4,
  atlas = 'AbandoniaJokers',
  pos = { x = 3, y = 34 },
  soul_pos = { x = 4, y = 34 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

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