SMODS.Joker {
  key = 'combo_maker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.x_mult_gain
      }
    }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 0, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      x_mult = 1,
      x_mult_gain = 0.25
    },
  },

  calculate = function(self, card, context)
    if context.joker_main then
      local has_number = false
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_number(v) then
          has_number = true
        end
      end
      if has_number then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          operation = '+',
        })
      else
        if card.ability.extra.x_mult > 1 then
          card.ability.extra.x_mult = 1
          SMODS.calculate_effect({ message = localize('k_reset'), colour = G.C.FILTER }, card)
        end
      end
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Adumbasswaffle"
  },
}
