SMODS.Joker {
  key = 'grampa_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet13',
  pos = { x = 9, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true, 
  config = { extra = {} },
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_vintage
    return { vars = {} }
  end,

  in_pool = function(self, args)
    if G.jokers and G.jokers.cards then
      for _, j in ipairs(G.jokers.cards) do
        if j.ability.perishable then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if G.GAME.current_round.hands_left == 0 then
        local first_scoring_card = context.scoring_hand[1]
        
        if context.other_card == first_scoring_card then
          context.other_card:set_edition({ abn_vintage = true }, true)
        end
		
      end
    end
  end,
  
  abn_artist_credits = {
    artist = "Gfs",
  },
}