SMODS.Joker {
  key = 'peel_off',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.x_mult_gain
      }
    }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 5, y = 10 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      x_mult = 1,
      x_mult_gain = 0.1
    },
  },
  calculate = function(self, card, context)
    if context.setting_blind then
      local sticker_count, jokers = ABN.count_stickers()
      for _, v in pairs(jokers or {}) do
        for key, _ in pairs(SMODS.Sticker.obj_table) do
          SMODS.Stickers[key]:apply(v, false)
          v:juice_up()
        end
      end
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = 'x_mult',
        scalar_value = 'x_mult_gain',
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + (sticker_count * change)
        end,
        message_key = "a_xmult"
      })
    end
  end,
  abn_artist_credits = {
    artist = "BlackATM"
  },
  in_pool = function(self, args)
    for key, _ in pairs(SMODS.Sticker.obj_table or {}) do
      for _, joker in pairs(G.jokers.cards or {}) do
        if joker.ability and joker.ability[key] then
          return true
        end
      end
    end
    return false
  end
}
