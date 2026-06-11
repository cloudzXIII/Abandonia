SMODS.Joker {
  key = 'alter_suits',
  rarity = 3, 
  atlas = 'ABNJokerSheet16',
  pos = { x = 1, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, mult = 0, chipsadd = 4 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.chipsadd } }
  end,
  
  in_pool = function(self, args)
    if not G.playing_cards then return false end
    
    local has_snow = false
    local has_penumbra = false
    local has_tie = false
    local has_bow = false

    for i = 1, #G.playing_cards do
      local c = G.playing_cards[i]
      if c:is_suit("abn_Snow") then has_snow = true
      elseif c:is_suit("abn_Penumbra") then has_penumbra = true
      elseif c:is_suit("abn_Tie") then has_tie = true
      elseif c:is_suit("abn_Bow") then has_bow = true
      end
      
      if has_snow and has_penumbra and has_tie and has_bow then
        return true
      end
    end

    return false
  end,

  calculate = function(self, card, context)
    if context.joker_main then
		return {
			mult = card.ability.extra.mult,
			chips = card.ability.extra.chips,
			card = card
		}
    end

    if context.before and not context.blueprint then
      local has_snow = false
      local has_penumbra = false
      local has_tie = false
      local has_bow = false
      local vanilla_suit_found = false
      local hand_combined_ranks = 0

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]
        
        if scoring_card:is_suit("abn_Snow") then has_snow = true
        elseif scoring_card:is_suit("abn_Penumbra") then has_penumbra = true
        elseif scoring_card:is_suit("abn_Tie") then has_tie = true
        elseif scoring_card:is_suit("abn_Bow") then has_bow = true
        end

        if scoring_card:is_suit("Spades") or scoring_card:is_suit("Hearts") or scoring_card:is_suit("Clubs") or scoring_card:is_suit("Diamonds") then
          vanilla_suit_found = true
        end
        
        hand_combined_ranks = hand_combined_ranks + scoring_card.base.nominal
      end
	  
	  local triggered = false

      if has_snow and has_penumbra and has_tie and has_bow and hand_combined_ranks > 0 then
        card.ability.extra.mult = card.ability.extra.mult + hand_combined_ranks
        triggered = true
      end

      if not vanilla_suit_found then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
        triggered = true
      end

      if triggered then
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.ATTENTION,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Inky",
  },
}