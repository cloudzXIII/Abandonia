SMODS.Joker {
  key = '10_4_joker',

  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 6, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 10,
      mult = 4,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult, card.ability.extra.chips
      },
    }
  end,


  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == 10 then
        context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult
      end
      if context.other_card:get_id() == 4 then
        context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips
      end
    end
  end,
  abn_artist_credits = {
    artist = "DrSmey",
  },
}
