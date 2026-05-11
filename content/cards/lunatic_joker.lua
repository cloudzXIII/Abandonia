if ((SMODS.Mods["ortalab"] or {}).can_load) then

SMODS.Joker {
  key = 'lunatic_joker',
  rarity = 3,
  atlas = 'AbandoniaCrossmod',
  pos = { x = 5, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  
  loc_vars = function(self, info_queue, center)
	info_queue[#info_queue + 1] = G.P_CENTERS.e_ortalab_greyscale
	info_queue[#info_queue + 1] = G.P_SEALS.ortalab_cyan
  end,

  calculate = function(self, card, context)
    
    -- Jiggle on first hand OR last hand
    if context.first_hand_drawn and not context.blueprint then
        local eval = function()
            local is_first_hand = G.GAME.current_round.hands_played == 0
            local is_last_hand = G.GAME.current_round.hands_left == 0
            return (is_first_hand or is_last_hand) and not G.RESET_JIGGLES
        end
        juice_card_until(card, eval, true)
    end
    
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      -- Logic for First Hand (Even cards)
      if ABN.is_even(context.other_card) and G.GAME.current_round.hands_played == 0 then
        target_card:set_edition({ortalab_greyscale = true}, true)
      end
      -- Logic for Last Hand (Odd cards)
      if ABN.is_odd(context.other_card) and G.GAME.current_round.hands_left == 0 then
        target_card:set_seal('ortalab_cyan', true)
      end
    end
  end,

  abn_artist_credits = {
    artist = "Bunnet",
  },
}

end