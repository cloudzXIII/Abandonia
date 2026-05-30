-- Detonation Button (coded by cloudzXIII)

local function abn_has_detonation_enhancment(card)
  for _, enhancement in ipairs({ "m_mult", "m_bonus", "m_steel", "m_wild" }) do
    if SMODS.has_enhancement(card, enhancement) then
      return true
    end
  end
  return false
end

SMODS.Joker {
  key = 'detonation_button',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    return { vars = { card.ability.extra.xmult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet6',
  pos = { x = 7, y = 2 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 0.1 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local condition = false
      for _, scoring_card in ipairs(context.scoring_hand) do
        if abn_has_detonation_enhancment(scoring_card) then
          condition = true
          break
        end
      end
      if not condition then
        SMODS.destroy_cards(card)
        SMODS.calculate_effect({ message = localize('k_abn_destroyed'), colour = G.C.RED }, card)
      end
    end
    if context.individual and context.cardarea == G.play then
      if abn_has_detonation_enhancment(context.other_card) then
        context.other_card.ability.perma_x_mult = (context.other_card.ability.perma_x_mult or 0) +
        card.ability.extra.xmult
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.XMULT
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Flote"
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if abn_has_detonation_enhancment(playing_card) then
        return true
      end
    end
    return false
  end
}
