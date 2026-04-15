SMODS.Joker {
  key = 'claus',
  rarity = 4,
  atlas = 'AbandoniaJokers',
  pos = { x = 7, y = 33 },
  soul_pos = { x = 8, y = 33 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
        return {
			repetitions = G.GAME.current_round.discards_left
        }
    end
  end,

  abn_artist_credits = {
    artist = "Long Rooster",
  },
}