if ((SMODS.Mods["Fortlatro"] or {}).can_load) then

SMODS.Joker {
  key = 'mango',
  rarity = 1,
  atlas = 'ABNJokerSheet17',
  pos = { x = 3, y = 1 }, 
  cost = 1,
  discovered = false,
  blueprint_compat = true,
  config = { 
    extra = {
      brainrot = 0,      
      comedians = 0,
	  text1 = "It's a mango what do you expect?",
	  text2 = "",
    }
  },
  
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.text1, card.ability.extra.text2,}}
  end,
  
  update = function(self, card)
    if card.area == G.jokers and G.jokers and G.jokers.cards then
      local brainrot_count = 0
      local comedian_count = 0

      for _, j in ipairs(G.jokers.cards) do 
        if j.config and j.config.center then
          local center = j.config.center
          
          if center.pools and center.pools.Brainrot then
            brainrot_count = brainrot_count + 1
          end

          if center.comedian or (center.pools and center.pools.Comedians) then
            comedian_count = comedian_count + 1
          end
        end
      end

      card.ability.extra.brainrot = brainrot_count
      card.ability.extra.comedians = comedian_count
	  
	  if comedian_count == 0 and brainrot_count == 0 then
		card.ability.extra.text1 = "It's a Mango what do you expect?"
		card.ability.extra.text2 = ""
	  end
	  
	  if comedian_count >= 1 then
		if card.ability.extra.text1 ~= "It's a Mango what do you expect?" and card.ability.extra.text1 ~= "If you have a Comedian reduce blind requirement by 5% for each modded Joker" then
			card.ability.extra.text2 = "If you have a Comedian reduce blind requirement by 5% for each modded Joker"
		else
			card.ability.extra.text1 = "If you have a Comedian reduce blind requirement by 5% for each modded Joker"
		end
	  end
	  
	  if brainrot_count >= 1 then
		if card.ability.extra.text1 ~= "It's a Mango what do you expect?" and card.ability.extra.text1 ~= "If you have a brainrot retrigger all Jokers" then
			card.ability.extra.text2 = "If you have a brainrot retrigger all Jokers"
		else 
			card.ability.extra.text1 = "If you have a brainrot retrigger all Jokers"
		end
	  end
	  
    end
  end,

  calculate = function(self, card, context)
  
	--comedians
	if context.setting_blind and card.ability.extra.comedians >= 1 then
		-- Count how many modded Jokers are currently in the joker area
		local modded_count = 0
		for _, j in ipairs(G.jokers.cards) do
			if j.config.center.original_mod then
				modded_count = modded_count + 1
			end
		end

		-- If there are modded jokers, reduce the blind's chips
		if modded_count > 0 then
			local reduction = 1 - (0.05 * modded_count)
        
			G.GAME.blind.chips = math.max(1, math.floor(G.GAME.blind.chips * reduction))
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        
			-- Play a subtle visual/audio feedback cue so the player knows it triggered
			G.E_MANAGER:add_event(Event({
				func = function()
					card:juice_up()
					return true
				end
				}))
		end
	end
	
	--brainrot
    if context.retrigger_joker_check and not context.retrigger_joker then
      if context.other_card ~= card and card.ability.extra.brainrot >= 1 then
        return {
          message = localize('k_again_ex'),
          repetitions = 1,
          card = context.other_card
        }
      end
    end 
	
  end,

  abn_artist_credits = {
    artist = "F.L.U.X",
  },
}

end