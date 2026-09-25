SMODS.ConsumableType {
  key = "ram",
  primary_colour = HEX("0da451"),
  secondary_colour = HEX("0da451"),
  text_colour = HEX("d3af37"),
  collection_rows = { 6, 6 },
  shop_rate = 0,
}

local smu = set_consumeable_usage
set_consumeable_usage = function(card)
  local ret = smu(card)

  if card and card.config and card.config.center and card.config.center.mod then
    if card.config.center.key and card.config.center.key ~= 'c_abn_ram_00' then
      G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
              G.GAME.last_modded = card.config.center_key
              return true
            end
          }))
          return true
        end
      }))
    end
  end

  return ret
end

SMODS.Consumable {
  key = "ram_00",
  set = 'ram',
  cost = 4,
  atlas = "abn_AbandoniaRam",
  pos = { x = 0, y = 0 },

  loc_vars = function(self, info_queue, card)
    local last_key = G.GAME and G.GAME.last_modded
    local modded_card = last_key and G.P_CENTERS[last_key] or nil

    if modded_card then
      info_queue[#info_queue + 1] = modded_card
    end

    return {
      main_end = {
        {
          n = G.UIT.C,
          config = { align = "bm", padding = 0.02 },
          nodes = {
            {
              n = G.UIT.C,
              config = {
                align = "m",
                colour = (not modded_card and G.C.RED or G.C.GREEN),
                r = 0.05,
                padding = 0.05
              },
              nodes = {
                {
                  n = G.UIT.T,
                  config = {
                    text = ' ' ..
                        (modded_card and localize { type = 'name_text', key = modded_card.key, set = modded_card.set } or localize('k_none')) ..
                        ' ',
                    colour = G.C.UI.TEXT_LIGHT,
                    scale = 0.3,
                    shadow = true
                  }
                },
              }
            }
          }
        }
      }
    }
  end,

  in_pool = function(self, args)
    return G.GAME and G.GAME.last_modded ~= nil
  end,

  can_use = function(self, card)
    return #G.consumeables.cards <= G.consumeables.config.card_limit and G.GAME and G.GAME.last_modded ~= nil
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        if #G.consumeables.cards < G.consumeables.config.card_limit then
          play_sound('timpani')
          local card_type = G.P_CENTERS[G.GAME.last_modded].set
          local new_card = create_card(card_type, G.consumeables, nil, nil, nil, nil, G.GAME.last_modded, 'ram00')
          new_card:add_to_deck()
          G.consumeables:emplace(new_card)
          card:juice_up(0.3, 0.5)
        end
        return true
      end
    }))
    delay(0.6)
  end,

  abn_artist_credits = {
    artist = "GM36"
  },
}

SMODS.Consumable {
  key = "ram_01",
  set = 'ram',
  cost = 4,
  atlas = "abn_AbandoniaRam",
  pos = { x = 1, y = 0 },

  can_use = function(self, card)
    if not G.consumeables or not G.consumeables.cards then return false end
    for _, c in ipairs(G.consumeables.cards) do
      if c ~= card and c.config and c.config.center and not c.config.center.mod then
        return true
      end
    end
    return false
  end,

  use = function(self, card, area, copier)
    card:juice_up(0.3, 0.5)
    local consumables = {}
    for _, v in ipairs(G.consumeables.cards) do
      if v ~= card and not v.config.center.mod then
        consumables[#consumables + 1] = v
      end
    end

    if #consumables > 0 then
      local pool = {}
      for k, v in pairs(G.P_CENTERS) do
        if v.mod and v.consumeable and v.set and v.set ~= 'ram' then
          pool[#pool + 1] = v
        end
      end

      for i, v in ipairs(consumables) do
        local percent = 1.15 - (i - 0.999) / (#consumables - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            v:flip()
            play_sound('card1', percent)
            v:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      for i, v in ipairs(consumables) do
        local new_key = (pseudorandom_element(pool, "abn_ram004")).key
        local center = G.P_CENTERS[new_key]
        if center then
          G.E_MANAGER:add_event(Event({
            func = function()
              v:set_ability(G.P_CENTERS[new_key])
              local slots_used = center.size == "XL" and 2 or center.size == "XS" and -1
              v.ability.extra_slots_used = slots_used or 0
              return true
            end
          }))
        end
      end

      for i, v in ipairs(consumables) do
        local percent = 0.85 + (i - 0.999) / (#consumables - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            v:flip()
            play_sound('tarot2', percent, 0.6)
            v:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      delay(0.5)
    end
  end,

  abn_artist_credits = {
    artist = "GM36"
  },
}

SMODS.Consumable {
  key = "ram_02",
  set = 'ram',

  atlas = "abn_AbandoniaRam",
  pos = { x = 2, y = 0 },
  cost = 4,

  config = { extra = { dollars = 5 } },

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local money = 0
    for _, v in ipairs(G.consumeables and G.consumeables.cards or {}) do
      if v ~= card and v.config.center.mod then
        money = money + card.ability.extra.dollars
      end
    end
    return {
      vars = {
        money,
        cae.dollars
      }
    }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area, copier)
    local money = 0
    for _, v in ipairs(G.consumeables and G.consumeables.cards) do
      if v ~= card and v.config.center.mod then
        money = money + card.ability.extra.dollars
      end
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('timpani')
        card:juice_up(0.3, 0.5)
        ease_dollars(money, true)
        return true
      end
    }))
    delay(0.6)
  end,

  abn_artist_credits = {
    artist = "GM36"
  },
}

SMODS.Consumable {
  key = "ram_03",
  set = 'ram',

  atlas = "abn_AbandoniaRam",
  pos = { x = 3, y = 0 },
  cost = 4,

  config = { extra = { max = 20 } },

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local consumables = 0
    for _, v in ipairs(G.consumeables and G.consumeables.cards or {}) do
      if v ~= card and not v.config.center.mod then
        consumables = consumables + 1
      end
    end
    return {
      vars = {
        cae.max,
        math.min(consumables, cae.max)
      }
    }
  end,

  can_use = function(self, card)
    local consumables = {}
    for _, v in ipairs(G.consumeables and G.consumeables.cards or {}) do
      if v ~= card and not v.config.center.mod then
        consumables[#consumables + 1] = v
      end
    end
    return #consumables > 0
  end,

  use = function(self, card, area, copier)
    card:juice_up(0.3, 0.5)
    local consumables = 0
    for _, v in ipairs(G.consumeables and G.consumeables.cards or {}) do
      if v ~= card and not v.config.center.mod then
        consumables = consumables + 1
      end
    end
    local to_create = math.min(consumables, card.ability.extra.max)

    if consumables > 0 then
      local pool = {}
      for k, v in pairs(G.P_CENTERS) do
        if v.mod and v.consumeable and v.set and v.set ~= 'ram' then
          pool[#pool + 1] = v
        end
      end


      for i = 1, to_create do
        local key = (pseudorandom_element(pool, "abn_ram003")).key
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            play_sound('timpani')
            SMODS.add_card({ key = key })
            card:juice_up(0.3, 0.5)
            return true
          end
        }))
      end

      delay(0.5)
    end
  end,

  abn_artist_credits = {
    artist = "GM36"
  },
}

SMODS.Consumable {
  key = "ram_04",
  set = 'ram',

  atlas = "abn_AbandoniaRam",
  pos = { x = 4, y = 0 },
  cost = 4,

  config = { extra = {} },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  can_use = function(self, card)
    local consumables = {}
    for _, v in ipairs(G.consumeables and G.consumeables.cards or {}) do
      if v ~= card and not v.config.center.mod then
        consumables[#consumables + 1] = v
      end
    end
    return #consumables > 0
  end,

  use = function(self, card, area, copier)
    card:juice_up(0.3, 0.5)

    local consumables = {}
    for _, v in ipairs(G.consumeables.cards) do
      if v ~= card and v.config.center.consumeable and not v.config.center.mod then
        consumables[#consumables + 1] = v
      end
    end

    if #consumables > 0 then
      local pools = {}
      for _, v in pairs(G.P_CENTERS) do
        if v.mod and v.consumeable and v.set and v.set ~= 'ram' then
          pools[v.set] = pools[v.set] or {}
          pools[v.set][#pools[v.set] + 1] = v
        end
      end

      for i, v in ipairs(consumables) do
        local percent = 1.15 - (i - 0.999) / (#consumables - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            v:flip()
            play_sound('card1', percent)
            v:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      for _, consumable in ipairs(consumables) do
        local pool = pools[consumable.config.center.set]
        if pool and #pool > 0 then
          local center = pseudorandom_element(pool, "abn_ram004")
          G.E_MANAGER:add_event(Event({
            func = function()
              consumable:set_ability(center)
              local slots_used = center.size == "XL" and 2 or center.size == "XS" and -1
              consumable.ability.extra_slots_used = slots_used or 0
              return true
            end
          }))
        end
      end

      for i, v in ipairs(consumables) do
        local percent = 0.85 + (i - 0.999) / (#consumables - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            v:flip()
            play_sound('tarot2', percent, 0.6)
            v:juice_up(0.3, 0.3)
            return true
          end
        }))
      end

      delay(0.5)
    end
  end,

  abn_artist_credits = {
    artist = "GM36"
  },
}
SMODS.Consumable {
  key = "ram_06",
  set = 'ram',

  atlas = "abn_AbandoniaRam",
  pos = { x = 0, y = 1 },
  cost = 4,

  config = { extra = {} },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chromatic
    return {
      vars = {
      }
    }
  end,

  can_use = function(self, card)
    local cards = {}
    for _, v in ipairs(G.consumeables.cards) do
      if not v.edition and v.config.center.mod and v ~= card then
        cards[#cards + 1] = v
      end
    end
    return #cards > 0
  end,

  use = function(self, card, area, copier)
    local cards = {}
    for _, v in ipairs(G.consumeables.cards) do
      if not v.edition and v.config.center.mod and v ~= card then
        cards[#cards + 1] = v
      end
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        for _, v in ipairs(cards) do
          v:set_edition("e_abn_chromatic")
        end

        card:juice_up(0.3, 0.5)
        return true
      end
    }))
  end,

  abn_artist_credits = {
    artist = "GM36"
  },
}

SMODS.Consumable {
  key = "ram_08",
  set = 'ram',

  atlas = "abn_AbandoniaRam",
  pos = { x = 1, y = 1 },
  cost = 4,

  config = { extra = {} },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  calculate = function(self, card, context)
    if context.abn_ram_08_triggered then
      set_consumeable_usage(card)
      SMODS.calculate_effect({ message = localize('k_abn_activated_ex'), colour = G.C.GREEN, sound = 'tarot1', }, card)
      SMODS.destroy_cards(card)
    end
  end,

  abn_artist_credits = {
    artist = "GM36"
  },
}
local use_consumeable_ref = Card.use_consumeable
function Card:use_consumeable(area, copier)
  local g = use_consumeable_ref(self, area, copier)
  if next(SMODS.find_card('c_abn_ram_08')) and self.ability.set == "Planet" and self.config.center.mod then
    for k, v in pairs(SMODS.find_card('c_abn_ram_08')) do
      SMODS.calculate_effect({ message = localize('k_again_ex') }, self)
      SMODS.calculate_context({ abn_ram_08_triggered = true })
      use_consumeable_ref(self, area, copier)
    end
  end
  return g
end

SMODS.Consumable {
  key = "ram_09",
  set = 'ram',

  atlas = "abn_AbandoniaRam",
  pos = { x = 2, y = 1 },
  cost = 4,

  config = { extra = {} },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  calculate = function(self, card, context)
    if context.abn_ram_09_triggered then
      set_consumeable_usage(card)
      SMODS.calculate_effect({ message = localize('k_abn_activated_ex'), colour = G.C.GREEN, sound = 'tarot1', }, card)
      SMODS.destroy_cards(card)
    end
  end,

  abn_artist_credits = {
    artist = "GM36"
  },
}
