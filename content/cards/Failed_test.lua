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
      local hands = {
        ["High Card"] = 10,
        ["Pair"] = 30,
        ["Two Pair"] = 25,
        ["Three of a Kind"] = 15,
        ["Straight"] = 10,
        ["Flush"] = 10,
        ["Full House"] = 7,
        ["Four of a Kind"] = 3,
        ["Straight Flush"] = 1
      }

      local pool = {}

      for hand, weight in pairs(hands) do
        if G.GAME.hands[hand] and G.GAME.hands[hand].visible then
          for _ = 1, weight do
            pool[#pool + 1] = hand
          end
        end
      end

      if #pool > 0 then
        card.ability.extra.hand = pseudorandom_element(pool, pseudoseed("failed_test"))
      end
    end
  end,
}
