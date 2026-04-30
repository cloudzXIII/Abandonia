SMODS.Joker {
  key = 'joker_ai',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 2, y = 4 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 1, chips = 20 } },

  calculate = function(self, card, context)
    if context.hand_drawn then
      local any_forced = nil
      for _, playing_card in ipairs(G.hand.cards) do
        if playing_card.ability.abn_forced_selection then
          any_forced = true
        end
      end
      if not any_forced then
        G.hand:unhighlight_all()
        local forced_card = pseudorandom_element(G.hand.cards, 'abn_joker_ai')
        forced_card.ability.abn_forced_selection = true
        G.hand:add_to_highlighted(forced_card)
      end
    end
    if context.individual and context.cardarea == G.play and context.other_card and context.other_card.ability.abn_forced_selection then
      context.other_card.ability.abn_forced_selection = nil
      context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0)
          + card.ability.extra.mult
      context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0)
          + card.ability.extra.chips
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.FILTER
      }
    end
  end,
  abn_artist_credits = {
    artist = "Fridgemancer"
  },
}
