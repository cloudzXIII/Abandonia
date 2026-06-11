SMODS.Joker {
  key = 'ill_gotten_gains',
  rarity = 1,
  atlas = 'ABNJokerSheet2',
  pos = { x = 2, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 1, edollars = 4, } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars, card.ability.extra.edollars, } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
		if context.other_card:is_suit("abn_Tie") and context.other_card.config.center and context.other_card.config.center == G.P_CENTERS.c_base then
			return {
				dollars = card.ability.extra.dollars,
				colour = G.C.MONEY,
				card = card
			}
		elseif context.other_card:is_suit("abn_Tie") and context.other_card.config.center and context.other_card.config.center ~= G.P_CENTERS.c_base then
			return {
				dollars = card.ability.extra.edollars,
				colour = G.C.MONEY,
				card = card
			}
		end
    end
  end,

  abn_artist_credits = {
    artist = "Conium Maculatum",
  },
}
