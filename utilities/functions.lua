ABN.is_even = function(card)
  local even_ranks = { "abn_12", "abn_14" }
  if card:get_id() <= 10 and card:get_id() >= 0 and card:get_id() % 2 == 0 then
    return true
  end
  for _, rank in ipairs(even_ranks) do
    if card:get_id() == SMODS.Ranks[rank].id then
      return true
    end
  end
  return false
end

ABN.is_odd = function(card)
  local odd_ranks = { "abn_11", "abn_13" }
  if (card:get_id() <= 10 and card:get_id() >= 0 and card:get_id() % 2 == 1) or (card:get_id() == 14) then
    return true
  end
  for _, rank in ipairs(odd_ranks) do
    if card:get_id() == SMODS.Ranks[rank].id then
      return true
    end
  end
  return false
end

ABN.listStickers = function(card)
  local sticker_list = {}
  local ability = card.ability
  
  for _,v in pairs(SMODS.Stickers) do
    if ability[v.key] then
      sticker_list[#sticker_list+1] = v.key
    end
  end
  
  return #sticker_list > 0 and sticker_list or nil
end

ABN.is_dark = function(card)
  if card:is_suit("Spades") or card:is_suit("Clubs") or card:is_suit('bunc_Halberds') or card:is_suit('paperback_Crowns') or card:is_suit("abn_Penumbra") then
    return true
  end
  return false
end

ABN.is_light = function(card)
  if card:is_suit("Diamonds") or card:is_suit("Hearts") or card:is_suit('bunc_Fleurons') or card:is_suit('paperback_Stars') or card:is_suit("abn_Snow") then
    return true
  end
  return false
end

ABN.is_number = function(card)
  return not card:is_face() and card:get_id() ~= 14
end

ABN.is_palindrome = function(table)
  local l = #table
  local ct = 0
  for i = 1, math.floor(l / 2) do
    if table[i] ~= table[l - i + 1] then
      return false
    else
      ct = ct + 1
    end
  end
  return ct
end
ABN.table_count = function(table, val)
  local ct = 0
  for i, v in ipairs(table) do
    if v == val then
      ct = ct + 1
    end
  end
  return ct
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

function ABN.msg(card, message, type)
  if not type then
    type = "extra"
  end
  card_eval_status_text(card, type, nil, nil, nil, { message = message })
end

function ABN.get_all_cards()
  local cards = {}
  if G.jokers then
    for i, v in pairs(G.jokers.cards) do
      table.insert(cards, v)
    end
  end
  if G.consumeables then
    for i, v in pairs(G.consumeables.cards or {}) do
      table.insert(cards, v)
    end
  end
  table.insert(cards, G.GAME.selected_back)
  return cards
end

function ABN:calculate_blind_size_modify(blind_amount, ante)
  local calculate_tbl = {
    amount = blind_amount,
    ante = ante,
    original_amount = blind_amount,
  }
  local this_amount = blind_amount
  local cards = ABN.get_all_cards()
  for i, v in pairs(cards) do
    local config = v.config or v.effect
    local center = config.center
    if center.abn_modify_blind_size then
      calculate_tbl.amount = this_amount
      calculate_tbl.card = v
      this_amount = center:abn_modify_blind_size(v, calculate_tbl) or this_amount
    end
  end
  return this_amount
end

function ABN:get_non_editioned_cards_in_deck()
  local non_editioned = {}
  for i, card in ipairs(G.deck.cards) do
    if not card.edition then
      table.insert(non_editioned, card)
    end
  end
  return non_editioned
end

function ABN:update_non_editioned_cards_table(tabl, new_editioned_cards)
  for i, card in ipairs(new_editioned_cards) do
    local result = table.find(tabl, card)
    if result ~= nil then
      table.remove(tabl, result)
    end
  end
end

function ABN.get_random_nightshift()
  local nightshift_pool = {}
  for k, v in pairs(G.P_CENTER_POOLS["nightshift_cards"]) do
    nightshift_pool[#nightshift_pool + 1] = v.key
  end
  
  local chosen_key = pseudorandom_element(nightshift_pool, "seed" .. pseudorandom(0, 100))
  return chosen_key
end

-- Gets most played Poker Hand
ABN.most_played_hand = function()
  local _handname, _played, _order = 'High Card', -1, 100
  for k, v in pairs(G.GAME.hands) do
    if v.played > _played or (v.played == _played and _order > v.order) then
      _played = v.played
      _handname = k
    end
  end
  return _handname
end

-- Gets highest level poker hand
ABN.highest_level_hand = function()
  local _handname, _played, _order, _level = 'High Card', -1, 100, -1
  for k, v in pairs(G.GAME.hands) do
    if v.level > _level or (v.level == _level and _order > v.order) then
      _level = v.level
      _handname = k
    end
  end
  return _handname
end

table.insert(SMODS.calculation_keys, "abn_balance_percent")
if SMODS.other_calculation_keys then
  table.insert(SMODS.other_calculation_keys, "abn_balance_percent")
end
local abn_balance_mixed = false
local abn_original_smods_calculate_effect = SMODS.calculate_individual_effect
function calculate_balance_percent_values(input_hand_chips, input_mult, percent)
  local chip_mod = percent * input_hand_chips
  local mult_mod = percent * input_mult
  local avg = (chip_mod + mult_mod) / 2
  local new_hand_chips = input_hand_chips + (avg - chip_mod)
  local new_mult = input_mult + (avg - mult_mod)
  new_hand_chips = math.floor(new_hand_chips + 0.5)
  new_mult = math.floor(new_mult + 0.5)
  new_hand_chips = math.max(1, new_hand_chips)
  new_mult = math.max(1, new_mult)
  return new_hand_chips, new_mult
end
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
  if key ~= "abn_balance_percent" then
    return abn_original_smods_calculate_effect(effect, scored_card, key, amount, from_edition)
  end
  amount = amount / 100
  if effect.card and effect.card ~= scored_card then
    juice_card(effect.card)
  end
  local new_hand_chips, new_mult = calculate_balance_percent_values(hand_chips, mult, amount)
  SMODS.Scoring_Parameters.chips:modify(new_hand_chips - hand_chips)
  SMODS.Scoring_Parameters.mult:modify(new_mult - mult)
  local text = "Balanced " .. (amount * 100) .. "%"
  G.E_MANAGER:add_event(Event({
    trigger = "immediate",
    func = (function()
      ease_colour(G.C.UI_CHIPS, mix_colours(G.C.PLASMA, G.C.UI_CHIPS, amount))
      ease_colour(G.C.UI_MULT, mix_colours(G.C.PLASMA, G.C.UI_MULT, amount))
      if not abn_balance_mixed then
        abn_balance_mixed = true
        G.E_MANAGER:add_event(Event({
          trigger = "after",
          blockable = false,
          blocking = false,
          delay = 6.3,
          func = (function()
            if G.STATE ~= 2 then
              ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
              ease_colour(G.C.UI_MULT, G.C.RED, 2)
              abn_balance_mixed = false
              return true
            end
          end)
        }))
      end
      return true
    end)
  }))
  if not effect.remove_default_message then
    if from_edition then
      card_eval_status_text(scored_card, "jokers", nil, percent, nil, {
        message = text,
        colour = G.C.ABN_PLASMA,
        sound = "gong",
        edition = true
      })
    else
      card_eval_status_text(
        effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, "extra", nil, percent, nil, {
          message = text,
          colour = G.C.ABN_PLASMA,
          sound = "gong"
        }
      )
    end
  end
  return true
end

ABN.count_planet_ranks_played = function(hand)
  local total_level = 0
  for _, scored_card in ipairs(hand) do
    local level = G.GAME.abn_rank_upgrades[scored_card.base.value] and
    G.GAME.abn_rank_upgrades[scored_card.base.value].level or 1
    total_level = total_level + level
  end
  return total_level
end
