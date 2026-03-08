ABN.is_even = function(card)
  if card:get_id() <= 10 and card:get_id() >= 0 and card:get_id() % 2 == 0 then
    return true
  end
  return false
end

ABN.is_odd = function(card)
  if (card:get_id() <= 10 and card:get_id() >= 0 and card:get_id() % 2 == 1) or (card:get_id() == 14) then
    return true
  end
  return false
end

-- Find position of card
ABN.get_pos = function(card, area)
  for i, v in ipairs(area) do
    if v == card then
      return i
    end
  end
  return nil
end

-- Gets all cards with a specific prefix
function ABN.get_resource_by_key(prefix)
  local results = {}
  for k, v in pairs(G.P_CENTERS) do
    if k:sub(1, #prefix) == prefix then
      table.insert(results, k)
    end
  end
  return results
end

-- Count Rarities
function ABN.count_rarities()
  if not G.jokers then
    return 0
  end
  local count = 0
  local rarities = {}
  for _, v in ipairs(G.jokers.cards) do
    local rarity = v.config.center.rarity
    if not rarities[rarity] then
      rarities[rarity] = true
      count = count + 1
    end
  end
  return count
end
