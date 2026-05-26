-- Marionette Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'marionette_joker',

  rarity = 3,
  atlas = 'ABNJokerSheet8',
  pos = { x = 3, y = 5 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { x_mult = 1, x_mult_gain = 1, selected = 5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_gain, card.ability.extra.selected }, }
  end,
  calculate = function(self, card, context)
    if context.hand_drawn and not context.blueprint then
      local current_forced = 0
      local available_cards = {}

      for _, c in ipairs(G.hand.cards) do
        if c.ability.marionette_selected then
          current_forced = current_forced + 1
        else
          table.insert(available_cards, c)
        end
      end

      local target_needed = card.ability.extra.selected - current_forced
      if target_needed > 0 and #available_cards > 0 then
        G.hand:unhighlight_all()

        for i = 1, math.min(target_needed, #available_cards) do
          local forced_card, key = pseudorandom_element(available_cards, pseudoseed('asylum_choice'))

          forced_card.ability.forced_selection = true
          forced_card.ability.marionette_selected = true
          G.hand:add_to_highlighted(forced_card)

          table.remove(available_cards, key)
        end
      end
    end

    if context.individual and context.cardarea == G.play then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_mult",
        scalar_value = "x_mult_gain",
        operation = '+',
      })
    end

    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
    if context.after and context.cardarea == G.play then
      if context.other_card.ability.marionette_selected then
        context.other_card.ability.forced_selection = nil
        context.other_card.ability.marionette_selected = nil
      end
    end
  end,
  abn_artist_credits = {
    artist = "Vlambambo",
  },
}
