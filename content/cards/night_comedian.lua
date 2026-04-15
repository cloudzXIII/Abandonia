SMODS.Joker {
  key = 'night_comedian',
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.xmult,
        card.ability.extra.xmultadd,
		card.ability.extra.chipsadd,
		card.ability.extra.cardchips,
		card.ability.extra.cardmult,
      }
    }
  end,

  rarity = "abn_SuperRare",
  atlas = 'AbandoniaJokers',
  pos = { x = 9, y = 16 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { 
    extra = { 
      chips = 0, 
      xmult = 1,
	  chipsadd = 100,
      xmultadd = 0.1,
	  cardchips = 10,
	  cardmult = 4,
    } 
  },
  
  in_pool = function(self, args)
    if G.STATE == G.STATES.SHOP then return false end
  end,

  calculate = function(self, card, context)
    -- Scaling logic: Triggers for every card in the hand
    if context.individual and context.cardarea == G.play then
      local other_card = context.other_card
      local triggered = false

      -- If card is Enhanced
      if other_card.config.center ~= G.P_CENTERS.c_base then
		-- Count how many cards in the scoring hand have THIS specific enhancement
		local matching_enhancements = 0
		for i = 1, #context.scoring_hand do
			if context.scoring_hand[i].config.center == other_card.config.center then
			matching_enhancements = matching_enhancements + 1
			end
		end

		--Scale the upgrade by the number of matching cards found
		local total_chips_gain = card.ability.extra.cardchips * matching_enhancements
		local total_mult_gain = card.ability.extra.cardmult * matching_enhancements
      
		-- Upgrade the Joker's value
		card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
      
		-- Upgrade the scoring card
		other_card.ability.perma_bonus = (other_card.ability.perma_bonus or 0) + total_chips_gain
		other_card.ability.perma_mult = (other_card.ability.perma_mult or 0) + total_mult_gain
      end

      -- If card has an Edition
      if other_card.edition then
        local matching_editions = 0
        -- Look through scoring hand for cards with the SAME edition type (e.g., 'foil', 'holo', 'polychrome')
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i].edition and context.scoring_hand[i].edition.type == other_card.edition.type then
            matching_editions = matching_editions + 1
          end
        end
		
		local total_chips_gain = card.ability.extra.cardmult * matching_editions
		local total_mult_gain = card.ability.extra.cardchips * matching_editions
		
		other_card.ability.perma_bonus = (other_card.ability.perma_bonus or 0) + total_chips_gain
		other_card.ability.perma_mult = (other_card.ability.perma_mult or 0) + total_mult_gain
		
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
      end
    end

    -- Scoring logic: Apply all accumulated stats
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
		chips = card.ability.extra.chips,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Olsberg & Luigicat11",
  },
}