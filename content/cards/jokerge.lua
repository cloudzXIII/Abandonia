SMODS.Joker {
  key = 'jokerge',
  loc_txt = {
    ['en-us'] = {
      name = "Jokerge",
      text = {
        "Double the values of",
        "all other {C:attention}Jokers{}",
      },
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 3 },
  soul_pos = { x = 3, y = 3 },
  cost = 20,
  discovered = false,
  blueprint_compat = false,
  unlocked = false,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  update = function(self, card)
    -- Only run logic if the card is in the Joker slots
    if card.area == G.jokers then
      local function double_joker_values(j)
        -- Don't double itself and only double if not already doubled
        if j.ability.set == "Joker" and j ~= card and not j.ability.jokerged then
          local changed_extra = false
          
          -- Handle extra
          if type(j.ability.extra) == "table" then
            for k, v in pairs(j.ability.extra) do
              if type(v) == "number" then
                j.ability.extra[k] = v * 2; changed_extra = true
              end
            end
          elseif type(j.ability.extra) == "number" then
            j.ability.extra = j.ability.extra * 2
            changed_extra = true
          end

          -- Handle base ability values if no extra
          if not changed_extra then
            for k, v in pairs(j.ability) do
              if type(v) == "number" and k ~= 'id' and k ~= 'groups' then
                if (k == "h_x_chips" or k == "x_mult" or k == "x_chips") then
                  if v > 1 then j.ability[k] = v * 2 end
                elseif v > 0 then
                  j.ability[k] = v * 2
                end
              end
            end
          end
          
          j.sell_cost = j.sell_cost * 2
          j.ability.jokerged = true
          j:juice_up()
        end
      end

      -- Safety check for Shop Jokers
      if G.shop_jokers and G.shop_jokers.cards then
        for _, j in ipairs(G.shop_jokers.cards) do 
            double_joker_values(j) 
        end
      end
      
      -- Safety check for Owned Jokers
      if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do 
            double_joker_values(j) 
        end
      end
    end
  end,

  remove_from_deck = function(self, card)
    local function halve_joker_values(j)
      -- Only halve if it was previously doubled by Jokerge
      if j.ability.set == "Joker" and j.ability.jokerged then
        local changed_extra = false

        -- REVERSE extra
        if type(j.ability.extra) == "table" then
          for k, v in pairs(j.ability.extra) do
            if type(v) == "number" then
              j.ability.extra[k] = v / 2
              changed_extra = true
            end
          end
        elseif type(j.ability.extra) == "number" then
          j.ability.extra = j.ability.extra / 2
          changed_extra = true
        end

        -- REVERSE ability
        if not changed_extra then
          for k, v in pairs(j.ability) do
            if type(v) == "number" and k ~= 'id' and k ~= 'groups' then
              if (k == "h_x_chips" or k == "x_mult" or k == "x_chips") then
                if v > 1 then j.ability[k] = v / 2 end
              elseif v > 0 then
                j.ability[k] = v / 2
              end
            end
          end
        end

        j.sell_cost = math.max(1, math.floor(j.sell_cost / 2))
        j.ability.jokerged = nil -- Reset the flag
        j:juice_up()
      end
    end

    -- Safety check for Shop Jokers on removal
    if G.shop_jokers and G.shop_jokers.cards then
      for _, j in ipairs(G.shop_jokers.cards) do halve_joker_values(j) end
    end
    
    -- Safety check for Owned Jokers on removal
    if G.jokers and G.jokers.cards then
      for _, j in ipairs(G.jokers.cards) do halve_joker_values(j) end
    end
  end,

  abn_artist_credits = {
    artist = "Boyaka"
  },
}