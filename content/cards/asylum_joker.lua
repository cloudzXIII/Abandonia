SMODS.Joker {
  key = 'asylum_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.BLACK, G.C.WHITE, 1.0)
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 5, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { echips = 1, selected = 2 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.echips,
        card.ability.extra.selected,
      }
    }
  end,

  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    -- Force select 2 random cards when cards are drawn
    if not context.blueprint and context.hand_drawn then
      local current_forced = 0
      local available_cards = {}

      -- Count how many are already forced and gather cards that aren't forced yet
      for _, c in ipairs(G.hand.cards) do
        if c.ability.asylum_selected then
          current_forced = current_forced + 1
        else
          table.insert(available_cards, c)
        end
      end

      -- If we need more forced selections and have cards available
      local target_needed = card.ability.extra.selected - current_forced
      if target_needed > 0 and #available_cards > 0 then
        G.hand:unhighlight_all() -- Clean slate for the visual highlight

        -- Pull random cards up to the needed amount
        for i = 1, math.min(target_needed, #available_cards) do
          local forced_card, key = pseudorandom_element(available_cards, pseudoseed('asylum_choice'))

          forced_card.ability.forced_selection = true
          forced_card.ability.asylum_selected = true
          G.hand:add_to_highlighted(forced_card)

          -- Remove from available list so we don't pick the same card twice
          table.remove(available_cards, key)
        end
      end
    end

    -- give chips
    if context.individual and context.cardarea == G.play then
      if context.other_card.ability.asylum_selected then
        return {
          echips = card.ability.extra.echips,
          card = card,
        }
      end
    end

    -- remove flags
    if context.after and context.cardarea == G.play then
      if context.other_card.ability.asylum_selected then
        context.other_card.ability.forced_selection = nil
        context.other_card.ability.asylum_selected = nil
      end
    end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly, Inky & Vega",
  },
}
