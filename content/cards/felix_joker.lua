function ABN.reset_felix_joker()
  local pool = {}
  for _, v in ipairs(G.P_CENTER_POOLS.Enhanced) do
    if v.key ~= "m_wild" then pool[#pool + 1] = v.key end
  end
  G.GAME.current_round.felix_joker_enhancement = SMODS.poll_enhancement({
    key = "abn_felix_joker",
    guaranteed = true,
    options =
        pool
  })
end

SMODS.Joker {
  key = 'felix_joker',

  loc_vars = function(self, info_queue, card)
    local current_enh = G.GAME.current_round.felix_joker_enhancement or "m_mult"
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    info_queue[#info_queue + 1] = G.P_CENTERS[current_enh]
    return {
      vars = {
        localize({ type = 'name_text', key = current_enh, set = 'Enhanced' }),
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 2, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  calculate = function(self, card, context)
    if context.check_enhancement and context.other_card.config.center_key == "m_wild" then
      local current_enh = G.GAME.current_round.felix_joker_enhancement or "m_mult"
      return {
        [current_enh] = true,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Littlesamu",
  },
}
