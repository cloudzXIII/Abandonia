SMODS.Joker {
  key = 'sailor_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_ocean
    return { vars = { card.ability.extra.chips } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 9, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 9, repetitions = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == "unscored" and ABN.is_odd(context.other_card) then
      return {
        chips = card.ability.extra.chips,
      }
    end
    if context.repetition and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_abn_ocean") then
      return {
        repetitions = card.ability.extra.repetitions
      }
    end
  end,
  abn_artist_credits = {
    artist = "Morphine Milkshake",
  },
  enhancement_gate = "m_abn_ocean"
}
