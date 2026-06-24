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
  key = 'sacred_rouge',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.xmult_gain,
        card.ability.extra.mult,
        card.ability.extra.mult_gain
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet6',
  pos = { x = 5, y = 5 },
  soul_pos = { x = 8, y = 5 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      x_mult = 1,
      xmult_gain = 0.02,
      mult = 0,
      mult_gain = 4
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
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + unique_ranks * change
        end,
      })
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Bunnet"
  },
}
