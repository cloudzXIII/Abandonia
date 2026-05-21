-- Jimbo 10 (coded by cloudzXIII)
SMODS.Joker {
  key = 'jimbo_10',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local ten_tally = 0
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card:get_id() == 10 then ten_tally = ten_tally + 1 end
    end
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.chips, cae.chips_gain, cae.dollars, cae.dollars * ten_tally } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 8, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 1, x_mult_gain = 0.1, chips = 0, chips_gain = 10, dollars = 1 } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == 10 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          operation = '+',
          no_message = true,
        })
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          operation = '+',
        })
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        x_mult = card.ability.extra.x_mult,
      }
    end
  end,
  calc_dollar_bonus = function(self, card)
    local ten_tally = 0
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card:get_id() == 10 then ten_tally = ten_tally + 1 end
    end
    return ten_tally > 0 and card.ability.extra.dollars * ten_tally or nil
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
  in_pool = function(self)
    return (G.GAME.abn_letters_activated or 0) > 0
  end
}
