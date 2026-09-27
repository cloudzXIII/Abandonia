SMODS.Joker {
  key = 'gimbo',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 0, y = 0 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { mult = 5, } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 then
        return {
			mult = card.ability.extra.mult,
		}
      end
    end
  end,
  abn_artist_credits = {
    artist = "Bunnet"
  },
}
