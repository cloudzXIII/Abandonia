SMODS.Joker {
  key = 'union_jack',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    return { vars = {} }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 2, y = 8 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { repetitions = 1, condition = false } },

  calculate = function(self, card, context)
    if context.before then
      local bonus = false
      local mult = false
      for _, playing_card in ipairs(context.full_hand) do
        if SMODS.has_enhancement(playing_card, "m_bonus") then
          bonus = true
        end
        if SMODS.has_enhancement(playing_card, "m_mult") then
          mult = true
        end
      end
      card.ability.extra.condition = mult and bonus
    end
    if context.repetition and context.cardarea == G.play and card.ability.extra.condition == true then
      return {
        repetitions = card.ability.extra.repetitions
      }
    end
  end,
  abn_artist_credits = {
    artist = "Applemania",
  },
  in_pool = function(self, args)
    local bonus = false
    local mult = false
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, "m_bonus") then
        bonus = true
      end
      if SMODS.has_enhancement(playing_card, "m_mult") then
        mult = true
      end
    end
    return mult and bonus
  end
}
