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
      current = "even",
      repetitions = 1,
    },
  },
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if ABN.is_even(context.other_card) and card.ability.extra.current == "even" then
        return {
          repetitions = card.ability.extra.repetitions
        }
      end
      if ABN.is_odd(context.other_card) and card.ability.extra.current == "odd" then
        return {
          repetitions = card.ability.extra.repetitions
        }
      end
    end
    if context.end_of_round and context.cardarea == G.jokers and not context.retrigger_joker_check and not context.blueprint then
      if card.ability.extra.current == "even" then
        SMODS.calculate_effect({ message = localize("k_abn_odd") }, card)
        card.ability.extra.current = "odd"
      else
        SMODS.calculate_effect({ message = localize("k_abn_even") }, card)
        card.ability.extra.current = "even"
      end
    end
  end,

  abn_artist_credits = {
    artist = "TanTanich",
  },
  loc_vars = function(self, info_queue, card)
    local rank_type = ""
    if card.ability.extra.current == "even" then
      rank_type = localize("k_abn_even")
    else
      rank_type = localize("k_abn_odd")
    end
    return {
      vars = {
        rank_type
      },
      key = self.key .. '_' .. card.ability.extra.current,
    }
  end,
}
