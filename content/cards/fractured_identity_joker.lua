SMODS.Joker {
  key = 'fractured_identity_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 7, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { multechips = 1.7, glassemult = 1.4, steelechips = 1.7, stoneemult = 1.4 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    return {
      vars = {
        card.ability.extra.multechips,
        card.ability.extra.glassemult,
        card.ability.extra.steelechips,
        card.ability.extra.stoneemult,
      }
    }
  end,

  in_pool = function(self)
    -- is jimbo stake?
    local is_jimbo_stake = G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
    if not is_jimbo_stake then return false end

    if not G.playing_cards then return false end

    -- do we have any of the cards for it?
    for _, card in ipairs(G.playing_cards) do
      if card and card.config and card.config.center then
        local center = card.config.center
        if center == G.P_CENTERS.m_glass or
        center == G.P_CENTERS.m_mult or
        center == G.P_CENTERS.m_steel or
        center == G.P_CENTERS.m_stone then
          return true -- Both conditions met!
        end
      end
    end

    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card

      if target_card.config.center == G.P_CENTERS.m_mult then
        return {
          echips = card.ability.extra.multechips
        }
      elseif target_card.config.center == G.P_CENTERS.m_glass then
        return {
          emult = card.ability.extra.glassemult
        }
      elseif target_card.config.center == G.P_CENTERS.m_steel then
        return {
          echips = card.ability.extra.steelechips
        }
      elseif target_card.config.center == G.P_CENTERS.m_stone then
        return {
          emult = card.ability.extra.stoneemult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Grassy & Vega",
  },
}
