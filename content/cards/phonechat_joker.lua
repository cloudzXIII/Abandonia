SMODS.Joker {
  key = 'phonechat_joker',
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.chips_gain, card.ability.extra.mult_gain, } }
  end,
  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 7, y = 1 },
  cost = 3,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  config = { extra = { chips = 0, mult = 0, chips_gain = 5, mult_gain = 2 } },
  calculate = function(self, card, context)
    if context.other_joker and not context.blueprint then
      local card_index = nil
      for i, j in ipairs(G.jokers.cards) do
        if j == card then card_index = i break end
      end
      if card_index then
        if context.other_joker == G.jokers.cards[card_index - 1] then
          card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
          return { message = localize('k_upgrade_ex'), colour = G.C.FILTER, card = card }
        end
        if context.other_joker == G.jokers.cards[card_index + 1] then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
          return { message = localize('k_upgrade_ex'), colour = G.C.FILTER, card = card }
        end
      end
    end
    if context.joker_main then
      return { chips = card.ability.extra.chips, mult = card.ability.extra.mult }
    end
  end,
  abn_artist_credits = { artist = "Lohappy909_lol", },
}
