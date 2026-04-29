SMODS.Joker {
  key = 'perfidious_comedian',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xchips,
      }
    }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'AbandoniaJokers',
  pos = { x = 2, y = 22 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 2.5, xchips = 2.4, } },
  pools = { ["Comedians"] = true,},


  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  calculate = function(self, card, context)

    -- Trigger for each card as it scores
    if context.individual and context.cardarea == G.play then
      if ABN.is_even(context.other_card) and context.other_card.seal then
        return {
          xmult = card.ability.extra.xmult
        }
      end
      if ABN.is_odd(context.other_card) and context.other_card.seal then
        return {
          xchips = card.ability.extra.xchips
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Maw and Gappie",
  },
}
