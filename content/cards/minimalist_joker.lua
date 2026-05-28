SMODS.Joker {
  key = 'minimalist_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet11',
  pos = { x = 6, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { xmult = 3 } },
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,
  
  in_pool = function(self, args)
    if not G.jokers or #G.jokers.cards == 0 then 
      return false
    end
    
    -- Check every owned Joker. Rarity 1 = Common
    for i = 1, #G.jokers.cards do
      local jkr = G.jokers.cards[i]
      if not jkr.config.center.rarity or jkr.config.center.rarity ~= 1 then
        return false 
      end
    end
    
    return true -- Every Joker you own is common
  end,
  
  -- consumables are worthless
  update = function(self, card)
    if card.area == G.jokers then
		for i, v in pairs(G.consumeables.cards) do
			v.sell_cost = 0
        end
	end
  end,
  
  calculate = function(self, card, context)   
    -- trigger for common jokers
    if context.other_joker and context.other_joker ~= card then
      if context.other_joker.config.center.rarity and context.other_joker.config.center.rarity == 1 then
        return {
          xmult = card.ability.extra.xmult,
          card = card
        }
      end
    end
	
	if context.selling_card and context.card ~= card and context.card.ability.set and context.card.ability.set  == 'Joker' then
		card:start_dissolve()
	end
  end,
  
  abn_artist_credits = {
    artist = "Flote"
  },
}