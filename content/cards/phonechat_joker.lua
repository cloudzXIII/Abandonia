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
  config = { extra = { chips = 0, mult = 0, chips_gain = 3, mult_gain = 1 } },
  calculate = function(self, card, context)
    if context.post_trigger and not context.blueprint then
      local pos = ABN.get_pos(card, G.jokers.cards)
      if context.other_card ~= card and pos then
        if context.other_card == G.jokers.cards[pos - 1] then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "chips",
            scalar_value = "chips_gain",
            operation = '+',
          })
        end
        if context.other_card == G.jokers.cards[pos + 1] then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "mult",
            scalar_value = "mult_gain",
            operation = '+',
          })
        end
      end
    end
    if context.joker_main then
      return { chips = card.ability.extra.chips, mult = card.ability.extra.mult }
    end
  end,
  abn_artist_credits = { artist = "Lohappy909_lol", },
}
