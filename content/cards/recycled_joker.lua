SMODS.Joker {
  key = 'recycled_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 3, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.discard then
      if context.other_card and not context.other_card.shattered and not context.other_card.destroyed then
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            draw_card(G.discard, G.deck, 1, 'up', nil, context.other_card, 0.005, false, nil, 0.7)
            return true
          end
        }))
      end
    end
  end,
  abn_artist_credits = {
    artist = "Zayden",
  },
}
