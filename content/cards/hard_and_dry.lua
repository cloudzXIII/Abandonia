SMODS.Joker {
  key = 'hard_and_dry',
  rarity = 'abn_SuperRare',
  atlas = 'ABNJokerSheet4',
  pos = { x = 1, y = 4 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,

  update = function(self, card)
    if card.area == G.shop_jokers then
      card.cost = 30
    end
  end,

  calculate = function(self, card, context)
    -- Triggers at the end of the round
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      local leftmost = G.jokers.cards[1]

      -- Ensure there is a joker to the left and it isn't this card itself
      if leftmost and leftmost ~= card then
        -- Logic based on 'Griddy' doubling
        local changed = false
        if type(leftmost.ability.extra) == "table" then
          for k, v in pairs(leftmost.ability.extra) do
            if type(v) == "number" then
              leftmost.ability.extra[k] = v * 2
              changed = true
            end
          end
        elseif type(leftmost.ability.extra) == "number" then
          leftmost.ability.extra = leftmost.ability.extra * 2
          changed = true
        end

        -- If no 'extra' values were found, check the base ability table
        if not changed then
          for k, v in pairs(leftmost.ability) do
            if type(v) == "number" and k ~= 'id' and k ~= 'groups' then
              if (k == "h_x_chips" or k == "x_mult" or k == "x_chips") then
                if v > 1 then leftmost.ability[k] = v * 2 end
              elseif v > 0 then
                leftmost.ability[k] = v * 2
              end
            end
          end
        end

        -- Visual feedback
        leftmost:juice_up()
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.Mult,
          card = leftmost
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Garb",
  },
}
