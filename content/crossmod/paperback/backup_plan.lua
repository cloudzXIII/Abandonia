SMODS.Joker {
  key = 'backup_plan',
  rarity = 3,
  atlas = 'ABNJokerSheet18',
  pos = { x = 6, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,


  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if context.scoring_hand and context.other_card == context.scoring_hand[1] then
        local other_scoring_count = #context.scoring_hand - 1

        if other_scoring_count > 0 then
          return {
            message = localize('k_again_ex'),
            repetitions = other_scoring_count,
            card = card
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Papermoon & B.b.b.b",
  },
}