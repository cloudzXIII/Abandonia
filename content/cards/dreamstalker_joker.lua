SMODS.Joker {
  key = 'dreamstalker_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 5, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 2
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult
      }
    }
  end,
  
  -- Check if a nightshift card has been used
  in_pool = function(self)
	local nightshift_card_used = false
	if G.GAME.consumeable_usage then
		for _, v in pairs(G.GAME.consumeable_usage) do
			if v.set == 'nightshift_cards' then
				nightshift_card_used = true
				break 
			end
		end
	end
   end,
  
  calculate = function(self, card, context)
    -- Reset the tracking counts at the start of the scoring hand
    if context.before and not context.blueprint then
      card.ability.extra.dark_scored_before = 0
      card.ability.extra.light_scored_before = 0
    end

    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      local is_discards_even = (G.GAME.current_round.discards_left % 2 == 0)
      
      local is_dark = ABN.is_dark(target_card)
      local is_light = ABN.is_light(target_card)

      local trigger_mult = 0

      if is_discards_even then
        -- Even Discards: Light cards get mult for every Dark card scored *before* them
        if is_light and card.ability.extra.dark_scored_before and card.ability.extra.dark_scored_before > 0 then
          trigger_mult = card.ability.extra.dark_scored_before * card.ability.extra.mult
        end
      else
        -- Odd Discards: Dark cards get mult for every Light card scored *before* them
        if is_dark and card.ability.extra.light_scored_before and card.ability.extra.light_scored_before > 0 then
          trigger_mult = card.ability.extra.light_scored_before * card.ability.extra.mult
        end
      end

      -- Increment the counters for subsequent cards in the hand
      if not context.blueprint then
        if is_dark then card.ability.extra.dark_scored_before = (card.ability.extra.dark_scored_before or 0) + 1 end
        if is_light then card.ability.extra.light_scored_before = (card.ability.extra.light_scored_before or 0) + 1 end
      end

      -- Return the calculated mult
      if trigger_mult > 0 then
        return {
          mult = trigger_mult,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Emmythegremlin",
  },
}