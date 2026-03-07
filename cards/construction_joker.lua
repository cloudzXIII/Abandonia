SMODS.Joker {
  key = 'construction_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    return { vars = { card.ability.extra.mult, card.ability.extra.dollars } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 1, y = 4 },
  cost = 4,
  discovered = true,
  blueprint_compat = true,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.check_enhancement then
      if context.other_card.config.center.key == "m_steel" then
        return { m_stone = true }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Littlesamu"
  },
}
