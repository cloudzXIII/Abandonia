SMODS.Joker {
  key = 'contagion_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.GREEN, G.C.WHITE, 1.0)
  end,

  rarity = "abn_VirusRare",
  atlas = 'ABNJokerSheet12',
  pos = { x = 1, y = 1 },
  soul_pos = { x = 2, y = 1 },
  cost = 25,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { oddscs = 6, oddscb = 3, oddscm = 10, emult = 1.5} },
  pools = { ["Plagued"] = true, },
  
  loc_vars = function(self, info_queue, card)
    -- odds
    local num_cs, denom_cs = SMODS.get_probability_vars(card, 1, card.ability.extra.oddscs, 'contagion_joker')
    local num_cb, denom_cb = SMODS.get_probability_vars(card, 1, card.ability.extra.oddscb, 'contagion_joker')
    local num_cm, denom_cm = SMODS.get_probability_vars(card, 1, card.ability.extra.oddscm, 'contagion_joker')

    return { 
      vars = { 
        num_cs, denom_cs,
        num_cb, denom_cb,
        num_cm, denom_cm,
		card.ability.extra.emult
      } 
    }
  end,
  
  -- only availible on jimbo stakes
  in_pool = function(self)
	return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
	
	if context.other_joker and context.other_joker ~= card and context.other_joker.config.center.pools and context.other_joker.config.center.pools.Plagued then
        return {
            e_mult = card.ability.extra.emult,
			card = card
		}
    end
	
	if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      if target_card.seal then
		if SMODS.pseudorandom_probability(card, 'virus', 1, card.ability.extra.oddscs) then
			target_card:set_ability(G.P_CENTERS.m_abn_contagion_seal)
		end
	  end
	  
	  if target_card.config.center ~= G.P_CENTERS.c_base and target_card.config.center ~= G.P_CENTERS.m_abn_contagion_bonus and target_card.config.center ~= G.P_CENTERS.m_abn_contagion_mult and target_card.config.center ~= G.P_CENTERS.m_abn_contagion_seal then
		if SMODS.pseudorandom_probability(card, 'virus', 1, card.ability.extra.oddscb) then
			target_card:set_ability(G.P_CENTERS.m_abn_contagion_bonus)
		end
	  end
	  
	  if target_card.edition then
		if SMODS.pseudorandom_probability(card, 'virus', 1, card.ability.extra.oddscm) then
			target_card:set_ability(G.P_CENTERS.m_abn_contagion_mult)
		end
	  end
    end
  end,
  abn_artist_credits = {
    artist = "thebaggutegamer",
  },
}
