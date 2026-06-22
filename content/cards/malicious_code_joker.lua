SMODS.Joker {
  key = 'malicious_code_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet12',
  pos = { x = 8, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { odds = 15 } },
  pools = { ["Plagued"] = true },
  
  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.BLACK, G.C.WHITE, 1.0)
  end,
  
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_contagion_bonus
	info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_contagion_mult
    return { 
      vars = { 
        G.GAME and G.GAME.probabilities.normal or 1, 
        card.ability.extra.odds 
      } 
    }
  end,
  
  -- Only available on Jimbo Stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before then

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]
        
        if scoring_card.config.center and scoring_card.config.center ~= G.P_CENTERS.c_base then
          local current_key = scoring_card.config.center.key
          local target_enhancement = nil

          if current_key == 'm_mult' and pseudorandom('malicious_mult') < G.GAME.probabilities.normal / card.ability.extra.odds then
            target_enhancement = 'm_abn_contagion_mult'
          
          elseif current_key == 'm_bonus' and pseudorandom('malicious_bonus') < G.GAME.probabilities.normal / card.ability.extra.odds then
            target_enhancement = 'm_abn_contagion_bonus'
          end

          if target_enhancement and G.P_CENTERS[target_enhancement] then
            scoring_card:set_ability(G.P_CENTERS[target_enhancement])
            
            card_eval_status_text(scoring_card, 'extra', nil, nil, nil, {
              message = localize('k_upgrade_ex'),
              colour = G.C.SECONDARY_SET.Tarot
            })
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly",
  },
}