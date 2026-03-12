SMODS.Joker {
  key = 'wee_mult',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    return { vars = { card.ability.extra.x_mult } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 5, y = 7 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 0.1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if ABN.is_number(context.other_card) and SMODS.has_enhancement(context.other_card, "m_mult") then
        context.other_card.ability.perma_x_mult = (context.other_card.ability.perma_x_mult or 0)
            + card.ability.extra.x_mult
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.XMULT
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Triangle_snack"
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_mult') then
        return true
      end
    end
    return false
  end
}
