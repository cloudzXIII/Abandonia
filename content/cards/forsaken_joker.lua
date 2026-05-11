if ((SMODS.Mods["ortalab"] or {}).can_load) then

SMODS.Joker {
  key = 'forsaken_joker',
  rarity = 3,
  atlas = 'AbandoniaCrossmod',
  pos = { x = 0, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = { oddsb = 5, oddsp = 7 }
  },
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_ortalab_overexposed
    info_queue[#info_queue + 1] = G.P_CENTERS.e_ortalab_fluorescent
    
    -- Get localized numerator/denominator for both odds
    local num_b, den_b = SMODS.get_probability_vars(card, 1, card.ability.extra.oddsb)
    local num_p, den_p = SMODS.get_probability_vars(card, 1, card.ability.extra.oddsp)
    
    return {
      vars = { num_b, den_b, num_p, den_p }
    }
  end,
  
  in_pool = function(self)
    if not G.playing_cards then return false end
    for _, card in ipairs(G.playing_cards) do
      if card.config.center == G.P_CENTERS.m_ortalab_bent or
         card.config.center == G.P_CENTERS.m_ortalab_post then
          return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      
      -- Check for Bent Card (1 in 5)
      if target_card.config.center == G.P_CENTERS.m_ortalab_bent then
        if SMODS.pseudorandom_probability(card, 'forsaken_bent', 1, card.ability.extra.oddsb) then
          target_card:set_edition({ortalab_overexposed = true}, true)
        end
      end

      -- Check for Post Card (1 in 7)
      if target_card.config.center == G.P_CENTERS.m_ortalab_post then
        if SMODS.pseudorandom_probability(card, 'forsaken_post', 1, card.ability.extra.oddsp) then
          target_card:set_edition({ortalab_fluorescent = true}, true)
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Bunnet",
  },
}

end