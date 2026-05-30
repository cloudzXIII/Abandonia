-- Dark Tie Joker (coded by cloudzXIII)
-- TODO: "If they're retrigger for like red seal or lavender it would increase more" - Bunnet :thonk:
SMODS.Joker {
  key = 'dark_tie',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain, cae.chips, cae.chips_gain } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet13',
  pos = { x = 8, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, chips = 0, mult_gain = 4, chips_gain = 2 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local evens = 0
      local odds = 0
      for _, scoring_card in ipairs(context.scoring_hand) do
        if scoring_card.base.suit == "abn_suitless" then
          if ABN.is_even(scoring_card) then
            evens = evens + 1
          elseif ABN.is_odd(scoring_card) then
            odds = odds + 1
          end
        end
      end

      local pairs = math.floor(evens / 2) + math.floor(odds / 2)

      if evens > 0 and odds > 0 and pairs > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + pairs * change
          end,
          no_message = true
        })
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + pairs * change
          end,
        })
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Donut",
  },
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if playing_card.base.suit == "abn_suitless" then
        return true
      end
    end
    return false
  end
}
