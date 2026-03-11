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

ABN.is_dark = function(card)
  if card:is_suit("Spades") or card:is_suit("Clubs") then
    return true
  end
  return false
end

ABN.is_light = function(card)
  if card:is_suit("Diamonds") or card:is_suit("Hearts") then
    return true
  end
  return false
end

ABN.is_number = function(card)
  if not card:is_face() and not card:get_id() == 14 then
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

-- Count stickers
function ABN.count_stickers()
  if not G.jokers then
    return 0
  end
  local count = 0
  local stickers = {}
  for key, _ in pairs(SMODS.Sticker.obj_table) do
    for _, joker in pairs(G.jokers.cards) do
      if joker.ability and joker.ability[key] then
        if not stickers[key] then
          stickers[key] = true
          count = count + 1
        end
      end
    end
  end
  return count
end

-- Get Missing ranks in deck (used in lost media)
function ABN.get_missing_ranks()
  if G.GAME and G.playing_cards and #G.playing_cards > 0 then
    local current_ranks = {}
    local missing_ranks = {}

    for _, playing_card in ipairs(G.playing_cards) do
      if not SMODS.has_no_rank(playing_card) then
        current_ranks[playing_card.base.value] = true
      end
    end

    for _, rank in ipairs(SMODS.Rank.obj_buffer) do
      if not current_ranks[rank] then
        table.insert(missing_ranks, rank)
      end
    end

    return missing_ranks
  end
end
