if ((SMODS.Mods["Fortlatro"] or {}).can_load) then

SMODS.Joker {
  key = 'certified_brainrot',
  rarity = 3,
  atlas = 'ABNJokerSheet17',
  pos = { x = 4, y = 1 }, 
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = { 
	extra = {
		emult = 1.3,      
        echips = 1.5 
    }
  },
  pools = { ["Brainrot"] = true,},


  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = {key = 'fn_Brainrot', set = 'Other', vars = { "Brainrot" }}
    return {vars = {card.ability.extra.emult, card.ability.extra.echips}}
  end,
  
  update = function(self, card)
    if card.area == G.jokers then
      if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do 
            if not j.config.center.pools or j.config.center.pools and not j.config.center.pools.Brainrot then
				j:set_debuff(true)
			end
        end
      end
    end
  end,

  calculate = function(self, card, context)
	if context.other_joker and context.other_joker ~= card and context.other_joker.config.center.pools and context.other_joker.config.center.pools.Brainrot then
		return {
			emult = card.ability.extra.emult,
			echips = card.ability.extra.echips,
            card = card
        }
    end
  end,

  abn_artist_credits = {
    artist = "Fridgemancer",
  },
}

end