SMODS.Joker {
  key = 'immolation_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 8, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_oilfire
  end,
  enhancement_gate = "m_abn_oilfire",

  abn_artist_credits = {
    artist = "Vlambambo",
  },
}
