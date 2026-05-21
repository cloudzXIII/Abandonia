SMODS.Joker {
  key = 'scantron_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.BLACK, G.C.WHITE, 1.0)
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 8, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { luckyechips = 1.7, bonusemult = 1.4, goldechips = 1.7, wildemult = 1.4 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.luckyechips,
        card.ability.extra.bonusemult,
        card.ability.extra.goldechips,
        card.ability.extra.wildemult,
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
        if center == G.P_CENTERS.m_bonus or
        center == G.P_CENTERS.m_lucky or
        center == G.P_CENTERS.m_gold or
        center == G.P_CENTERS.m_wild then
          return true -- Both conditions met!
        end
      end
    end

    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card

      if target_card.config.center == G.P_CENTERS.m_lucky then
        return {
          echips = card.ability.extra.luckyechips
        }
      elseif target_card.config.center == G.P_CENTERS.m_bonus then
        return {
          emult = card.ability.extra.bonusemult
        }
      elseif target_card.config.center == G.P_CENTERS.m_gold then
        return {
          echips = card.ability.extra.goldechips
        }
      elseif target_card.config.center == G.P_CENTERS.m_wild then
        return {
          emult = card.ability.extra.wildemult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Inky",
  },
}
