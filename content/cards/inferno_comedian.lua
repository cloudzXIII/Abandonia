SMODS.Joker {
  key = 'inferno_comedian',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.chips_gain, card.ability.extra.mult_gain } }
  end,

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_comedian"), G.C.ORANGE, G.C.WHITE, 1.0)
  end,

  rarity = "abn_SuperRare",
  atlas = 'ABNJokerSheet4',
  pos = { x = 1, y = 2 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1.7, chips = 0, mult = 0, chips_gain = 50, mult_gain = 5 } },
  pools = { ["Comedians"] = true, },

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      return {
        xmult = card.ability.extra.xmult,
      }
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
    if context.after and context.main_eval and not context.blueprint and SMODS.last_hand_oneshot then
      local count = 0
      for _, v in ipairs(G.jokers.cards) do
        if v:is_rarity("abn_SuperRare") then
          count = count + 1
        end
      end
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + count * change
        end,
        no_message = true
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + count * change
        end,
        scaling_message = {
          message = localize("k_abn_oneshot"),
          colour = G.C.FILTER
        }
      })
    end
  end,
  abn_artist_credits = {
    artist = "Toyrapple",
  },
}
