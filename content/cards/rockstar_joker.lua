local config = SMODS.current_mod.config


SMODS.Sound({
  key = 'music_rockstar',
  path = 'music_rockstar.ogg',
  pitch = 1,
  speed = 1,
  select_music_track = function(self)
    -- cool theme by GaMetal
    if G.jokers then
      for i = 1, #G.jokers.cards do
        local j = G.jokers.cards[i]
        if j.config.center.key and j.config.center.key == 'j_abn_rockstar_joker' and config.Music ~= false then
          return 1e10
        end
      end
    end
  end
})

SMODS.Joker {
  key = 'rockstar_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet26',
  pos = { x = 2, y = 5 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xchips = 1.0,
      xchips_add = 0.05,
      xmult = 1.0,
      xmult_add = 0.05,
      e_mult = 1.0,
      e_mult_add = 0.01,
      e_chips = 1.0,
      e_chips_add = 0.01
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips,
        card.ability.extra.xchips_add,
        card.ability.extra.xmult,
        card.ability.extra.xmult_add,
        card.ability.extra.e_mult_add,
        card.ability.extra.e_chips_add,
        card.ability.extra.e_mult,
        card.ability.extra.e_chips
      }
    }
  end,

  calculate = function(self, card, context)
    -- Individual card evaluation (Stone or Steel played or in hand)
    if context.individual then
      local other = context.other_card
      local is_stone = other.config.center == G.P_CENTERS.m_stone or other.ability.effect == 'Stone Card'
      local is_steel = other.config.center == G.P_CENTERS.m_steel or other.ability.effect == 'Steel Card'

      if is_stone and (context.cardarea == G.play or context.cardarea == G.hand) then
        card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_add
        return { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }
      end

      if is_steel and (context.cardarea == G.hand or context.cardarea == G.play) and not context.end_of_round then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_add
        return { message = localize('k_upgrade_ex'), colour = G.C.MULT }
      end
    end

    -- Give XChips / XMult to other Jokers with Stone / Steel
    if context.other_joker and context.other_joker.ability then
      local other = context.other_joker
      local is_stone = other.ability.abn_stk_stone or other.config.center == G.P_CENTERS.m_stone
      local is_steel = other.ability.abn_stk_steel or other.config.center == G.P_CENTERS.m_steel

      if is_stone or is_steel then
        return {
          xchips = is_stone and card.ability.extra.xchips or nil,
          xmult = is_steel and card.ability.extra.xmult or nil,
          colour = G.C.ATTENTION
        }
      end
    end

    -- End-of-round exponential scaling based on Joker's own enhancement
    if context.final_scoring_step and not context.repetition and not context.blueprint then
      if SMODS.calculate_round_score() > (G.GAME.blind and G.GAME.blind.chips or 0) then
        local is_steel = card.ability.abn_stk_steel or card.config.center == G.P_CENTERS.m_steel
        local is_stone = card.ability.abn_stk_stone or card.config.center == G.P_CENTERS.m_stone

        if is_steel then
          card.ability.extra.e_mult = card.ability.extra.e_mult + card.ability.extra.e_mult_add
          return { message = localize('k_upgrade_ex'), colour = G.C.MULT }
        end
        if is_stone then
          card.ability.extra.e_chips = card.ability.extra.e_chips + card.ability.extra.e_chips_add
          return { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }
        end
      end
    end

    -- Main scoring phase
    if context.joker_main then
      local has_emult = card.ability.extra.e_mult > 1
      local has_echips = card.ability.extra.e_chips > 1

      if has_emult or has_echips then
        return {
          e_mult = has_emult and card.ability.extra.e_mult or nil,
          e_chips = has_echips and card.ability.extra.e_chips or nil
        }
      end
    end
  end,

  abn_artist_credits = { artist = "Comykel" },
}