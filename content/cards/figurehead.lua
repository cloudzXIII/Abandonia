SMODS.Joker {
  key = 'figurehead',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.repetitions } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 7, y = 23 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { repetitions = 1 } },

  calculate = function(self, card, context)
    if context.retrigger_joker_check and context.other_card:is_rarity(4) then
      return { repetitions = 1 }
    end
  end,
  abn_artist_credits = {
    artist = "RattlingSnow353"
  },
  in_pool = function(self, args)
    for _, joker in pairs(G.jokers.cards or {}) do
      if joker and joker:is_rarity(4) then
        return true
      end
    end
    return false
  end
}
