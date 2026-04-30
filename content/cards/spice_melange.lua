-- Spice Melange
-- Coded by J8-Bit
-- Retriggers Joker to the left for the next x (5) hands


SMODS.Joker {
  key = 'spice_melange',

  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = false,
  config = {
    extra = {
      repetitions = 1,
      hands_left = 5,
    },
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.hands_left
      }
    }
  end,
  rarity = 2,
  cost = 6,
  atlas = 'ABNJokerSheet3',
  pos = { x = 5, y = 4 },
  pools = { Food = true },
  discovered = false,
  calculate = function(self, card, context)
    if context.retrigger_joker_check and (ABN.get_pos(card, G.jokers.cards) > 1 and context.other_card == G.jokers.cards[ABN.get_pos(card, G.jokers.cards) - 1]) then
      return { repetitions = card.ability.extra.repetitions }
    end
    if context.after and not context.blueprint then
      if card.ability.extra.hands_left - 1 <= 0 then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER
        }
      else
        card.ability.extra.hands_left = card.ability.extra.hands_left - 1
        return {
          message = card.ability.extra.hands_left .. '',
          colour = G.C.FILTER
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Podder"
  },
}
