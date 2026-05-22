-- Ironworks (coded by cloudzXIII)
SMODS.Joker {
  key = 'ironworks',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_hot_iron
    local cae = card.ability.extra

    local steel_tally = 0
    local hot_iron_tally = 0
    if G.playing_cards then
      for _, playing_card in ipairs(G.playing_cards) do
        if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
        if SMODS.has_enhancement(playing_card, 'm_abn_hot_iron') then hot_iron_tally = hot_iron_tally + 1 end
      end
    end
    return { vars = { cae.xchips, 1 + cae.xchips * steel_tally, cae.xmult, 1 + cae.xmult * hot_iron_tally } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet9',
  pos = { x = 6, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 0.2, xchips = 0.1 } },
  calculate = function(self, card, context)
    if context.joker_main then
      local steel_tally = 0
      local hot_iron_tally = 0
      if G.playing_cards then
        for _, playing_card in ipairs(G.playing_cards) do
          if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
          if SMODS.has_enhancement(playing_card, 'm_abn_hot_iron') then hot_iron_tally = hot_iron_tally + 1 end
        end
      end
      return {
        x_chips = 1 + card.ability.extra.xchips * steel_tally,
        x_mult = 1 + card.ability.extra.xmult * hot_iron_tally,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Null",
  },
  in_pool = function(self)
    local hot_iron = false
    local steel = false
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_steel') then steel = true end
      if SMODS.has_enhancement(playing_card, 'm_abn_hot_iron') then hot_iron = true end
    end
    return hot_iron and steel
  end
}
