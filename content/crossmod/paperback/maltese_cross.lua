SMODS.Joker {
  key = 'maltese_cross',
  rarity = 2,
  atlas = 'ABNJokerSheet18',
  pos = { x = 5, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 5,
      ranks_scored = {}
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local other = context.other_card

      if other:get_id() and not other.debuffed then
        local rank_id = other:get_id()
        card.ability.extra.ranks_scored[rank_id] = (card.ability.extra.ranks_scored[rank_id] or 0) + 1

        if other.config.center.key == 'm_paperback_domino' then
          local rank_times_scored = card.ability.extra.ranks_scored[rank_id]
          local chip_bonus = card.ability.extra.chips * rank_times_scored

          other.ability.perma_bonus = (other.ability.perma_bonus or 0) + chip_bonus

          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = card
          }
        end
      end
    end

    if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
      card.ability.extra.ranks_scored = {}
    end
  end,

  abn_artist_credits = {
    artist = "Papermoon & B.b.b.b",
  },
}