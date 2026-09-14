SMODS.Joker {
  key = 'construction_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    local cae = card.ability.extra

    return { vars = { cae.chips, cae.xmult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 1, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 100, xmult = 1.3 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_steel") then
        return {
          chips = card.ability.extra.chips
        }
      end

      if SMODS.has_enhancement(context.other_card, "m_stone") then
        return {
          xmult = card.ability.extra.xmult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Littlesamu"
  },
}
