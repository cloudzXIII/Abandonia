SMODS.Joker {
  key = 'blackmore_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet4',
  pos = { x = 0, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  set_ability = function(self, card, initial)
    card:add_sticker("abn_fragile", true)
  end,

  calculate = function(self, card, context)
    -- 'context.individual' triggers for each card in the scoring hand one by one
    if context.individual and context.cardarea == G.play then
      -- We check if the card currently being scored is the first one in the hand
      if context.scoring_hand[1] == context.other_card then
        return {
          x_mult = context.other_card.base.nominal,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}
