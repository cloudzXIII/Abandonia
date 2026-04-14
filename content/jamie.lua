SMODS.Joker {
  key = 'jamie',
  rarity = 4,
  atlas = 'AbandoniaJokers',
  pos = { x = 1, y = 34 },
  soul_pos = { x = 2, y = 34 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
		return {
			level_up = true,
			message = localize('k_level_up_ex')
		}
    end
  end,

  abn_artist_credits = {
    artist = "Long Rooster",
  },
}