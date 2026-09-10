SMODS.Joker {
  key = 'plug_in_joker',
  rarity = 1,
  cost = 6,
  atlas = 'ABNJokerSheet21',
  pos = { x = 8, y = 3 },
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 0,
      chips = 0,
      ascension = 0,
      multadd = 4,
      chipsadd = 10,
      asc_mod = 0.25
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_plank
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
        card.ability.extra.ascension,
        card.ability.extra.multadd,
        card.ability.extra.chipsadd,
        card.ability.extra.asc_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local other = context.other_card
      if other then
        local center = other.config.center
        local upgraded = false
        local msg_col = G.C.FILTER

        if center == G.P_CENTERS.m_mult then
          if not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
          end
          upgraded = true
          msg_col = G.C.MULT
        elseif center == G.P_CENTERS.m_bonus then
          if not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
          end
          upgraded = true
          msg_col = G.C.CHIPS
        elseif center == G.P_CENTERS.m_abn_plank then
          if not context.blueprint then
            card.ability.extra.ascension = card.ability.extra.ascension + card.ability.extra.asc_mod
          end
          upgraded = true
          msg_col = G.C.GOLD
        end

        if upgraded then
          return {
            message = localize('k_upgrade_ex'),
            colour = msg_col,
            card = card
          }
        end
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
        asc = card.ability.extra.ascension
      }
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}
