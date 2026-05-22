-- Elated Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'elated_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain, cae.chips, cae.chips_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 2, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 2, chips = 0, chips_gain = 4 } },

  calculate = function(self, card, context)
    if context.pre_discard then
      local suits = {}
      for _, v in ipairs(context.full_hand) do
        suits[v.base.suit] = true
      end

      local unique_suits = 0
      for _ in pairs(suits) do
        unique_suits = unique_suits + 1
      end
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + unique_suits * change
        end,
      })
    end

    if context.before and not context.blueprint then
      local suits = {}
      for _, v in ipairs(context.scoring_hand) do
        suits[v.base.suit] = true
      end

      local unique_suits = 0
      for _ in pairs(suits) do
        unique_suits = unique_suits + 1
      end

      if unique_suits >= 4 then -- haven't tested, but this may work?
        for _, v in ipairs(context.scoring_hand) do
          v.debuff = false
        end
      end

      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + unique_suits * change
        end,
        message_key = "a_chips"
      })
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,

  abn_artist_credits = {
    artist = "NiceCream",
  },
}
