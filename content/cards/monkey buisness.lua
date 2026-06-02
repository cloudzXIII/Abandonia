SMODS.Joker {
  key = 'monkey_buisness',
  rarity = 1,
  atlas = 'ABNJokerSheet13',
  pos = { x = 6, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  
  update = function(self, card)
	-- Shop consumables
    if card.area == G.jokers then
      if G.shop_jokers and G.shop_jokers.cards then
        for _, c in ipairs(G.shop_jokers.cards) do 
          if c.ability.set ~= "Joker" and c.ability.set ~= "Default" and c.ability.set ~= "Enhanced" and not c.ability.monkey_checked then
            c.ability.monkey_checked = true
            if pseudorandom('monkey_business') < 1/5 then
				c:set_edition(poll_edition('monkey', nil, false, true))
            end
          end
        end
      end
	  
	  -- Pack consumables
	  if G.pack_cards and G.pack_cards.cards then
        for _, c in ipairs(G.pack_cards.cards) do 
          if c.ability.set ~= "Joker" and c.ability.set ~= "Default" and c.ability.set ~= "Enhanced" and not c.ability.monkey_checked then
            c.ability.monkey_checked = true
            if pseudorandom('monkey_business') < 1/5 then
				c:set_edition(poll_edition('monkey', nil, false, true))
            end
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Crazy Dave",
  },
}