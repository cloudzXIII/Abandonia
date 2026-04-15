SMODS.Joker {
  key = 'minimus',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
		card.ability.extra.xchips,
      }
    }
  end,

  rarity = 4,
  atlas = 'AbandoniaJokers',
  pos = { x = 5, y = 33 },
  soul_pos = { x = 6, y = 33 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 2, xchips = 2 } },

  calculate = function(self, card, context)
    
	
	-- Trigger for each card as it scores
    if context.individual and context.cardarea == G.play then
        local current_card = context.other_card
        local rank = current_card:get_id()

        -- Check if it is a numbered card (2-5)
        if rank >= 2 and rank <= 4 then
            return {
                xmult = card.ability.extra.xmult,
				xchips = card.ability.extra.xchips,
                card = card,
            }
        end
    end
  end,

  abn_artist_credits = {
    artist = "Long Rooster",
  },
}