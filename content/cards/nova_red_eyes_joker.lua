if ((SMODS.Mods["allinjest"] or {}).can_load) then

SMODS.Joker {
  key = 'nova_red_eyes_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet17',
  pos = { x = 5, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
	extra = {
		repetitions = 1,
    }
  },
  
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
	info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_cthonian
	return { vars = { card.ability.extra.repetitions } }
  end,
  
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      if G.GAME.current_round.hands_played == 0 then
        
        local only_dark_suits = true
        for i = 1, #context.scoring_hand do
          if not ABN.is_dark(context.scoring_hand[i]) then
            only_dark_suits = false
            break
          end
        end

        if only_dark_suits then
          for i = 1, #context.scoring_hand do
            local scoring_card = context.scoring_hand[i]
            
            scoring_card.ability.perma_repetitions = (scoring_card.ability.perma_repetitions or 0) + card.ability.extra.repetitions
            
            scoring_card:set_edition({ abn_chthonian = true }, true)
            
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}

end