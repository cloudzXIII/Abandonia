-- Ansatz Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'ansatz_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.chips_gain, cae.mult, cae.mult_gain, localize(cae.type, 'poker_hands'), } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet14',
  pos = { x = 0, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 2, chips = 0, chips_gain = 5, type = "Straight" } },
  calculate = function(self, card, context)
    if context.before and not context.blueprint and next(context.poker_hands[card.ability.extra.type]) then
      local evens = 0
      local odds = 0
      for _, v in ipairs(context.scoring_hand) do
        if ABN.is_even(v) then
          evens = evens + 1
        end
        if ABN.is_odd(v) then
          odds = odds + 1
        end
      end
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + evens * change
        end,
        no_message = true
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + odds * change
        end,
      })
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Nevermade",
  },
}
