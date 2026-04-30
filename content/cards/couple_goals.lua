SMODS.Joker {
  key = 'couple_goals',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet2',
  pos = { x = 3, y = 4 },
  cost = 15,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 1, x_mult_gain = 0.5 } },

  calculate = function(self, card, context)
    if context.before then
      local odd = false
      local even = false
      for _, playing_card in ipairs(context.scoring_hand) do
        if ABN.is_odd(playing_card) then
          odd = true
        end
        if ABN.is_even(playing_card) then
          even = true
        end
      end
      if odd and even then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          operation = '+',
        })
      end
    end
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Garb",
  },
  in_pool = function(self, args)
    local odd = false
    local even = false
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if ABN.is_odd(playing_card) then
        odd = true
      end
      if ABN.is_even(playing_card) then
        even = true
      end
    end
    return odd and even
  end
}
