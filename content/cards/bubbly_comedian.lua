SMODS.Joker {
  key = 'bubbly_comedian',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips, cae.dollars, cae.mult_gain, cae.chips_gain, cae.dollars_gain } }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'AbandoniaJokers',
  pos = { x = 7, y = 16 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, chips = 0, dollars = 0, mult_gain = 3, chips_gain = 20, dollars_gain = 2 } },
  pools = { ["Comedians"] = true,},

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  calculate = function(self, card, context)
    if context.post_trigger and context.cardarea == G.jokers and context.other_card.config and context.other_card.config.center and context.other_card.config.center.rarity and context.other_card.config.center.rarity == "abn_SuperRare" then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
        no_message = true
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = '+',
        no_message = true
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "dollars",
        scalar_value = "dollars_gain",
        operation = '+',
      })
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
        dollars = card.ability.extra.dollars
      }
    end
  end,
  abn_artist_credits = {
    artist = "Aidan",
  },
}
