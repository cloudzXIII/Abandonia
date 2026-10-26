SMODS.Joker {
  key = 'asylum_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.ABN_PLAGUED, G.C.WHITE, 1.0)
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 5, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { echips = 1.3, selected = 2, bad_echips = -1.4 } },
  pools = { ["Plagued"] = true, },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.echips,
        card.ability.extra.selected,
        card.ability.extra.bad_echips,
      }
    }
  end,

  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)

    if not context.blueprint and context.hand_drawn then
      local current_forced = 0
      local available_cards = {}

      for _, c in ipairs(G.hand.cards) do
        if c.ability.asylum_selected then
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
          forced_card.ability.asylum_selected = true
          G.hand:add_to_highlighted(forced_card)

          table.remove(available_cards, key)
        end
      end
    end

    if context.individual and context.cardarea == G.play then

      if context.other_card.ability.asylum_selected then
        local mayhem_chance = 0
        if (G.GAME.abn_max_mayhem or 0) > 0 then
          mayhem_chance = math.min((G.GAME.abn_mayhem or 0) / G.GAME.abn_max_mayhem, 1)
        end

        local first_roll = pseudorandom('asylum_mayhem')

        if first_roll < mayhem_chance then
          local second_roll = pseudorandom('asylum_mayhem_bad')

          if second_roll < mayhem_chance then
            return {
              echips = card.ability.extra.bad_echips,
              card = card,
            }
          end
          return
        end

        return {
          echips = card.ability.extra.echips,
          card = card,
        }
      end
    end

    if context.after then
    end

    if context.after and not context.blueprint then
		for _, playing_card in ipairs(G.playing_cards) do
			playing_card.ability.forced_selection = nil
			playing_card.ability.asylum_selected = nil
		end
	end
  end,

  abn_artist_credits = {
    artist = "Dogg-Fly, Inky & Vega",
  },
}