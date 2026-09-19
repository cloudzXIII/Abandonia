SMODS.Joker {
  key = 'exciton_event',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local numerator, denominator = SMODS.get_probability_vars(card, cae.base, cae.odds)

    return {
      vars = {
        numerator,
        denominator,
        cae.amount
      }
    }
  end,

  rarity = 3,
  atlas = "ABNJokerSheet26",
  pos = { x = 7, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  config = { extra = { base = 1, odds = 8, amount = 2 } },
  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable and context.consumeable.ability.set == 'Planet' then
      local hand = ABN.poll_poker_hand("abn_exciton_event")
      SMODS.calculate_effect({ message = localize('k_level_up_ex'), colour = G.C.GREEN },
        context.blueprint_card or card)

      SMODS.smart_level_up_hand(card, hand, nil, card.ability.extra.amount)

      if SMODS.pseudorandom_probability(card, 'abn_exciton_event', card.ability.extra.base, card.ability.extra.odds) then
        local deck_cards = {}

        for _, c in ipairs(G.deck.cards) do
          deck_cards[#deck_cards + 1] = c
        end

        local cards_to_destroy = {}

        for i = 1, math.floor(#deck_cards * 0.75) do
          if #deck_cards > 0 then
            local index = pseudorandom("exciton_destroy_card", 1, #deck_cards)
            cards_to_destroy[#cards_to_destroy + 1] = deck_cards[index]
          end
        end

        SMODS.destroy_cards(cards_to_destroy)
        return {
          message = localize("k_abn_destroyed"),
          colour = G.C.RED,
        }
      end
    end
  end,
}
