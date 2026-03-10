SMODS.Joker {
  key = 'turf_graffiti',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return { vars = { card.ability.extra.x_mult } }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 1, y = 1 },
  cost = 6,
  discovered = true,
  blueprint_compat = true,

  config = { extra = { x_mult = 1.7 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_dark(context.other_card) then
        return {
          x_mult = card.ability.extra.x_mult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Mr.Muffins"
  },
}
