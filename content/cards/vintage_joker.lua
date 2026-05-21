-- Vintage Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'vintage_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_fossil
    return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain, } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 2, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, chips_gain = 20, } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_abn_fossil") then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          operation = '+',
          message_key = "a_chips"
        })
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Creechie Doctrine",
  },
  in_pool = function(self)
    for _, card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(card, "m_abn_fossil") then
        return true
      end
    end
    return false
  end,
}
