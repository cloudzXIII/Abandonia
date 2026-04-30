SMODS.Joker {
  key = 'codding_error',
  rarity = 2,
  atlas = 'ABNJokerSheet6',
  pos = { x = 3, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      current = "Even",
      repetitions = 1,
    },
  },
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if ABN.is_even(context.other_card) and card.ability.extra.current == "Even" then
        return {
          repetitions = card.ability.extra.repetitions
        }
      end
      if ABN.is_odd(context.other_card) and card.ability.extra.current == "Odd" then
        return {
          repetitions = card.ability.extra.repetitions
        }
      end
    end
    if context.end_of_round and context.cardarea == G.jokers and not context.retrigger_joker_check and not context.blueprint then
      if card.ability.extra.current == "Even" then
        card.ability.extra.current = "Odd"
      else
        card.ability.extra.current = "Even"
      end
    end
  end,

  abn_artist_credits = {
    artist = "TanTanich",
  },
  loc_vars = function(self, info_queue, card)
    local rank_type = ""
    if card.ability.extra.current == "Even" then
      rank_type = localize("k_abn_even")
    else
      rank_type = localize("k_abn_odd")
    end
    return {
      vars = {
        rank_type
      },
    }
  end,
}
