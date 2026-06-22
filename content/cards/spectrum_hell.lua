if ((SMODS.Mods["allinjest"] or {}).can_load) then

SMODS.Joker {
  key = 'spectrum_hell',
  rarity = 2,
  atlas = 'ABNJokerSheet17',
  pos = { x = 6, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { xmultadd = 0.25 } },
  
  loc_vars = function(self, info_queue, card)
    return { 
      vars = { 
        card.ability.extra.xmultadd
      } 
    }
  end,

  calculate = function(self, card, context)
    if context.final_scoring_step then
      local catches_fire = SMODS.calculate_round_score() > G.GAME.blind.chips

      local spectrum_hands = {
        "abn_Spectrum",
        "abn_Specflush",
        "abn_Straight Specflush",
        "abn_Specflush House",
        "abn_Specflush Five",
        "abn_Specflush Six"
      }
      
      local is_spectrum = false
      for _, hand_type in ipairs(spectrum_hands) do
        if context.poker_hands[hand_type] and next(context.poker_hands[hand_type]) then
          is_spectrum = true
          break
        end
      end

      if catches_fire and is_spectrum then
        if #G.jokers.cards > 0 then
          for i = 1, #G.jokers.cards do
            local target = G.jokers.cards[i]
            
            target.ability.abn_perma_xmult = (target.ability.abn_perma_xmult or 1) + card.ability.extra.xmultadd
			
            card_eval_status_text(card, 'extra', nil, nil, nil, {
				message = localize('k_upgrade_ex'),
                colour = G.C.RED,
				card = target,
            })
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