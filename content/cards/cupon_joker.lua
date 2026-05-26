SMODS.Joker {
  key = 'cupon_joker',
  rarity = 2,
  atlas = 'ABNJokerSheet12',
  pos = { x = 2, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  
  update = function(self, card)
    if card.area == G.jokers then
      
      local function apply_cupon_modifier(c)
        if c.ability and c.config and c.config.center and c.ability.set ~= "Joker" and c.ability.set ~= "Default" and c.ability.set ~= "Enhanced" and not c.ability.cupon_jokerd then
          local modified = false

          -- Base game shit is coded badly
          if c.ability.consumeable then
            if c.ability.max_highlighted == 1 then
              c.ability.max_highlighted = 2
              modified = true
            end
			if c.ability.consumeable.max_highlighted == 1 then
              c.ability.consumeable.max_highlighted = 2
              modified = true
            end
            if c.ability.consumeable.mod_num == 1 then
              c.ability.consumeable.mod_num = 2
              modified = true
            end
          end

          -- Check for modded cards
          if type(c.ability.extra) == "table" then
            if c.ability.extra.cards == 1 then
              c.ability.extra.cards = 2
              modified = true
            end
            if c.ability.extra.max_cards == 1 then
              c.ability.extra.max_cards = 2
              modified = true
            end
          -- Catch-all if .extra is just a flat number equal to 1
          elseif c.ability.extra == 1 then
            c.ability.extra = 2
            modified = true
          end

          -- Tag and animation if anything changed
          if modified then
            c.ability.cupon_jokerd = true
            c:juice_up()
          end
        end
      end

      -- Consumable Slots
      if G.consumeables and G.consumeables.cards then
        for _, c in ipairs(G.consumeables.cards) do apply_cupon_modifier(c) end
      end

      -- Shop Slots
      if G.shop_consumeables and G.shop_consumeables.cards then
        for _, c in ipairs(G.shop_consumeables.cards) do apply_cupon_modifier(c) end
      end

      -- Booster slots
      if G.pack_cards and G.pack_cards.cards then
        for _, c in ipairs(G.pack_cards.cards) do apply_cupon_modifier(c) end
      end

    end
  end,

  -- Strip modifications completely if the Joker is sold or destroyed
  remove_from_deck = function(self, card)
    local function remove_cupon_modifier(c)
      if c.ability and c.ability.cupon_jokerd then
        
        -- FIXED: Clean up base-game sub-table values
        if c.ability.consumeable then
          if c.ability.consumeable.max_highlighted == 2 then
            c.ability.consumeable.max_highlighted = 1
          end
          if c.ability.consumeable.mod_num == 2 then
            c.ability.consumeable.mod_num = 1
          end
        end

        -- Restore extra tables / values
        if type(c.ability.extra) == "table" then
          if c.ability.extra.cards == 2 then c.ability.extra.cards = 1 end
          if c.ability.extra.max_cards == 2 then c.ability.extra.max_cards = 1 end
        elseif c.ability.extra == 2 then
          c.ability.extra = 1
        end

        c.ability.cupon_jokerd = nil
        c:juice_up()
      end
    end

    -- Clean up your hand
    if G.consumeables and G.consumeables.cards then
      for _, c in ipairs(G.consumeables.cards) do remove_cupon_modifier(c) end
    end
    
    -- Clean up the shop options
    if G.shop_consumeables and G.shop_consumeables.cards then
      for _, c in ipairs(G.shop_consumeables.cards) do remove_cupon_modifier(c) end
    end

    -- Clean up active booster choices
    if G.pack_cards and G.pack_cards.cards then
      for _, c in ipairs(G.pack_cards.cards) do remove_cupon_modifier(c) end
    end
  end,

  abn_artist_credits = {
    artist = "B.b.b.b",
  },
}