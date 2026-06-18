SMODS.Joker {
  key = 'reversecard_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet6', 
  pos = { x = 1, y = 2 },     
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { 
    extra = { 
      chips = 0, 
      mult = 0,
    } 
  },

  loc_vars = function(self, info_queue, card)
    return { 
      vars = { 
        card.ability.extra.chips,
        card.ability.extra.mult,
      } 
    }
  end,

  calculate = function(self, card, context)   
    -- Flip shit
    if context.before and context.scoring_hand then
      local has_flipped = false
      local has_face_up = false

      for _, c in ipairs(context.scoring_hand) do
        if c.ability and c.ability.abn_perma_flipped then
          has_flipped = true
        end
        if c.facing == 'front' then
          has_face_up = true
        end
      end

      if has_flipped and has_face_up then
        for _, c in ipairs(context.scoring_hand) do
          
          if c.facing == 'back' then
		  
            if card.facing == 'back' then
				c.ability.perma_bonus = (c.ability.perma_bonus or 0) + c.base.nominal
			end
			
            card.ability.extra.chips = card.ability.extra.chips + c.base.nominal

            if c.ability and c.ability.abn_perma_flipped then
              c.ability.abn_perma_flipped = false
            end
            c:flip()

          elseif c.facing == 'front' then
            card.ability.extra.mult = card.ability.extra.mult + c.base.nominal
            c:flip()
            if c.ability then
              c.ability.abn_perma_flipped = true
            end
          end

        end
      end
    end

    -- Scoring
    if context.joker_main then
		return {
          chips = card.ability.extra.chips,
          mult = card.ability.extra.mult,
        }
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}