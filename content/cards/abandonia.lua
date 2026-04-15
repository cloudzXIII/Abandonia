SMODS.Joker {
  key = 'abandonia',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.x_chips
      }
    }
  end,

  rarity = "abn_SuperRare",
  atlas = 'AbandoniaJokers',
  pos = { x = 2, y = 18 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 2, x_chips = 2 } },
  
  update = function(self, card)
    if card.area == G.shop_jokers then
		card.cost = 30
	end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      return {
        x_chips = card.ability.extra.x_chips,
        x_mult = card.ability.extra.x_mult,
        card = card
      }
    end
  end,
  abn_artist_credits = {
    artist = "Comykel",
  },

  in_pool = function(self, args)
    return not args or args.source ~= "sho"
  end
}
