SMODS.Joker {
  key = 'confirm_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet11',
  pos = { x = 8, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { dollars = 5 } },
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars } }
  end,
  
  calculate = function(self, card, context)   
	if context.end_of_round and context.main_eval and not context.blueprint then
		add_tag({key = get_next_tag_key(self.key)})
	end
	
	if context.tag_added and context.tag_added.key then
      -- if tag is a hazard
      if string.find(context.tag_added.key, "hazard") then
        
		-- gain money
        return {
          dollars = card.ability.extra.dollars,
          colour = G.C.MONEY,
          card = card
        }
      end
    end
	
  end,
  
  abn_artist_credits = {
    artist = "Flote"
  },
}