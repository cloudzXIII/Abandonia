-- 1, 2 Joker (coded by cloudzXIII)
SMODS.Joker {
  key = '1_2_joker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips
      },
      key = self.key .. '_' .. card.ability.extra.current,
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet18',
  pos = { x = 1, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, current = "even" } },
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      if card.ability.extra.current == "even" then
        SMODS.calculate_effect({ message = localize("k_abn_odd") }, card)
        card.ability.extra.current = "odd"
      else
        SMODS.calculate_effect({ message = localize("k_abn_even") }, card)
        card.ability.extra.current = "even"
      end
    end

    if context.discard then
      if card.ability.extra.current == "even" and ABN.is_even(context.other_card) then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_table = context.other_card.base,
          scalar_value = "nominal",
          operation = '+',
        })
        return {
          remove = true
        }
      elseif card.ability.extra.current == "odd" and ABN.is_odd(context.other_card) then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_table = context.other_card.base,
          scalar_value = "nominal",
          operation = '+',
        })
        return {
          remove = true
        }
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "b.b.b.b",
  },
}
