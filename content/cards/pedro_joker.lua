SMODS.Joker {
  key = 'pedro_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet11',
  pos = { x = 4, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,
  config = {
    extra = {
      mult = 0,
      chips = 0,
    },
  },
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
  end,
  
  in_pool = function(self, args)
    return G.GAME.pool_flags.gros_michel_extinct
  end,
  
  calculate = function(self, card, context)    
    if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.blind.boss then
        local lowest_joker = nil
        local min_sell_value = math.huge

        for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
            if j ~= card then -- Don't let Pedro eat himself
                if j.sell_cost < min_sell_value then
                    min_sell_value = j.sell_cost
                    lowest_joker = j
                end
            end
        end

        if lowest_joker then
            local gain = min_sell_value * 8
            
            card.ability.extra.chips = card.ability.extra.chips + gain
            card.ability.extra.mult = card.ability.extra.mult + gain
			lowest_joker:start_dissolve()
			return {
                message = localize('k_upgrade_ex'),
				card = card
            }
        end
    end
	
	if context.joker_main then
		return {
			mult = card.ability.extra.mult,
			chips = card.ability.extra.chips,
		}
	end
  end,
  abn_artist_credits = {
    artist = "Flote"
  },
}