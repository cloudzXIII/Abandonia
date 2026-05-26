-- Prehistoric Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'prehistoric_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_fossil
    local cae = card.ability.extra
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.x_chips, cae.x_chips_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet6',
  pos = { x = 2, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_chips = 1, x_chips_gain = 0.1, x_mult = 1, x_mult_gain = 0.1 } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_stone") then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          operation = '+',
        })
      end
      if SMODS.has_enhancement(context.other_card, "m_abn_fossil") then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
          operation = '+',
        })
      end
    end
    if context.joker_main then
      return {
        x_chips = card.ability.extra.x_chips > 1 and card.ability.extra.x_chips or nil,
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "???",
  },
}
