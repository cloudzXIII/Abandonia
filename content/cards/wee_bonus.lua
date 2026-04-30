SMODS.Joker {
  key = 'wee_bonus',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    return { vars = { card.ability.extra.chips } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet2',
  pos = { x = 6, y = 2 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 3 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_number(context.other_card) and SMODS.has_enhancement(context.other_card, "m_bonus") then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0)
            + card.ability.extra.chips
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Triangle_snack"
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_bonus') then
        return true
      end
    end
    return false
  end
}
