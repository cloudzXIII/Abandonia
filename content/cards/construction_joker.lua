SMODS.Joker {
  key = 'construction_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.xmult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 1, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 100, xmult = 1.3 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
	  -- steel cards
      if target_card and target_card.config.center and target_card.config.center == G.P_CENTERS.m_steel then
		return {
			chips = card.ability.extra.chips
		}
      end
      -- stone cards
      if target_card and target_card.config.center and target_card.config.center == G.P_CENTERS.m_stone then
		return {
			xmult = card.ability.extra.xmult
		}
      end
    end
  end,
  abn_artist_credits = {
    artist = "Littlesamu"
  },
}
