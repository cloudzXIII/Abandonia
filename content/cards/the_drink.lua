if ((SMODS.Mods["Fortlatro"] or {}).can_load) then

SMODS.Joker {
  key = 'the_drink',
  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 8, y = 5 }, 
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_fn_Shockwaved
	info_queue[#info_queue + 1] = G.P_SEALS.fn_GlitchedSeal
    return { vars = {} }
  end,

  calculate = function(self, card, context)
    if context.before and context.scoring_hand and G.GAME.hands_played == 0 then
      if #context.scoring_hand == 5 then
        local triggered = false
        for _, scoring_card in ipairs(context.scoring_hand) do
          if not (scoring_card.edition and scoring_card.edition.fn_Shockwaved) then
            scoring_card:set_edition({fn_Shockwaved = true}, true)
            triggered = true
          end
        end
        if triggered then
          return {
            card = card,
            message = "Liquidity!",
            colour = G.C.PURPLE
          }
        end
      end
    end

    if context.before and context.scoring_hand and G.GAME.current_round.hands_left == 0 then
      if #context.scoring_hand == 1 then
        
        local unscoring_cards = {}
        for _, played_card in ipairs(context.full_hand) do
          local scored = false
          for _, scoring_card in ipairs(context.scoring_hand) do
            if played_card == scoring_card then
              scored = true
              break
            end
          end
          if not scored then
            table.insert(unscoring_cards, played_card)
          end
        end

        if #unscoring_cards > 0 then
          for _, u_card in ipairs(unscoring_cards) do
            u_card:set_seal('fn_GlitchedSeal', true)
          end
          return {
            card = card,
            message = "Liquidity!",
            colour = G.C.PURPLE
          }
        end
      end
    end

  end,

  abn_artist_credits = {
    artist = "P_ixl",
  },
}

end