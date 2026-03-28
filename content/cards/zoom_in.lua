SMODS.Joker {
  key = 'zoom_in',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.mult_gain
      }
    }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 6, y = 9 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      mult = 0,
      mult_gain = 4
    },
  },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local has_number = false
      local has_ace = false
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_number(v) then
          has_number = true
        end
        if v:get_id() == 14 then
          has_ace = true
        end
      end
      if has_number and has_ace then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          operation = '+',
        })
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "70unik"
  },
}
