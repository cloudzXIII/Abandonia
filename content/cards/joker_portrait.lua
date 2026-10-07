SMODS.Joker {
  key = 'joker_portrait',
  rarity = 2,
  atlas = 'ABNJokerSheet27',
  pos = { x = 7, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      amp = 4,
    }
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.amp } }
  end,
  calculate = function(self, card, context)
	if context.joker_main then
        return {
			amp = card.ability.extra.amp,
            card = self
		}
    end
  end,
  abn_artist_credits = {
    artist = "Shai1n",
  },
}