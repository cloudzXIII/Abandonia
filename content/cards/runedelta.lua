SMODS.Joker {
  key = 'runedelta',
  rarity = 1, 
  atlas = 'ABNJokerSheet18',
  pos = { x = 1, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { 
    extra = { 
      mult = 0, 
      chips = 0, 
      multadd = 4, 
      chipsadd = 10 
    } 
  },
  
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
	info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    return { 
      vars = { 
        card.ability.extra.mult, 
        card.ability.extra.chips, 
        card.ability.extra.multadd, 
        card.ability.extra.chipsadd 
      } 
    }
  end,
  
  in_pool = function(self)
	return not G.GAME.RunedeltaDied
  end,

  calculate = function(self, card, context)
    if context.joker_main then
        return {
          mult = card.ability.extra.mult,
          chips = card.ability.extra.chips,
        }
    end

    if context.final_scoring_step and not context.repetition then
      local blind_chips = G.GAME.blind and G.GAME.blind.chips or 0
      local result = SMODS.calculate_round_score() + G.GAME.chips

      if result >= blind_chips then
        local has_dark = false
        local has_light = false
        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          if ABN.is_dark(scoring_card) then
            has_dark = true
          end
          if ABN.is_light(scoring_card) then
            has_light = true
          end
        end


        if has_dark and has_light then
          card:start_dissolve()
		  G.GAME.RunedeltaDied = true

        elseif has_dark and not has_light then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
          }

        elseif has_light and not has_dark then
          card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = card
          }
        end

      end
    end
  end,
  
  abn_artist_credits = {
    artist = "Comykel",
  },
}