SMODS.Joker {
  key = 'plank_joker',
  rarity = 1,
  cost = 6,
  atlas = 'ABNJokerSheet21',
  pos = { x = 0, y = 0 },
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      asc_mod = 0.03
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_plank
    return {
      vars = {
        card.ability.extra.asc_mod
      }
    }
  end,

  in_pool = function(self)
    if not G.playing_cards then return false end

    for _, card in ipairs(G.playing_cards) do
      if card and card.config and card.config.center then
        if card.config.center == G.P_CENTERS.m_abn_plank then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.before and context.scoring_hand then
      for _, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card.config.center == G.P_CENTERS.m_abn_plank then
          if scoring_card.ability and scoring_card.ability.extra and scoring_card.ability.extra.ascension then
            scoring_card.ability.extra.ascension = scoring_card.ability.extra.ascension + card.ability.extra.asc_mod

            card_eval_status_text(scoring_card, 'extra', nil, nil, nil, {
              message = localize('k_upgrade_ex'),
              colour = G.C.GOLD
            })
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Super Thing",
  },
}