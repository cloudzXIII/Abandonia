SMODS.Joker {
  key = 'moai_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    return { vars = { card.ability.extra.mult, card.ability.extra.dollars } }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 0, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 1, dollars = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card then
      if SMODS.has_enhancement(context.other_card, "m_stone") then
        context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0)
            + card.ability.extra.mult
        context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) +
            card.ability.extra.dollars
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.FILTER
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "IPreferCheddar"
  },
}
