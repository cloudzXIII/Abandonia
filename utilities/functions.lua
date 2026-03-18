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
  if card:is_suit("Spades") or card:is_suit("Clubs") or card:is_suit('bunc_Halberds') or card:is_suit('paperback_Crowns') then
    return true
  end
  return false
end

ABN.is_light = function(card)
  if card:is_suit("Diamonds") or card:is_suit("Hearts") or card:is_suit('bunc_Fleurons') or card:is_suit('paperback_Stars') then
    return true
  end
  return false
end

ABN.is_number = function(card)
  return not card:is_face() and card:get_id() ~= 14
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
function ABN.count_unique_stickers()
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

function ABN.count_stickers()
  if not G.jokers then
    return 0
  end
  local count = 0
  local jokers = {}
  for key, _ in pairs(SMODS.Sticker.obj_table) do
    for _, joker in pairs(G.jokers.cards) do
      if joker.ability and joker.ability[key] then
        count = count + 1
        if not jokers[key] then
          table.insert(jokers, joker)
        end
      end
    end
  end
  return count, jokers
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

function ABN.random_sticker(card, seed)
  local compatible = {}

  for key, sticker in pairs(SMODS.Stickers) do
    if ABN.can_apply_sticker(sticker, card) then
      table.insert(compatible, key)
    end
  end

  return #compatible > 0 and pseudorandom_element(compatible, seed or 'abandonia') or 'perishable'
end

-- sticker function, nabbed from MaxBoi's mod, check them out! https://github.com/MaxBoi342/MaxBois-Mod

function ABN.can_apply_sticker(sticker, card)
  if type(sticker.should_apply) == 'function' then
    return sticker:should_apply(card, card.config.center, nil, true)
  end
  local center = card.config.center
  if (center[sticker.key .. '_compat'] or (center[sticker.key .. '_compat'] == nil and ((sticker.default_compat and not sticker.compat_exceptions[center.key]) or -- default yes with no exception
        (not sticker.default_compat and sticker.compat_exceptions[center.key])))) then                                                                            --default no with exceptions
    if not card.ability[sticker.key] then
      if card.pinned and sticker.key == 'pinned' then
        --#JUSTICEFORPINNED
      elseif not (card.ability['perishable'] and sticker.key == 'eternal' or card.ability['eternal'] and sticker.key == 'perishable') then --vanilla sticker exclusivity check, idk if theres a proper way to do it
        return true
      end
    end
  end
  return false
end
