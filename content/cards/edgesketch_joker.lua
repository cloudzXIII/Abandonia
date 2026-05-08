SMODS.Joker {
  key = 'edgesketch_joker',
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.mult_gain, card.ability.extra.chips_gain, } }
  end,
  rarity = 2,
  atlas = 'ABNJokerSheet6',
  pos = { x = 9, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  config = { extra = { mult = 0, chips = 0, mult_gain = 5, chips_gain = 15 } },
  calculate = function(self, card, context)
    if context.other_joker and not context.blueprint then
      if context.other_joker ~= card then
        if context.other_joker == G.jokers.cards[#G.jokers.cards] then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
          return { message = localize('k_upgrade_ex'), colour = G.C.FILTER, card = card }
        end
        if context.other_joker == G.jokers.cards[1] then
          card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
          return { message = localize('k_upgrade_ex'), colour = G.C.FILTER, card = card }
        end
      end
    end
    if context.joker_main then
      return { mult = card.ability.extra.mult, chips = card.ability.extra.chips }
    end
  end,
  abn_artist_credits = { artist = "Lackymackswanky" },
}
