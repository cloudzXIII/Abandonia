-- Enrage Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'enrage_joker',

  rarity = 2,
  atlas = 'ABNJokerSheet13',
  pos = { x = 8, y = 4 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { x_chips = 5, selected = 5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_chips, card.ability.extra.selected }, }
  end,
  calculate = function(self, card, context)
    if context.hand_drawn and not context.blueprint then
      local current_forced = 0
      local available_cards = {}

      for _, c in ipairs(G.hand.cards) do
        if c.ability.enrage_selected then
          current_forced = current_forced + 1
        else
          table.insert(available_cards, c)
        end
      end

      local target_needed = card.ability.extra.selected - current_forced
      if target_needed > 0 and #available_cards > 0 then
        G.hand:unhighlight_all()

        for i = 1, math.min(target_needed, #available_cards) do
          local forced_card, key = pseudorandom_element(available_cards, pseudoseed('enrage_choice'))

          forced_card.ability.forced_selection = true
          forced_card.ability.enrage_selected = true
          G.hand:add_to_highlighted(forced_card)

          table.remove(available_cards, key)
        end
      end
    end
    if context.joker_main then
      return {
        x_chips = card.ability.extra.x_chips
      }
    end
    if context.after and context.cardarea == G.play then
      if context.other_card.ability.enrage_selected then
        context.other_card.ability.forced_selection = nil
        context.other_card.ability.enrage_selected = nil
      end
    end
  end,
  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
