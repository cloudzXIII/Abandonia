SMODS.Joker {
  key = 'streetart_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet3',
  pos = { x = 1, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    return {
      vars = {
        localize({ type = 'name_text', key = "m_stone", set = "Enhanced" }),
        localize({ type = 'name_text', key = "m_abn_polkadot", set = "Enhanced" }),
        localize({ type = 'name_text', key = "m_wild", set = "Enhanced" }),
      }
    }
  end,

  calculate = function(self, card, context)
    if context.check_enhancement and context.other_card.config.center_key == "m_stone" or context.check_enhancement and context.other_card.config.center_key == "m_abn_polkadot" then
      return {
        m_wild = true --make cards function as wild cards
      }
    end
  end,

  abn_artist_credits = {
    artist = "EverSoNitro",
  },
}
