if ((SMODS.Mods["allinjest"] or {}).can_load) then

SMODS.Joker {
  key = 'narcoleptic_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet17',
  pos = { x = 9, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { xchips = 2, xmult = 2 } },
  
  loc_vars = function(self, info_queue, card)
    return { 
      vars = { 
        card.ability.extra.xchips,
        card.ability.extra.xmult
      } 
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      
      local only_spades_and_clubs = true
      local only_spades_and_bows = true

      for i = 1, #context.scoring_hand do
        local scoring_card = context.scoring_hand[i]
        
        if not (scoring_card:is_suit('Spades') or scoring_card:is_suit('Clubs')) then
          only_spades_and_clubs = false
        end

        if not (scoring_card:is_suit('Spades') or scoring_card:is_suit('abn_Bow')) then
          only_spades_and_bows = false
        end
      end

      if only_spades_and_clubs then
        return {
          xchips = card.ability.extra.xchips,
          card = card
        }
      elseif only_spades_and_bows then
        return {
          xmult= card.ability.extra.xmult,
          card = card
        }
      end
      
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}

end