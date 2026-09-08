SMODS.Joker {
  key = 'old_growth_joker',
  rarity = 3,
  cost = 10,
  atlas = 'ABNJokerSheet5',
  pos = { x = 4, y = 1 },
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 0,
      ascension = 0,
      asc_mod = 0.03
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_plank
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.ascension,
        card.ability.extra.asc_mod
      }
    }
  end,

  in_pool = function(self, args)
    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.config.center == G.P_CENTERS.m_abn_plank then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local other = context.other_card
      if other and other.config.center == G.P_CENTERS.m_abn_plank and ABN.is_number(other) then
        if not context.blueprint then
          local nominal_val = other.base and other.base.nominal or 0
          local gained_mult = nominal_val * 3

          card.ability.extra.mult = card.ability.extra.mult + gained_mult
          card.ability.extra.ascension = card.ability.extra.ascension + card.ability.extra.asc_mod
        end

        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.GOLD,
          card = card
        }
      end
    end


    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        asc = card.ability.extra.ascension
      }
    end
  end,

  abn_artist_credits = {
    artist = "D.J.",
  },
}