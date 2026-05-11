SMODS.Joker {
  key = 'hazard_cryptid',
  rarity = 1,
  atlas = 'ABNJokerSheet8',
  pos = { x = 3, y = 2 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = { odds = 6, mult = 0, multadd = 4 }
  },
  
  loc_vars = function(self, info_queue, card)
    -- Get localized numerator/denominator for odds
    local num_b, den_b = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
    
    return {
      vars = { num_b, den_b, card.ability.extra.mult, card.ability.extra.multadd }
    }
  end,
  
  in_pool = function(self)
    if not G.playing_cards then return false end
    for _, card in ipairs(G.playing_cards) do
      if card.config.center == G.P_CENTERS.m_abn_hazard then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
	
	-- Destruction
	if context.destroy_card and context.cardarea == G.play then
		if SMODS.pseudorandom_probability(card, 'abn_attack_777', 1, card.ability.extra.odds) then
			card:start_dissolve()
			return {remove = true}
	    else
			return {
				message = localize('k_safe_ex')
			}
		end
    end
	
    -- Scaling logic
    if context.joker_main == nil and context.before and not context.blueprint then
      local has_hazard = false
      local has_base = false
      
      -- Check the scoring hand for both required card types
      for i = 1, #context.scoring_hand do
        local card_center = context.scoring_hand[i].config.center
        if card_center == G.P_CENTERS.m_abn_hazard then
          has_hazard = true
        elseif card_center == G.P_CENTERS.c_base then
          has_base = true
        end

        if has_hazard and has_base then break end
      end

      -- Only upgrade if the hand contains at least one Hazard AND one Base card
      if has_hazard and has_base then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd 
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end
    
    -- Scoring
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Flote",
  },
}