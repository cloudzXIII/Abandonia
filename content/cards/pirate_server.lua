if ((SMODS.Mods["Fortlatro"] or {}).can_load) then

SMODS.Joker {
  key = 'pirate_server',
  rarity = 3,
  atlas = 'ABNJokerSheet17',
  pos = { x = 5, y = 0 }, 
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS.abn_brown
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chromatic
    return { vars = { G.GAME.probabilities.normal } }
  end,

  calculate = function(self, card, context)
    if context.before and context.scoring_hand then
      for _, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card.config.center == G.P_CENTERS.m_fn_Medium then
          scoring_card:set_seal('abn_brown', true)
        elseif scoring_card.config.center == G.P_CENTERS.m_fn_Xp then
          scoring_card:set_edition({abn_chromatic = true}, true)
        end
      end
    end

    if context.retrigger_joker_check and not context.retrigger_joker then
      if context.other_card ~= card and card.edition and card.edition.fn_Shockwaved then
        return {
          message = localize('k_again_ex'),
          repetitions = 1,
          card = card
        }
      end
    end 
  end,

  abn_artist_credits = {
    artist = "Gamer9ts",
  },
}

end