SMODS.Joker {
  key = 'eternian_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet20',
  pos = { x = 9, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      asc_mod = 0.30
    }
  },

  loc_vars = function(self, info_queue, card)
    local unique_types = {}
    local type_count = 0

    if G.consumeables and G.consumeables.cards then
      for _, c in ipairs(G.consumeables.cards) do
        local set_type = c.ability.consumeable and c.ability.consumeable.set or c.config.center.set
        if set_type and not unique_types[set_type] then
          unique_types[set_type] = true
          type_count = type_count + 1
        end
      end
    end

    return {
      vars = {
        card.ability.extra.asc_mod,
        type_count * card.ability.extra.asc_mod,
        type_count
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before then
      local unique_types = {}
      local type_count = 0

      if G.consumeables and G.consumeables.cards then
        for _, c in ipairs(G.consumeables.cards) do
          local set_type = c.ability.consumeable and c.ability.consumeable.set or c.config.center.set
          if set_type and not unique_types[set_type] then
            unique_types[set_type] = true
            type_count = type_count + 1
          end
        end
      end

      local total_ascension = type_count * card.ability.extra.asc_mod

      return {
		asc = total_ascension,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Vega",
  },
}