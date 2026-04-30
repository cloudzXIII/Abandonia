SMODS.Joker {
  key = 'assassin_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain, card.ability.extra.dollars } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 6, y = 3 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 1, chips = 0, chips_gain = 20 } },

  calculate = function(self, card, context)
    if context.before then
      local lowest = nil
      local lowest_id = 15

      for i = 1, #context.scoring_hand do
        local _card = context.scoring_hand[i]
        if not SMODS.has_no_rank(_card) then
          if _card.base.id < lowest_id then
            lowest_id = _card.base.id
            lowest = _card
          end
        end
      end
      if lowest and #context.scoring_hand >= 2 then
        SMODS.destroy_cards(lowest)
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            ease_dollars(card.ability.extra.dollars, true)
            return true
          end
        }))
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          operation = '+',
        })
      end
    end
  end,
  abn_artist_credits = {
    artist = "P_ixl"
  },
}
