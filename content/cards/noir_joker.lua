SMODS.Joker {
  key = 'noir_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet9',
  pos = { x = 1, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = { mult = 0, chips = 0, multadd = 3, chipsadd = 10 }
  },
  
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.multadd, card.ability.extra.chipsadd } }
  end, 
  
  in_pool = function(self)
    if not G.playing_cards then return false end
    for _, card in ipairs(G.playing_cards) do
      if card.ability.abn_perma_flipped == true then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
	
      local target_card = context.other_card
      
      if ABN.is_light(target_card) then
        -- Flip all dark cards in hand
        for _, hand_card in ipairs(G.hand.cards) do
          if ABN.is_dark(hand_card) then
			if hand_card.facing == 'front' then
				hand_card:flip()
			end
            hand_card.ability.abn_perma_flipped = true
          end
        end
      end
	  
	  -- Check for flipped cards
      if target_card.ability.abn_perma_flipped == true then
		card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
          
        return {
			message = localize('k_upgrade_ex'),
            colour = G.C.ATTENTION,
            card = card
        }
	  end
	  
    end

    -- Scoring
    if context.joker_main then
      if card.ability.extra.mult > 0 or card.ability.extra.chips > 0 then
        return {
          mult = card.ability.extra.mult,
          chips = card.ability.extra.chips,
          message = localize { type = 'quip', key = 'a_chips' } -- Optional: adds a flavor message
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "weasel.922",
  },
}