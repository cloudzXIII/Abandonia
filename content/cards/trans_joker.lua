SMODS.Joker {
  key = 'trans_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet14',
  pos = { x = 2, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true, 
  config = { extra = {} },
  
  in_pool = function(self, args)
    if G.GAME and G.GAME.abn_rank_upgrades then
      for rank_key, rank_data in pairs(G.GAME.abn_rank_upgrades) do
        if rank_data.level and rank_data.level > 1 then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.change_suit and context.other_card then
      local changed_card = context.other_card
      
      if changed_card.base and changed_card.base.value and G.GAME.abn_rank_upgrades[changed_card.base.value] then
        local rank_key = changed_card.base.value
        
        ABN.level_up_rank(card, rank_key, 1)
		
		return {
			message = localize('k_level_up_ex')
		}
		
      end
    end
  end,
  
  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}