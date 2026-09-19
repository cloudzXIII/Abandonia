SMODS.Joker {
  key = 'failed_test',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.hand, 'poker_hands')
      }
    }
  end,

  rarity = 2,
  atlas = "ABNJokerSheet26",
  pos = { x = 6, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      hand = "High Card",
    }
  },

  calculate = function(self, card, context)
    if context.joker_main and context.scoring_name == card.ability.extra.hand then
      local chips = 0

      for _, scored_card in ipairs(context.scoring_hand) do
        chips = chips + scored_card:get_chip_bonus()
      end

      if chips > 0 then
        return {
          x_mult = chips
        }
      end
    end

    if context.after and not context.blueprint then
      card.ability.extra.hand = ABN.poll_poker_hand("abn_failed_test")
    end
  end,
}
