-- Periodic Cards (coded by cloudzXIII)
SMODS.ConsumableType {
  key = "periodic",
  primary_colour = HEX("009cfd"),
  secondary_colour = HEX("009cfd"),
  text_colour = HEX("fd5f55"),
  collection_rows = { 6, 6 },
  shop_rate = 0,
}

SMODS.UndiscoveredSprite {
  key = 'periodic',
  atlas = 'abn_AbandoniaUndiscovered',
  pos = { x = 4, y = 2 },
  overlay_pos = { x = 0, y = 3 },
}

local function abn_activate_periodic(self, card)
  set_consumeable_usage(card)
  SMODS.calculate_effect({ message = localize('k_abn_activated_ex'), colour = G.C.GREEN, sound = 'tarot1', }, card)
  SMODS.destroy_cards(card)
  SMODS.calculate_context({ abn_periodic_activated = true })
  G.GAME.abn_periodics_activated = (G.GAME.abn_periodics_activated or 0) + 1
end

ABN.PeriodicCard = SMODS.Consumable:extend({
  set = 'periodic',
  cost = 4,
  atlas = "abn_AbandoniaPeriodic",
  pos = { x = 0, y = 0 },

  config = { extra = { hand = "High Card", triggered = false } },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.hand, 'poker_hands'),
      }
    }
  end,

  calculate = function(self, card, context)
    if context.abn_play_cards then
      local poker_hand = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
      if poker_hand == card.ability.extra.hand then
        card.ability.extra.triggered = true
        G.GAME.abn.free_hand = true
      end
    end

    if context.after and context.main_eval and not context.blueprint and card.ability.extra.triggered then
      card.ability.extra.triggered = false
      abn_activate_periodic(self, card)
    end
  end,

  abn_artist_credits = {
    artist = "???"
  },
})

ABN.PeriodicCard {
  key = "hydrogen",
  pos = { x = 0, y = 0 },

  config = { extra = { hand = "High Card", triggered = false } },
}

ABN.PeriodicCard {
  key = "helium",
  pos = { x = 1, y = 0 },

  config = { extra = { hand = "Pair", triggered = false } },
}

ABN.PeriodicCard {
  key = "lithium",
  pos = { x = 2, y = 0 },

  config = { extra = { hand = "Two Pair", triggered = false } },
}

ABN.PeriodicCard {
  key = "beryllium",
  pos = { x = 3, y = 0 },

  config = { extra = { hand = "Three of a Kind", triggered = false } },
}

ABN.PeriodicCard {
  key = "boron",
  pos = { x = 4, y = 0 },

  config = { extra = { hand = "Straight", triggered = false } },
}

ABN.PeriodicCard {
  key = "carbon",
  pos = { x = 5, y = 0 },

  config = { extra = { hand = "Flush", triggered = false } },
}

ABN.PeriodicCard {
  key = "nitrogen",
  pos = { x = 6, y = 0 },

  config = { extra = { hand = "Full House", triggered = false } },
}

ABN.PeriodicCard {
  key = "oxygen",
  pos = { x = 7, y = 0 },

  config = { extra = { hand = "Four of a Kind", triggered = false } },
}

ABN.PeriodicCard {
  key = "fluorine",
  pos = { x = 8, y = 0 },

  config = { extra = { hand = "Five of a Kind", triggered = false } },
}

ABN.PeriodicCard {
  key = "neon",
  pos = { x = 9, y = 0 },

  config = { extra = { hand = "Straight Flush", triggered = false } },
}

ABN.PeriodicCard {
  key = "magnesium",
  pos = { x = 1, y = 1 },

  config = { extra = { hand = "Flush House", triggered = false } },
}

ABN.PeriodicCard {
  key = "aluminium",
  pos = { x = 2, y = 1 },

  config = { extra = { hand = "Flush Five", triggered = false } },
}

ABN.PeriodicCard {
  key = "silicon",
  pos = { x = 3, y = 1 },

  config = { extra = { hand = "Royal Flush", triggered = false } },

  calculate = function(self, card, context)
    if context.abn_play_cards then
      local _, display_name = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
      if display_name == localize(card.ability.extra.hand, "poker_hands") then
        card.ability.extra.triggered = true
        G.GAME.abn.free_hand = true
      end
    end

    if context.after and context.main_eval and not context.blueprint and card.ability.extra.triggered then
      card.ability.extra.triggered = false
      abn_activate_periodic(self, card)
    end
  end,
}
