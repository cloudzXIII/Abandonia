SMODS.Joker {
  key = 'decollage_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet5',
  pos = { x = 7, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 1,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult
      },
    }
  end,

  calculate = function(self, card, context)
	--Scaling
    if context.individual and context.cardarea == G.play then
      if card.edition and card.edition.holo and context.other_card then
        local scoring_card = context.other_card
        scoring_card.ability.perma_mult = (scoring_card.ability.perma_mult or 0) + card.ability.extra.mult
        
        return {
          message = localize('k_upgrade_ex'),
		  colour = G.C.MULT,
          card = card
        }
      end
    end
    
    -- Xmult
    if context.joker_main then
      local unique_suits = {}
      local suit_count = 0
      
      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]

        for suit_key, _ in pairs(SMODS.Suits) do
          if scoring_card:is_suit(suit_key) and not unique_suits[suit_key] then
            unique_suits[suit_key] = true
            suit_count = suit_count + 1
          end
        end
      end
      
      if suit_count > 0 then
        return {
          Xmult = suit_count
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "SuperThing",
  },
}
