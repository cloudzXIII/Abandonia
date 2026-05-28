local original_game_update = Game.update

function Game:update(dt)
    original_game_update(self, dt)

    if G.STAGE ~= G.STAGES.RUN then return end
	
	if G.jokers and G.jokers.cards and next(SMODS.find_card('j_abn_the_joker_dance')) then
		for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
			
			j.states.drag.can = false
			
		end
	end
	
end


SMODS.Joker {
  key = 'the_joker_dance',
  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 8, y = 2 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
	  mult = 10,
	  chips = 5,
    }
  },
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
		card.ability.extra.chips
      },
    }
  end,
  
  remove_from_deck = function(self, card)
	for i = 1, #G.jokers.cards do
		local j = G.jokers.cards[i]
		j.states.drag.can = true
	end
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
		for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
			
			-- Shuffle Jokers
			G.jokers:shuffle('aajk')
			
            -- Gain chips and mult
            j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + card.ability.extra.chips
            j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0) + card.ability.extra.mult
			
		end
	end
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}
