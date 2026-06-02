SMODS.Joker {
  key = 'caffeinated_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 6, y = 5 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xmult = 1,
      xmultadd = 0.1,
    },
  },
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult, 
        card.ability.extra.xmultadd,
      }
    }
  end,
  
  in_pool = function(self)
    if not G.playing_cards then return false end

    local has_teastain = false
    local has_red_seal = false

    for _, card in ipairs(G.playing_cards) do
      if card then
		
		-- Check for a Teastain
        if card.config and card.config.center and card.config.center == G.P_CENTERS_m_abn_teastain then
          has_teastain = true
        end

        -- Check for a Red Seal
        if card.seal and card.seal == 'Red' then
          has_red_seal = true
        end

        if has_teastain and has_red_seal then
          return true
        end
      end
    end

    return false
  end,
  
  calculate = function(self, card, context)
    -- Retriggers
    if context.cardarea == G.play and context.repetition and not context.repetition_only then
      if context.other_card and context.other_card.seal and context.other_card.seal == "Red" then
        
        -- Count red seals
        local red_seal_count = 0
        if context.scoring_hand then
          for _, scoring_card in ipairs(context.scoring_hand) do
            if scoring_card and scoring_card.seal and scoring_card.seal == "Red" then
              red_seal_count = red_seal_count + 1
            end
          end
        end

        -- Retrigger for red seals
        if red_seal_count > 0 then
          return {
            message = localize('k_again_ex'),
            repetitions = red_seal_count,
            card = card
          }
        end
      end
    end
	
	-- Destroy
	if context.destroy_card and context.cardarea == G.play then
		if context.destroy_card.config.center == G.P_CENTERS.m_abn_teastain then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
			return {
				remove = true,
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT
			}
		end
	end

    -- Scoring
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
      }
    end
	
	-- Debuff
	if context.hand_drawn then
		if G.GAME.current_round.hands_played >= 1 then
			for _, c in ipairs(G.playing_cards) do
				c:set_debuff(true)
			end
		end
	end
	
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}