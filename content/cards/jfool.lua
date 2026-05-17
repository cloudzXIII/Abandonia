SMODS.Joker {
  key = 'jfool',
  rarity = "abn_ParallelRare",
  atlas = 'AbandoniaParallel',
  pos = { x = 6, y = 6 },
  soul_pos = { x = 7, y = 6 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      
      -- Count evens and odds in the scoring hand
      local even_count = 0
      local odd_count = 0
      for _, scoring_card in ipairs(context.scoring_hand) do
        if ABN.is_even(scoring_card) then
          even_count = even_count + 1
        elseif ABN.is_odd(scoring_card) then
          odd_count = odd_count + 1
        end
      end

      -- even cards
      if ABN.is_even(target_card) and even_count > 1 then
        return {
          x_mult = even_count,
          card = card
        }
      end

      -- odd cards
      if ABN.is_odd(target_card) and odd_count > 1 then
        return {
          x_mult = odd_count,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Bunnet",
  },
}