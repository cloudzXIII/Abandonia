SMODS.Joker {
  key = 'lost_media',

  loc_vars = function(self, info_queue, card)
    local missing_ranks = ABN.get_missing_ranks() or {}
    local ranks = (#missing_ranks > 0) and table.concat(missing_ranks, ", ") or "None"
    local xmult = 1 + (#missing_ranks * card.ability.extra.x_mult_gain)
    return { vars = { xmult, card.ability.extra.x_mult_gain, ranks } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet3',
  pos = { x = 3, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult_gain = 0.75, missing_ranks = "None" } },

  calculate = function(self, card, context)
    if context.joker_main then
      local missing_ranks = ABN.get_missing_ranks()
      if #missing_ranks > 0 then
        return {
          x_mult = 1 + (#missing_ranks * card.ability.extra.x_mult_gain)
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Morphine Milkshake",
  },
  in_pool = function(self, args)
    local missing_ranks = ABN.get_missing_ranks()
    return missing_ranks and #missing_ranks > 0
  end,
}
