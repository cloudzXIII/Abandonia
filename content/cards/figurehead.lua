SMODS.Joker {
  key = 'figurehead',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.repetitions } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 7, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { repetitions = 1 } },

  calculate = function(self, card, context)
    if context.retrigger_joker_check and context.other_card.config.center and context.other_card.config.center.rarity and context.other_card.config.center.rarity == 4 then
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
