-- Spare Bikini (coded by cloudzXIII)

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
  key = 'spare_bikini',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain, localize(cae.type, 'poker_hands'), cae.asc, cae.asc_gain } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet23',
  pos = { x = 8, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { mult = 0, mult_gain = 5, type = "Five of a Kind", asc = 0, asc_gain = 0.02 } },

  calculate = function(self, card, context)
    if context.before and next(context.poker_hands[card.ability.extra.type]) and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
        message_colour = G.C.MULT,
      })
      local unique_suits = count_unique(context.scoring_hand, "suit")
      if unique_suits == 5 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "asc",
          scalar_value = "asc_gain",
          operation = '+',
          message_colour = G.C.GOLD,
        })
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        asc = card.ability.extra.asc
      }
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}
