if ((SMODS.Mods["ortalab"] or {}).can_load) then

SMODS.Joker {
  key = 'anaglyphic_joker',
  rarity = 3,
  atlas = 'AbandoniaCrossmod',
  pos = { x = 4, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = { mult = 0, multadd = 3, chips = 0, chipsadd = 5 }
  },
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_ortalab_anaglyphic
    return {
      vars = {
        card.ability.extra.mult,
		card.ability.extra.chips,
        card.ability.extra.multadd,
		card.ability.extra.chipsadd,
      }
    }
  end,
  
  in_pool = function(self)
    if not G.playing_cards then return false end
    for _, card in ipairs(G.playing_cards) do
      if card.edition and card.edition.key == 'e_ortalab_anaglyphic' then
        return true
      end
    end
    return false
  end,
  
  update = function(self, card, dt)
    if G.STAGE == G.STAGES.RUN then
      local tally = 0
      for _, v in pairs(G.playing_cards) do
        if v.edition and v.edition.key == 'e_ortalab_anaglyphic' then
          tally = tally + 1
        end
      end
      card.ability.extra.mult = tally * card.ability.extra.multadd
	  card.ability.extra.chips = tally * card.ability.extra.chipsadd
    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 then
      -- check if the current card is the first or the last in the scoring hand
      if context.other_card == context.scoring_hand[1] or 
         context.other_card == context.scoring_hand[#context.scoring_hand] then
        
        -- apply edition
        context.other_card:set_edition({ortalab_anaglyphic = true},true)
        
      end
    end

    -- scoring
    if context.joker_main then
        return {
            mult = card.ability.extra.mult,
			chips = card.ability.extra.chips,
        }
    end
  end,

  abn_artist_credits = {
    artist = "Smolicon",
  },
}

end