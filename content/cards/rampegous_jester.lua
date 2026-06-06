SMODS.Joker {
  key = 'rampegous_jester',
  rarity = 3, 
  atlas = 'ABNJokerSheet14',
  pos = { x = 9, y = 3 }, 
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chipsadd = 10,
      xmultadd = 0.1,
    }
  },

  in_pool = function(self, args)
	if G.jokers and G.jokers.cards then
		local common_count = 0
		for _, j in ipairs(G.jokers.cards) do
			if j.config.center.rarity == 1 then
				common_count = common_count + 1
			end
		end
		return common_count % 2 == 1
	end
	return false
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chipsadd,
        card.ability.extra.xmultadd,
      },
    }
  end,

  calculate = function(self, card, context)
    -- Scaling logic happens when the hand evaluates
    if context.joker_main and not context.blueprint then
      
      -- Count Scoring Cards
      local scoring_cards_count = #context.scoring_hand
      if scoring_cards_count == 0 then return end

      local hand_is_even = (scoring_cards_count % 2 == 0)
      local hand_is_odd = (scoring_cards_count % 2 ~= 0)

      -- Count Joker Rarities
      local common_count = 0
      local rare_count = 0

      if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
          if j.config.center.rarity == 1 then
            common_count = common_count + 1
          elseif j.config.center.rarity == 3 then
            rare_count = rare_count + 1
          end
        end
      end

      local triggered = false

      -- Condition 1: Even number of Rare Jokers + Even scoring hand size
      -- Permanently alters abn_perma_xmult on all Rare Jokers
      if hand_is_even and (rare_count % 2 == 0) then
        local total_xmultadd = card.ability.extra.xmultadd * scoring_cards_count
        triggered = true
        
        for _, j in ipairs(G.jokers.cards) do
          if j.config.center.rarity == 3 then
            j.ability.abn_perma_xmult = (j.ability.abn_perma_xmult or 1) + total_xmultadd
          end
        end
      end

      -- Condition 2: Odd number of Common Jokers + Odd scoring hand size
      -- Permanently alters abn_perma_bonus on all Common Jokers + Rampegous Jester
      if hand_is_odd and (common_count % 2 ~= 0) then
        local total_chipsadd = card.ability.extra.chipsadd * scoring_cards_count
        triggered = true

        for _, j in ipairs(G.jokers.cards) do
          if j.config.center.rarity == 1 then
            j.ability.abn_perma_bonus = (j.ability.abn_perma_bonus or 0) + total_chipsadd
          end
        end
        
        -- Explicitly include Rampegous Jester in the chips modification pool
        card.ability.abn_perma_bonus = (card.ability.abn_perma_bonus or 0) + total_chipsadd
      end

      if triggered then
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Upgrade!"})
      end
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}