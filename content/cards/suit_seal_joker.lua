SMODS.Joker {
  key = 'suit_seal_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 4, y = 5 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = true,
  config = { 
    extra = { 
      mult = 0, 
      chips = 0, 
	  multadd = 3, 
      chipsadd = 5,
    } 
  }, 

  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = G.P_SEALS.abn_brown
	info_queue[#info_queue + 1] = G.P_SEALS.abn_violet
    return { 
      vars = { 
        card.ability.extra.mult, 
        card.ability.extra.chips, 
		card.ability.extra.multadd,
		card.ability.extra.chipsadd,
      } 
    }
  end,

  calculate = function(self, card, context) 
    -- Check for suits
    if context.before and not context.blueprint then
      local unique_suits = {}
      for i = 1, #context.scoring_hand do
        local suit = context.scoring_hand[i].base.suit
        unique_suits[suit] = true
      end
      
      local suit_count = 0
      for _ in pairs(unique_suits) do suit_count = suit_count + 1 end

      -- If played hand has 4 unique suits, add seals to cards without them
      if suit_count >= 4 then
        local applied_seal = false
        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          
          if not scoring_card.seal then
            if ABN.is_light(scoring_card) then
              scoring_card:set_seal('abn_brown', true)
            elseif ABN.is_dark(scoring_card) then
              scoring_card:set_seal('abn_violet', true)
            end
          end
        end
      end
    end

    -- Scaling
    if context.individual and context.cardarea == G.play then
      local current_card = context.other_card
      local upgraded = false

      if current_card and current_card.seal then
        -- Light Suits with seals: +5 Chips, +3 Mult
        if ABN.is_light(current_card) then
          card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
          upgraded = true
        -- Dark Suits with seals: +3 Chips, +5 Mult
        elseif ABN.is_dark(current_card) then
          card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.mult
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.chipsadd
          upgraded = true
        end
      end

      if upgraded then
        return {
			message = localize('k_upgrade_ex'),
            card = card,
        }
      end
    end

    -- Scoring
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
      }
    end
  end, 

  abn_artist_credits = {
    artist = "Flote",
  },
}