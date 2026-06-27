function ABN.localize_perma_bonuses(specific_vars, desc_nodes, card)
  if card and card:get_abn_rank_chips() ~= 0 then
    localize { type = 'other', key = 'card_abn_rank_chips', nodes = desc_nodes, vars = { SMODS.signed(card:get_abn_rank_chips()) } }
  end
  if card and card:get_abn_rank_mult() ~= 0 then
    localize { type = 'other', key = 'card_abn_rank_mult', nodes = desc_nodes, vars = { SMODS.signed(card:get_abn_rank_mult()) } }
  end
end

local igo = Game.init_game_object
function Game:init_game_object(...)
  local ret = igo(self, ...)
  ret.abn_rank_upgrades = {
    ["2"] = { name = "2", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["3"] = { name = "3", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["4"] = { name = "4", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["5"] = { name = "5", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["6"] = { name = "6", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["7"] = { name = "7", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["8"] = { name = "8", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["9"] = { name = "9", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["10"] = { name = "10", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["Jack"] = { name = "Jack", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["Queen"] = { name = "Queen", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["King"] = { name = "King", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["Ace"] = { name = "Ace", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["abn_11"] = { name = "11", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["abn_12"] = { name = "12", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["abn_13"] = { name = "13", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
    ["abn_14"] = { name = "14", mult = 0, chips = 0, level = 1, s_mult = 0, s_chips = 0, l_mult = 1, l_chips = 3 },
  }
  return ret
end

local rank_planets = {
  { key = "lauto",    rank = "2",      pos = { x = 2, y = 0 } },
  { key = "urcurme",  rank = "3",      pos = { x = 3, y = 0 } },
  { key = "nevus",    rank = "4",      pos = { x = 4, y = 0 } },
  { key = "aerth",    rank = "5",      pos = { x = 5, y = 0 } },
  { key = "sarh",     rank = "6",      pos = { x = 0, y = 1 } },
  { key = "unpter",   rank = "7",      pos = { x = 1, y = 1 } },
  { key = "urno",     rank = "8",      pos = { x = 2, y = 1 } },
  { key = "ranu",     rank = "9",      pos = { x = 3, y = 1 } },
  { key = "etnup",    rank = "10",     pos = { x = 4, y = 1 } },
  { key = "zabures",  rank = "Jack",   pos = { x = 5, y = 1 } },
  { key = "pergus",   rank = "Queen",  pos = { x = 0, y = 2 } },
  { key = "vugmado",  rank = "King",   pos = { x = 1, y = 2 } },
  { key = "abandia",  rank = "Ace",    pos = { x = 2, y = 2 } },
  { key = "clun_va",  rank = "abn_11", pos = { x = 0, y = 5 } },
  { key = "reart",    rank = "abn_12", pos = { x = 4, y = 5 } },
  { key = "oshprue",  rank = "abn_13", pos = { x = 0, y = 6 } },
  { key = "meisness", rank = "abn_14", pos = { x = 6, y = 5 } },
}
SMODS.Attribute { key = "rank_planet" }

for _, def in ipairs(rank_planets) do
  local rank = def.rank
  SMODS.Consumable {
    attributes = { "rank_planet" },
    key = def.key,
    set = "Planet",
    atlas = "AbandoniaPlanets",
    pos = def.pos,
    discovered = false,
    cost = 4,
    config = { rank = rank },

    set_card_type_badge = function(self, card, badges)
      badges[#badges + 1] = create_badge(localize("k_abn_rank_planet"),
        get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour,
        1.2)
    end,

    loc_vars = function(self, info_queue, center)
      return {
        vars = {
          G.GAME.abn_rank_upgrades[rank].level,
          localize(rank, 'ranks'),
          G.GAME.abn_rank_upgrades[rank].l_mult,
          G.GAME.abn_rank_upgrades[rank].l_chips,
          colours = { (G.GAME.abn_rank_upgrades[rank].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.abn_rank_upgrades[rank].level)]) }

        }
      }
    end,

    can_use = function(self, card)
      return true
    end,

    use = function(self, card, area, copier)
      ABN.level_up_rank(card, rank, 1)
    end,
  }
end

function ABN.level_up_rank(card, rank, amount, instant)
  amount = amount or 1
  instant = instant or false
  local over_limit = false
  local _rank = G.GAME.abn_rank_upgrades[rank]
  if not _rank then return end

  if _rank.level >= 20 and card then
    SMODS.calculate_effect({ message = localize("k_abn_limit_reached"), colour = G.C.RED }, card)
    return
  elseif _rank.level + amount >= 20 then
    amount = 20 - _rank.level
    over_limit = true
  end

  -- e
  update_hand_text(
    { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
    { handname = _rank.name .. "s", chips = _rank.chips, mult = _rank.mult, level = _rank.level }
  )

  G.GAME.abn_rank_upgrades[rank].level = math.max(0, G.GAME.abn_rank_upgrades[rank].level + amount)
  G.GAME.abn_rank_upgrades[rank].mult = math.max(
    G.GAME.abn_rank_upgrades[rank].s_mult +
    G.GAME.abn_rank_upgrades[rank].l_mult * (G.GAME.abn_rank_upgrades[rank].level - 1), 0)
  G.GAME.abn_rank_upgrades[rank].chips = math.max(
    G.GAME.abn_rank_upgrades[rank].s_chips +
    G.GAME.abn_rank_upgrades[rank].l_chips * (G.GAME.abn_rank_upgrades[rank].level - 1),
    0)
  if not instant then
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.2,
      func = function()
        play_sound("tarot1")
        if card then card:juice_up(0.8, 0.5) end
        G.TAROT_INTERRUPT_PULSE = true
        return true
      end
    }))
    update_hand_text({ delay = 0 }, { mult = G.GAME.abn_rank_upgrades[rank].mult, StatusText = true })
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.9,
      func = function()
        play_sound("tarot1")
        if card then card:juice_up(0.8, 0.5) end
        return true
      end
    }))
    update_hand_text({ delay = 0 }, { chips = G.GAME.abn_rank_upgrades[rank].chips, StatusText = true })
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.9,
      func = function()
        play_sound("tarot1")
        if card then card:juice_up(0.8, 0.5) end
        G.TAROT_INTERRUPT_PULSE = nil
        return true
      end
    }))
    update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 },
      { level = G.GAME.abn_rank_upgrades[rank].level })
    delay(1.3)
  end
  -- e
  update_hand_text(
    { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
    { mult = 0, chips = 0, handname = "", level = "" }
  )
  if over_limit then
    SMODS.calculate_effect({ message = localize("k_abn_limit_reached"), colour = G.C.RED }, card)
  end
end

local get_chip_mult_ref = Card.get_chip_mult
function Card:get_chip_mult()
  local result = get_chip_mult_ref(self)
  return result + self:get_abn_rank_mult()
end

local get_chip_bonus_ref = Card.get_chip_bonus
function Card:get_chip_bonus()
  local result = get_chip_bonus_ref(self)
  return result + self:get_abn_rank_chips()
end

function Card:get_abn_rank_chips()
  if self.debuff then return 0 end
  if self.ability.name == "Stone Card" then return 0 end
  local upgrade = G.GAME.abn_rank_upgrades[self.base.value]
  return upgrade and upgrade.chips or 0
end

function Card:get_abn_rank_mult()
  if self.debuff then return 0 end
  if self.ability.name == "Stone Card" then return 0 end
  local upgrade = G.GAME.abn_rank_upgrades[self.base.value]
  return upgrade and upgrade.mult or 0
end

--#region Add "Ranks" Tab to run info

-- Manual Rank order since looping through G.GAME.abn_rank_upgrades doesn't do it in order
local rank_order = { "abn_14", "abn_13", "abn_12", "abn_11", "Ace", "King", "Queen", "Jack", "10", "9", "8", "7", "6",
  "5", "4", "3", "2" }

local function count_deck_ranks()
  local count = {}
  for _, card in ipairs(G.playing_cards or {}) do
    local v = card.base.value
    if v then
      count[v] = (count[v] or 0) + 1
    end
  end
  return count
end

local function create_rank_row(rank_key, counts)
  local _rank = G.GAME.abn_rank_upgrades[rank_key]

  local count = counts[rank_key] or 0
  if count == 0 and _rank.level <= 1 then return nil end

  local level_col = _rank.level == 1
      and G.C.UI.TEXT_LIGHT
      or G.C.HAND_LEVELS[math.min(7, _rank.level)]

  return {
    n = G.UIT.R,
    config = { align = "cm", padding = 0.05, r = 0.1, colour = darken(G.C.JOKER_GREY, 0.1), emboss = 0.05, hover = true, force_focus = true },
    nodes = {
      {
        n = G.UIT.C,
        config = { align = "cl", padding = 0, minw = 5 },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = "cm", padding = 0.01, r = 0.1, colour = level_col, minw = 1.5, outline = 0.8, outline_colour = G.C.WHITE },
            nodes = {
              { n = G.UIT.T, config = { text = localize('k_level_prefix') .. _rank.level, scale = 0.5, colour = G.C.UI.TEXT_DARK } }
            }
          },
          {
            n = G.UIT.C,
            config = { align = "cm", minw = 4.5, maxw = 4.5 },
            nodes = {
              { n = G.UIT.T, config = { text = ' ' .. _rank.name .. 's', scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true } }
            }
          },
        }
      },
      {
        n = G.UIT.C,
        config = { align = "cm", padding = 0.05, colour = G.C.BLACK, r = 0.1 },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = "cr", padding = 0.01, r = 0.1, colour = G.C.CHIPS, minw = 1.1 },
            nodes = {
              { n = G.UIT.T, config = { text = number_format(_rank.chips, 1000000), scale = 0.45, colour = G.C.UI.TEXT_LIGHT } },
              { n = G.UIT.B, config = { w = 0.08, h = 0.01 } },
            }
          },
          { n = G.UIT.T, config = { text = "X", scale = 0.45, colour = G.C.MULT } },
          {
            n = G.UIT.C,
            config = { align = "cl", padding = 0.01, r = 0.1, colour = G.C.MULT, minw = 1.1 },
            nodes = {
              { n = G.UIT.B, config = { w = 0.08, h = 0.01 } },
              { n = G.UIT.T, config = { text = number_format(_rank.mult, 1000000), scale = 0.45, colour = G.C.UI.TEXT_LIGHT } },
            }
          },
        }
      },
      {
        n = G.UIT.C,
        config = { align = "cm" },
        nodes = {
          { n = G.UIT.T, config = { text = '  #', scale = 0.45, colour = G.C.UI.TEXT_LIGHT, shadow = true } }
        }
      },
      {
        n = G.UIT.C,
        config = { align = "cm", padding = 0.05, colour = G.C.L_BLACK, r = 0.1, minw = 0.9 },
        nodes = {
          {
            n = G.UIT.O,
            config = {
              object = DynaText({
                string = { tostring(count) },
                maxw = 0.9,
                scale = 0.45,
                colours = { G.C.FILTER },
                shadow = true,
              })
            }
          }
        }
      },
    }
  }
end

function create_UIBox_current_ranks()
  local count = count_deck_ranks()
  local rows = {}

  for _, v in ipairs(rank_order) do
    local row = create_rank_row(v, count)
    if row then
      rows[#rows + 1] = row
    end
  end

  return {
    n = G.UIT.ROOT,
    config = { align = "cm", minw = 3, padding = 0.1, r = 0.1, colour = G.C.CLEAR },
    nodes = {
      { n = G.UIT.R, config = { align = "cm", padding = 0.04 }, nodes = rows }
    }
  }
end

G.FUNCS.current_ranks = function(e)
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu { definition = create_UIBox_current_ranks() }
end

--#endregion
