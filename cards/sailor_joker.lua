SMODS.Joker {
  key = 'sailor_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    return { vars = { card.ability.extra.chips, card.ability.extra.mult_gain, card.ability.extra.mult } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 9, y = 1 },
  cost = 8,
  discovered = true,
  blueprint_compat = true,

  config = { extra = { chips = 40, mult = 0, mult_gain = 1 } },

  calculate = function(self, card, context)
    if context.before then
      local condition = false
      for _, playing_card in ipairs(context.full_hand) do
        if SMODS.has_enhancement(playing_card, "m_bonus") or SMODS.has_enhancement(playing_card, "m_wild") then
          condition = true
        end
      end
      if condition then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          operation = '+',
        })
      end
    end
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_bonus") or SMODS.has_enhancement(context.other_card, "m_wild") then
        return {
          chips = card.ability.extra.chips
        }
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Morphine Milkshake",
  },
  in_pool = function(self, args)
    local bonus = false
    local wild = false
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, "m_bonus") then
        bonus = true
      end
      if SMODS.has_enhancement(playing_card, "m_wild") then
        wild = true
      end
    end
    return wild and bonus
  end
}
