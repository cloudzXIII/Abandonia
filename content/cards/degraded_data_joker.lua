SMODS.Joker {
  key = 'degraded_data_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.GREEN, G.C.WHITE, 1.0)
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 5, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, xmult = 1, emult = 1, multadd = 10, xmultadd = 0.1, emultadd = 0.01} },
  pools = { ["Plagued"] = true, },
  
  loc_vars = function(self, info_queue, card)
    return { 
      vars = { 
		card.ability.extra.mult,
		card.ability.extra.xmult,
		card.ability.extra.emult,
		card.ability.extra.multadd,
		card.ability.extra.xmultadd,
		card.ability.extra.emultadd,
      } 
    }
  end,
  
  -- only availible on jimbo stakes
  in_pool = function(self)
	return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
	
	if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
	  
	  if target_card.config.center == G.P_CENTERS.m_abn_contagion_bonus then
		card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
		return {
			message = localize('k_upgrade_ex'),
			colour = G.C.MULT
		}
	  end
	  
	  if target_card.config.center == G.P_CENTERS.m_abn_contagion_mult then
		card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.emultadd
		return {
			message = localize('k_upgrade_ex'),
			colour = G.C.MULT
		}
	  end
	  
	  if target_card.config.center == G.P_CENTERS.m_abn_contagion_seal then
		card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
		return {
			message = localize('k_upgrade_ex'),
			colour = G.C.MULT
		}
	  end
    end
	
	if context.joker_main then
      return {
        mult = card.ability.extra.mult,
		xmult = card.ability.extra.xmult,
		emult = card.ability.extra.emult,
      }
    end
	
  end,
  abn_artist_credits = {
    artist = "Pepix",
  },
}
