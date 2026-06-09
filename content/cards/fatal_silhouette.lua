SMODS.Joker {
  key = 'fatal_silhouette',
  rarity = 1,
  atlas = 'ABNJokerSheet5',
  pos = { x = 7, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true, 
  config = { extra = { xchips = 2 } },
  
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    return { vars = { card.ability.extra.xchips } }
  end,

  calculate = function(self, card, context)
    -- Check individual cards in the played hand during scoring
    if context.individual and context.cardarea == G.play then
      
      -- Verify if the current card is Light and has the Silver seal using your helper functions
      if ABN.is_light(context.other_card) and context.other_card.seal == 'abn_silver' then
        local is_first_matching_card = false
        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          if ABN.is_light(scoring_card) and scoring_card.seal == 'abn_silver' then
            is_first_matching_card = (scoring_card == context.other_card)
            break
          end
        end
        
        if is_first_matching_card then
          return {
            xchips = card.ability.extra.xchips,
            card = card
          }
        end
      end
    end
  end,
  
  abn_artist_credits = {
    artist = "Sustato",
  },
}