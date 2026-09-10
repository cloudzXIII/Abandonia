SMODS.Joker {
  key = 'bark_joker',
  rarity = 2,
  cost = 8,
  atlas = 'ABNJokerSheet3',
  pos = { x = 6, y = 3 },
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xmult = 1,
      xmultadd = 0.1,
      ascension = 0,
      asc_mod = 0.03
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_plank
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xmultadd,
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
      if context.other_card and context.other_card.config.center == G.P_CENTERS.m_abn_plank then
        if not context.blueprint then
          card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd
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
        xmult = card.ability.extra.xmult,
        asc = card.ability.extra.ascension
      }
    end
  end,

  abn_artist_credits = {
    artist = "Sustato",
  },
}