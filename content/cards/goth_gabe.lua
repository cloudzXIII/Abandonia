SMODS.Joker {
  key = 'goth_gabe',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_gain } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 3, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 1, x_mult_gain = 0.1 } },

  calculate = function(self, card, context)
    if context.before then
      local all_dark = true
      for _, playing_card in ipairs(context.full_hand) do
        if not ABN.is_dark(playing_card) then
          all_dark = false
          break
        end
      end
      if all_dark then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          operation = '+',
        })
      end
    end
    if context.joker_main and card.ability.extra.x_mult > 1 then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Mr.Muffins"
  },
}
