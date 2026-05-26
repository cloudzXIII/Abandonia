local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)
	if G.STAGE ~= G.STAGES.RUN then return end
	if G.jokers then
		for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
            local rarity = j.config.center.rarity

            if j.ability.abn_hidden then
				if j.facing == 'front' then
					j:flip()
				end
                j.ability.abn_perma_flipped = true
				j:set_edition({ holo = true })
				j.ability.abn_hidden = false
            end
		end
	end
end


SMODS.Joker {
  key = 'joker_in_hiding',
  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 5, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      dollars = 4,
    }
  },
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
	info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    return {
      vars = {
        card.ability.extra.dollars,
      },
    }
  end,
  
  update = function(self, card)
    if card.area == G.jokers then
      
      -- Apply abn_hidden to Jokers in booster packs
      if G.pack_cards and G.pack_cards.cards then
        for _, c in ipairs(G.pack_cards.cards) do
          if c.ability and c.config and c.config.center and c.ability.set == "Joker" and not c.ability.abn_hidden then
            c.ability.abn_hidden = true
            c:juice_up()
          end
        end
      end

    end
  end,

  -- remove hidden
  remove_from_deck = function(self, card)
    if G.pack_cards and G.pack_cards.cards then
      for _, c in ipairs(G.pack_cards.cards) do
        if c.ability and c.ability.abn_hidden then
          c.ability.abn_hidden = false
          c:juice_up()
        end
      end
    end
  end,
  
  calculate = function(self, card, context)
	-- scored flipped cards
	if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      
      if target_card.ability.abn_perma_flipped then
		return {
			dollars = card.ability.extra.dollars
		}
	  end
    end
	
	-- flipped jokers
	if context.other_joker and context.other_joker ~= card and context.other_joker.ability.abn_perma_flipped then
		return {
			dollars = card.ability.extra.dollars, 
            card = card
        }
    end
  end,

  abn_artist_credits = {
    artist = "Toyrapple",
  },
}