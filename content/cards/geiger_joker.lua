SMODS.Joker {
  key = 'geiger_joker',
  rarity = 3,
  cost = 6,
  atlas = 'ABNJokerSheet21',
  pos = { x = 3, y = 0 },
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      asc_mod = 1
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_hazard
    return {
      vars = {
        card.ability.extra.asc_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local other = context.other_card
      if other and other.config.center == G.P_CENTERS.m_abn_hazard and ABN.is_number(other) then
        local target_rank = other.base.nominal
        local rank_count = 0

        if context.scoring_hand then
          for _, sc in ipairs(context.scoring_hand) do
            if ABN.is_number(sc) and sc.base.nominal == target_rank then
              rank_count = rank_count + 1
            end
          end
        end

        local given_asc = rank_count * card.ability.extra.asc_mod

        if given_asc > 0 then
          return {
            asc = given_asc,
            card = card
          }
        end
      end
    end
  end,

  in_pool = function(self, args)
    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.config.center == G.P_CENTERS.m_abn_hazard then
          return true
        end
      end
    end
    return false
  end,

  abn_artist_credits = {
    artist = "Super Thing",
  },
}
