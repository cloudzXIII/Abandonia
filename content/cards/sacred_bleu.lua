local count_unique = function(area, type)
  local cards = {}
  local thingy = type == "suit" and "suit" or type == "rank" and "value"

  for _, v in ipairs(area) do
    cards[v.base[thingy]] = true
  end

  local unique = 0
  for _ in pairs(cards) do
    unique = unique + 1
  end

  return unique
end

SMODS.Joker {
  key = "sacred_bleu",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.xmult_gain,
        card.ability.extra.chips,
        card.ability.extra.chips_gain
      }
    }
  end,

  rarity = 2,
  atlas = "AbandoniaJokers",
  pos = { x = 6, y = 28 },
  soul_pos = { x = 7, y = 28 },
  cost = 7,

  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      x_mult = 1,
      xmult_gain = 0.1,
      chips = 0,
      chips_gain = 10
    }
  },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local unique_suits = count_unique(context.scoring_hand, "suit")
      local unique_ranks = count_unique(context.scoring_hand, "rank")
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_mult",
        scalar_value = "xmult_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + unique_suits * change
        end,
        no_message = true
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + unique_ranks * change
        end,
      })
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bunnet"
  },
}
