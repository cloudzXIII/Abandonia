if ((SMODS.Mods["Fortlatro"] or {}).can_load) then

local add_to_deckref = Card.add_to_deck

function Card.add_to_deck(self, from_debuff)
    if not self.added_to_deck then
        if not from_debuff then
            
            -- Tracking joker rarities
            if self.ability and self.ability.set == "Joker" then
				if next(SMODS.find_card("j_abn_the_big_cheese")) then
					if self.config.center.rarity == 2 or self.config.center.rarity == 3 then
						self:set_edition({ fn_Mythic = true })
					end
				end
            end

        end
    end

    return add_to_deckref(self, from_debuff)
end


SMODS.Joker {
  key = 'the_big_cheese',
  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 5, y = 3 }, 
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_fn_Mythic
    return { vars = { G.GAME.probabilities.normal } }
  end,

  update = function(self, card)
    -- Only run logic if the card is in the Joker slots
    if card.area == G.jokers then
      -- Safety check for Shop Jokers
      if G.shop_jokers and G.shop_jokers.cards then
        for _, j in ipairs(G.shop_jokers.cards) do 
            if j.config.center.set == 'Joker' then
				if j.config.center.rarity == 2 or j.config.center.rarity == 3 then
					j.cost = 0
				end
			end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "+Jolly",
  },
}

end