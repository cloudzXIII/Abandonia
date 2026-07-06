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

  for _, v in pairs(SMODS.Stickers) do
    if ability[v.key] then
      sticker_list[#sticker_list + 1] = v.key
    end
  end

  return #sticker_list > 0 and sticker_list or nil
end

ABN.is_dark = function(card)
  if SMODS.has_no_suit(card) then return false end
  if (Card.is_suit_shade and card:is_suit_shade("dark")) or card:is_suit("Spades") or card:is_suit("Clubs") or card:is_suit('bunc_Halberds') or card:is_suit('paperback_Crowns') or card:is_suit("abn_Penumbra") or card:is_suit("abn_Bow") or card:is_suit("abn_Chalice") or card:is_suit("abn_Sword") then
    return true
  end
  return false
end

ABN.is_light = function(card)
  if SMODS.has_no_suit(card) then return false end
  if (Card.is_suit_shade and card:is_suit_shade("light")) or card:is_suit("Diamonds") or card:is_suit("Hearts") or card:is_suit('bunc_Fleurons') or card:is_suit('paperback_Stars') or card:is_suit("abn_Snow") or card:is_suit("abn_Tie") or card:is_suit("abn_Coin") or card:is_suit("abn_Baton") then
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

  for sticker in pairs(SMODS.Stickers) do
    print(sticker)
    if sticker ~= 'pinned' then
      table.insert(compatible, sticker)
    end
  end

  return #compatible > 0 and pseudorandom_element(compatible, seed or 'abandonia') or 'perishable'
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


-- Function to balance a percentage of score - borrowed from my own mod, Final Mix B)
ABN.balance_percent = function(card, percent)
  local chip_mod = percent * hand_chips
  local mult_mod = percent * mult
  local average = (chip_mod + mult_mod) / 2
  hand_chips = hand_chips + (average - chip_mod)
  mult = mult + (average - mult_mod)

  update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
  card_eval_status_text(card, 'extra', nil, nil, nil, {
    message = (percent * 100) .. "% " .. localize('k_balanced'),
    colour = { 0.8, 0.45, 0.85, 1 },
    sound = 'gong'
  })

  G.E_MANAGER:add_event(Event({
    trigger = 'immediate',
    func = (function()
      ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
      ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        blocking = false,
        delay = 4.3,
        func = (function()
          ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
          ease_colour(G.C.UI_MULT, G.C.RED, 2)
          return true
        end)
      }))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        blocking = false,
        no_delete = true,
        delay = 6.3,
        func = (function()
          G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2],
              G.C.BLUE[3],
              G.C.BLUE[4]
          G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3],
              G.C.RED
              [4]
          return true
        end)
      }))
      return true
    end)
  }))

  delay(0.6)
  return hand_chips, mult
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


--allow tags to be in the shop

if not G.P_CENTERS['mod_shop_tag_base'] then
  G.P_CENTERS['mod_shop_tag_base'] = {
    key = 'mod_shop_tag_base',
    name = "Tag",
    set = "Tag",
    config = {},
    pos = { x = 0, y = 0 },
    atlas = 'tags'
  }
end

local old_card_save = Card.save
function Card.save(self)
  local cardTable = old_card_save(self)
  if self.ability and self.ability.is_shop_tag then
    cardTable.is_shop_tag = true
    cardTable.shop_tag_key = self.ability.shop_tag_key
  end
  return cardTable
end

local old_card_load = Card.load
function Card.load(self, cardTable, other_card)
  if cardTable.is_shop_tag and cardTable.shop_tag_key then
    local key = cardTable.shop_tag_key
    if not G.P_CENTERS[key] and G.P_TAGS[key] then
      local center = G.P_TAGS[key]
      G.P_CENTERS[key] = {
        key = key,
        name = center.name,
        set = "Tag",
        config = center.config or {},
        pos = center.pos or { x = 0, y = 0 },
        atlas = center.atlas or 'tags'
      }
    end
  end
  old_card_load(self, cardTable, other_card)
end

ABN.add_tag_to_shop = function(key, price, extra)
  extra = extra or {}
  extra.W = extra.W or 0.8
  extra.H = extra.H or 0.8
  extra.area = extra.area or G.shop_vouchers
  local center = G.P_TAGS[key]
  if not center then return end
  local area = extra.area

  if not G.P_CENTERS[key] then
    G.P_CENTERS[key] = {
      key = key,
      name = center.name,
      set = "Tag",
      config = center.config or {},
      pos = center.pos or { x = 0, y = 0 },
      atlas = center.atlas or 'tags'
    }
  end

  if area == G.shop_vouchers then
    area.config.card_limit = area.config.card_limit + 1
  end

  local tag = Card(
    area.T.x + area.T.w / 2,
    area.T.y,
    extra.W,
    extra.H,
    G.P_CARDS.empty,
    G.P_CENTERS[key],
    { bypass_discovery_center = true, bypass_discovery_ui = true }
  )

  for i, v in pairs(center.config) do
    tag.config[i] = v
  end

  tag.ability.booster_pos = #area.cards + 1
  tag.ability.is_shop_tag = true
  tag.ability.shop_tag_key = key

  local tag_object = Tag(key)
  if key == "tag_orbital" then
    local available_hands = {}
    for _, v in ipairs(G.handlist) do
      local hand = G.GAME.hands[v]
      if hand.visible then
        available_hands[#available_hands + 1] = v
      end
    end
    tag_object.ability.orbital_hand = pseudorandom_element(available_hands,
      pseudoseed(tag.ability.booster_pos .. "_orbital"))
    tag.ability.orbital_hand = tag_object.ability.orbital_hand
  end
  tag.config.tag = tag_object
  tag.name = tag_object.name

  create_shop_card_ui(tag, "Tag", area)

  tag.edition = nil
  tag.base_cost = price or 1
  tag:set_cost()

  tag.config.center.set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize('k_tag'), G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2)
  end

  tag.states.collide.can = true
  tag:start_materialize()
  area:emplace(tag)

  return tag
end

ABN.get_positive_stickers = function()
  local positive_stickers = {
    'abn_pump_up', 'abn_bullseye', 'abn_shovel',
    'abn_weight', 'abn_possibility', 'abn_square',
    'abn_lightning_bolt', 'abn_top_hat', 'abn_spicy',
    'abn_lucky', 'abn_glove_hand', 'abn_x', 'abn_negative_plus',
    'abn_question_mark', 'abn_even_legacy', 'abn_odd_legacy', 'abn_jimbo_legacy', 'abn_rejok_legacy',
    'abn_obmij_legacy', 'abn_jester_legacy', 'abn_currency'
  }
  return positive_stickers
end

function create_UIBox_used_sigils()
  local silent = false
  local keys_used = {}
  local area_count = 0
  local sigil_areas = {}
  local sigil_tables = {}
  local sigil_table_rows = {}
  for k, v in ipairs(G.P_CENTER_POOLS["sigils"]) do
    local key = 1 + math.floor((k - 0.1) / 2)
    keys_used[key] = keys_used[key] or {}
    if G.GAME.abn.used_sigils[v.key] then
      keys_used[key][#keys_used[key] + 1] = v
    end
  end
  for k, v in ipairs(keys_used) do
    if next(v) then
      area_count = area_count + 1
    end
  end
  for k, v in ipairs(keys_used) do
    if next(v) then
      if #sigil_areas == 5 or #sigil_areas == 10 then
        table.insert(sigil_table_rows,
          { n = G.UIT.R, config = { align = "cm", padding = 0, no_fill = true }, nodes = sigil_tables }
        )
        sigil_tables = {}
      end
      sigil_areas[#sigil_areas + 1] = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
        (#v == 1 and 1 or 1.33) * G.CARD_W,
        (area_count >= 10 and 0.75 or 1.07) * G.CARD_H,
        { card_limit = 2, type = 'voucher', highlight_limit = 0 })
      for kk, vv in ipairs(v) do
        local center = G.P_CENTERS[vv.key]
        local card = Card(sigil_areas[#sigil_areas].T.x + sigil_areas[#sigil_areas].T.w / 2,
          sigil_areas[#sigil_areas].T.y, G.CARD_W, G.CARD_H, nil, center,
          { bypass_discovery_center = true, bypass_discovery_ui = true, bypass_lock = true })
        card.ability.order = vv.order
        card:start_materialize(nil, silent)
        silent = true
        sigil_areas[#sigil_areas]:emplace(card)
      end
      table.insert(sigil_tables,
        {
          n = G.UIT.C,
          config = { align = "cm", padding = 0, no_fill = true },
          nodes = {
            { n = G.UIT.O, config = { object = sigil_areas[#sigil_areas] } }
          }
        }
      )
    end
  end
  table.insert(sigil_table_rows,
    { n = G.UIT.R, config = { align = "cm", padding = 0, no_fill = true }, nodes = sigil_tables }
  )


  local t = silent and {
        n = G.UIT.ROOT,
        config = { align = "cm", colour = G.C.CLEAR },
        nodes = {
          {
            n = G.UIT.R,
            config = { align = "cm" },
            nodes = {
              { n = G.UIT.O, config = { object = DynaText({ string = { localize('ph_abn_sigils_active') }, colours = { G.C.UI.TEXT_LIGHT }, bump = true, scale = 0.6 }) } }
            }
          },
          {
            n = G.UIT.R,
            config = { align = "cm", minh = 0.5 },
            nodes = {
            }
          },
          {
            n = G.UIT.R,
            config = { align = "cm", colour = G.C.BLACK, r = 1, padding = 0.15, emboss = 0.05 },
            nodes = {
              { n = G.UIT.R, config = { align = "cm" }, nodes = sigil_table_rows },
            }
          }
        }
      } or
      {
        n = G.UIT.ROOT,
        config = { align = "cm", colour = G.C.CLEAR },
        nodes = {
          { n = G.UIT.O, config = { object = DynaText({ string = { localize('ph_abn_no_sigils_active') }, colours = { G.C.UI.TEXT_LIGHT }, bump = true, scale = 0.6 }) } }
        }
      }
  return t
end
