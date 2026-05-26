-- Continent Card Consumables (coded by cloudzXIII)
SMODS.ConsumableType {
  key = "continent",
  primary_colour = HEX("85b878"),
  secondary_colour = HEX("85b878"),
  collection_rows = { 6, 6 },
  shop_rate = 4,
}

local set_cost_ref = Card.set_cost -- for some reason hooking Card:set_sell_value() didn't work?
function Card:set_cost()
  local ret = set_cost_ref(self)
  if self.ability.set == "continent" then
    if next(SMODS.find_card("j_abn_explorer_joker")) then
      self.sell_cost = 5
    else
      self.sell_cost = 1
    end
  end
  return ret
end

-- Remove use button if passive effect
local use_and_sell_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
  local buttons = use_and_sell_ref(card)
  if card.ability and card.ability.set == "continent" and not card.config.center.use and card.area == G.pack_cards and G.pack_cards then
    return {
      n = G.UIT.ROOT,
      config = { padding = 0, colour = G.C.CLEAR },
      nodes = {
        {
          n = G.UIT.R,
          config = { ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5 * card.T.w - 0.15, maxw = 0.9 * card.T.w - 0.15, minh = 0.3 * card.T.h, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_select_card' },
          nodes = {
            { n = G.UIT.T, config = { text = localize('b_select'), colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true } }
          }
        },
      }
    }
  end
  if card.ability and card.ability.set == "continent" and not card.config.center.use then
    local sell = {
      n = G.UIT.ROOT,
      config = { padding = 0, colour = G.C.CLEAR },
      nodes = {
        {
          n = G.UIT.C,
          config = { padding = 0.15, align = 'cl' },
          nodes = {
            buttons.nodes[1].nodes[1]
          }
        },
      }
    }
    return sell
  end

  return buttons
end

ABN.ContinentCard = SMODS.Consumable:extend({
  set = 'continent',
  cost = 10,
  atlas = "abn_AbandoniaContinents",
  pos = { x = 0, y = 0 },
  pixel_size = { w = 65, h = 94 },
  display_size = { w = 65, h = 94 },
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind
  end,
  abn_artist_credits = {
    artist = "Muddz"
  },
  select_card = "consumeables"
})

ABN.ContinentCard {
  key = "africa",
  pos = { x = 4, y = 1 },
  config = {},
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    info_queue[#info_queue + 1] = G.P_SEALS.Gold
    info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return { vars = {} }
  end,
  use = function(self, card, area, copier)
    local light_suits = {}
    local dark_suits = {}
    for _, c in ipairs(G.hand.cards) do
      if ABN.is_light(c) then
        light_suits[#light_suits + 1] = c
      end
      if ABN.is_dark(c) then
        dark_suits[#dark_suits + 1] = c
      end
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    for _, _cards in ipairs({ light_suits, dark_suits }) do
      for i = 1, #_cards do
        local percent = 1.15 - (i - 0.999) / (#_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            _cards[i]:flip()
            play_sound('card1', percent)
            _cards[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      for i = 1, #_cards do
        G.E_MANAGER:add_event(Event({
          func = function()
            if _cards == light_suits then
              _cards[i]:set_ability("m_stone")
              _cards[i]:set_seal("Gold", true, true)
            end
            if _cards == dark_suits then
              _cards[i]:set_ability("m_gold")
              _cards[i]:set_edition("e_negative")
            end
            return true
          end
        }))
      end

      for i = 1, #_cards do
        local percent = 0.85 + (i - 0.999) / (#_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            _cards[i]:flip()
            play_sound('tarot2', percent, 0.6)
            _cards[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end
    end
    delay(0.5)
  end,
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind and G.hand and #G.hand.cards > 0
  end,
  abn_artist_credits = {
    artist = "HyperReal63"
  },
}

ABN.ContinentCard {
  key = "austrailia",
  pos = { x = 2, y = 1 },
  config = {},
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
    info_queue[#info_queue + 1] = G.P_SEALS.Red
    return { vars = {} }
  end,
  use = function(self, card, area, copier)
    local even_cards = {}
    local odd_cards = {}
    for _, c in ipairs(G.hand.cards) do
      if ABN.is_even(c) then
        even_cards[#even_cards + 1] = c
      end
      if ABN.is_odd(c) then
        odd_cards[#odd_cards + 1] = c
      end
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    for _, _cards in ipairs({ even_cards, odd_cards }) do
      for i = 1, #_cards do
        local percent = 1.15 - (i - 0.999) / (#_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            _cards[i]:flip()
            play_sound('card1', percent)
            _cards[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      for i = 1, #_cards do
        G.E_MANAGER:add_event(Event({
          func = function()
            if _cards == even_cards then
              _cards[i]:set_ability("m_wild")
              _cards[i]:set_edition("e_foil")
            end
            if _cards == odd_cards then
              _cards[i]:set_ability("m_glass")
              _cards[i]:set_seal("Red", true, true)
            end
            return true
          end
        }))
      end

      for i = 1, #_cards do
        local percent = 0.85 + (i - 0.999) / (#_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            _cards[i]:flip()
            play_sound('tarot2', percent, 0.6)
            _cards[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end
    end
    delay(0.5)
  end,
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind and G.hand and #G.hand.cards > 0
  end,
}

ABN.ContinentCard {
  key = "asia",
  pos = { x = 0, y = 1 },
  config = {},
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    info_queue[#info_queue + 1] = G.P_SEALS.abn_white
    return { vars = {} }
  end,
  use = function(self, card, area, copier)
    local aces = {}
    local face_cards = {}
    for _, c in ipairs(G.hand.cards) do
      if c:get_id() == 14 then
        aces[#aces + 1] = c
      end
      if c:is_face() then
        face_cards[#face_cards + 1] = c
      end
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    for _, _cards in ipairs({ aces, face_cards }) do
      for i = 1, #_cards do
        local percent = 1.15 - (i - 0.999) / (#_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            _cards[i]:flip()
            play_sound('card1', percent)
            _cards[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      for i = 1, #_cards do
        G.E_MANAGER:add_event(Event({
          func = function()
            if _cards == aces then
              _cards[i]:set_ability("m_mult")
              _cards[i]:set_edition("e_foil")
            end
            if _cards == face_cards then
              _cards[i]:set_ability("m_bonus")
              _cards[i]:set_seal("abn_white", true, true)
            end
            return true
          end
        }))
      end

      for i = 1, #_cards do
        local percent = 0.85 + (i - 0.999) / (#_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            _cards[i]:flip()
            play_sound('tarot2', percent, 0.6)
            _cards[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end
    end
    delay(0.5)
  end,
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind and G.hand and #G.hand.cards > 0
  end,
}

ABN.ContinentCard {
  key = "europe",
  pos = { x = 3, y = 1 },
  config = {},
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    info_queue[#info_queue + 1] = G.P_SEALS.abn_orange
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_fossil
    return { vars = {} }
  end,
  use = function(self, card, area, copier)
    local over_5 = {}
    local under_5 = {}
    for _, c in ipairs(G.hand.cards) do
      if c:get_id() <= 5 then
        under_5[#under_5 + 1] = c
      end
      if c:get_id() >= 6 then
        over_5[#over_5 + 1] = c
      end
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    for _, _cards in ipairs({ over_5, under_5 }) do
      for i = 1, #_cards do
        local percent = 1.15 - (i - 0.999) / (#_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            _cards[i]:flip()
            play_sound('card1', percent)
            _cards[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      for i = 1, #_cards do
        G.E_MANAGER:add_event(Event({
          func = function()
            if _cards == over_5 then
              _cards[i]:set_ability("m_steel")
              _cards[i]:set_seal("abn_orange", true, true)
            end
            if _cards == under_5 then
              _cards[i]:set_ability("m_abn_fossil")
              _cards[i]:set_edition("e_abn_abandond")
            end
            return true
          end
        }))
      end

      for i = 1, #_cards do
        local percent = 0.85 + (i - 0.999) / (#_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            _cards[i]:flip()
            play_sound('tarot2', percent, 0.6)
            _cards[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end
    end
    delay(0.5)
  end,
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind and G.hand and #G.hand.cards > 0
  end,
  abn_artist_credits = {
    artist = "cloudzXIII",
    colour = G.C.GOLD
  },
}

ABN.ContinentCard {
  key = "antarctica",
  pos = { x = 1, y = 1 },
  config = {},
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    info_queue[#info_queue + 1] = G.P_SEALS.abn_lavender
    info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
    info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    return { vars = {} }
  end,
  use = function(self, card, area, copier)
    local light_suits = {}
    local dark_suits = {}
    for _, c in ipairs(G.hand.cards) do
      if ABN.is_light(c) then
        light_suits[#light_suits + 1] = c
      end
      if ABN.is_dark(c) then
        dark_suits[#dark_suits + 1] = c
      end
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    for _, _cards in ipairs({ light_suits, dark_suits }) do
      for i = 1, #_cards do
        local percent = 1.15 - (i - 0.999) / (#_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            _cards[i]:flip()
            play_sound('card1', percent)
            _cards[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      for i = 1, #_cards do
        G.E_MANAGER:add_event(Event({
          func = function()
            if _cards == light_suits then
              assert(SMODS.change_base(_cards[i], "abn_Snow"))
              _cards[i]:set_edition("e_holo")
            end
            if _cards == dark_suits then
              assert(SMODS.change_base(_cards[i], "abn_Penumbra"))
              _cards[i]:set_seal("abn_lavender", true, true)
            end
            return true
          end
        }))
      end

      for i = 1, #_cards do
        local percent = 0.85 + (i - 0.999) / (#_cards - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            _cards[i]:flip()
            play_sound('tarot2', percent, 0.6)
            _cards[i]:juice_up(0.3, 0.3)
            return true
          end
        }))
      end
    end
    delay(0.5)
  end,
  can_use = function(self, card)
    return G.GAME.blind and G.GAME.blind.in_blind and G.hand and #G.hand.cards > 0
  end,
}

ABN.ContinentCard {
  key = "avalon",
  pos = { x = 2, y = 0 },
  config = { extra = { type = "Five of a Kind" } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_top_hat", set = "Other", vars = {} }
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.before and next(context.poker_hands[card.ability.extra.type]) then
      local faces = true
      for _, v in ipairs(context.full_hand) do
        if v:is_face() ~= false then
          faces = false
        end
      end
      if faces then
        SMODS.destroy_cards(context.full_hand)
        SMODS.add_card { rarity = "Legendary", key_append = "keris", stickers = { "abn_top_hat" } }
      end
    end
  end,
}

ABN.ContinentCard {
  key = "keris",
  pos = { x = 3, y = 0 },
  config = { extra = { type = "Flush" } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_bullseye", set = "Other", vars = { 100 } }
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.before and next(context.poker_hands[card.ability.extra.type]) then
      local faces = true
      for _, v in ipairs(context.full_hand) do
        if not v:is_face() then
          faces = false
        end
      end
      if faces then
        SMODS.destroy_cards(context.full_hand)
        SMODS.add_card { rarity = "abn_ParallelRare", key_append = "keris", stickers = { "abn_bullseye" } }
      end
    end
  end,
}

ABN.ContinentCard {
  key = "mu",
  pos = { x = 4, y = 0 },
  config = { extra = { type = "abn_Spectrum" } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    info_queue[#info_queue + 1] = { key = "abn_pump_up", set = "Other", vars = { 10 } }
    return { vars = {} }
  end,
  calculate = function(self, card, context)
    if context.before and next(context.poker_hands[card.ability.extra.type]) then
      local aces = true
      for _, v in ipairs(context.full_hand) do
        if v:get_id() ~= 14 then
          aces = false
        end
      end
      if aces then
        SMODS.destroy_cards(context.full_hand)
        SMODS.add_card { set = "Comedians", edition = "e_holo", key_append = "mu", stickers = { "abn_pump_up" } }
      end
    end
  end,
}
