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
