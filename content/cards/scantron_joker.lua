SMODS.Joker {
  key = 'scantron_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet12',
  pos = { x = 8, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { echips = 1.7, emult = 1.4, } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    return {
      vars = {
        card.ability.extra.echips,
        card.ability.extra.emult,
      }
    }
  end,

  in_pool = function(self)
    local is_jimbo_stake = G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
    if not is_jimbo_stake then return false end

    for _, card in ipairs(G.playing_cards or {}) do
      if card and next(SMODS.get_enhancements(card)) then
        if SMODS.has_enhancement(card, "m_lucky") or
        SMODS.has_enhancement(card, "m_gold") or
        SMODS.has_enhancement(card, "m_wild") or
        SMODS.has_enhancement(card, "m_bonus") then
          return true
        end
      end
    end

    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local ret = {}
      if SMODS.has_enhancement(context.other_card, "m_lucky") or SMODS.has_enhancement(context.other_card, "m_gold") then
        return {
          echips = card.ability.extra.echips
        }
      end

      if SMODS.has_enhancement(context.other_card, "m_bonus") or SMODS.has_enhancement(context.other_card, "m_wild") then
        return {
          emult = card.ability.extra.emult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Inky",
  },
}
