if ((SMODS.Mods["allinjest"] or {}).can_load) then

SMODS.Joker {
  key = 'spectrum_hand',
  rarity = 3,
  atlas = 'ABNJokerSheet17',
  pos = { x = 9, y = 3 }, 
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = { 
    extra = { 
      mult = 0, 
      chips = 0,
      multadd = 9,
      chipsadd = 19
    } 
  },
  
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_fervent
	info_queue[#info_queue + 1] = G.P_CENTERS.e_aij_silver
	info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_charged
	info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    return { 
      vars = { 
        card.ability.extra.multadd,
        card.ability.extra.chipsadd,
        card.ability.extra.mult,
        card.ability.extra.chips
      } 
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
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

      if is_spectrum then
        for _, scoring_card in ipairs(context.scoring_hand) do

          if ABN.is_light(scoring_card) then
            scoring_card:set_ability(G.P_CENTERS.m_aij_fervent)
            scoring_card:set_edition({aij_silver = true}, true)
            
            if card.edition and card.edition.aij_silver then
              card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
              card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
              })
            end
          end

          if ABN.is_dark(scoring_card) then
            scoring_card:set_ability(G.P_CENTERS.m_aij_charged)
            scoring_card:set_edition({abn_chthonian = true}, true)

            if card.edition and card.edition.abn_chthonian then
              card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
              card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize('k_upgrade_ex'),
                colour = G.C.BLUE
              })
            end
          end
        end 
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}

end