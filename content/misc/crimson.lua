SMODS.ConsumableType {
  key = "crimson",
  primary_colour = HEX("9C4457"),
  secondary_colour = HEX("9C4457"),
  collection_rows = { 5, 5 },
  shop_rate = 0,
}

ABN.CrimsonCard = SMODS.Consumable:extend({
  set = 'crimson',
  cost = 4,
  atlas = "abn_AbandoniaCrimson",
  pos = { x = 0, y = 0 },
  abn_artist_credits = {
    artist = "GM36"
  },
  loc_vars = function(self, info_queue, card)
    local sticker = card.ability.extra.enh_key

    if sticker then
				local retvars = ABN.enh_stickers_vars[sticker] or {}
				info_queue[#info_queue + 1] = { key = sticker, set = "Other", vars = retvars }
		end
    return {
      vars = {
        localize{type = 'name_text', key = card.ability.extra.enh_key, set='Other'},
      }
    }
  end,
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and G.GAME.blind and G.GAME.blind.in_blind
  end,
})

SMODS.UndiscoveredSprite({ -- undiscovered sprite
    key = 'crimson',
    atlas = "abn_AbandoniaUndiscovered",
    pos = { x = 3, y = 2 },
    no_overlay = true
})

ABN.CrimsonCard {
  key = "igoera",
  pos = { x = 1, y = 1 },
  config = { extra = { enh_key = "abn_stk_hazard" } },
  

  use = function(self, card, area, copier)
    local c = G.jokers.cards[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('card1', 1)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        c:add_sticker(card.ability.extra.enh_key, true)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('tarot2', 1, 0.6)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,
}

ABN.CrimsonCard {
  key = "liskarra",
  pos = { x = 2, y = 1 },
  config = { extra = { enh_key = "abn_stk_fossil" } },
  use = function(self, card, area, copier)
    local c = G.jokers.cards[#G.jokers.cards]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('card1', 1)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        c:add_sticker(card.ability.extra.enh_key, true)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('tarot2', 1, 0.6)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,
}

ABN.CrimsonCard {
  key = "guztiak",
  pos = { x = 3, y = 1 },
  config = { extra = { enh_key = "abn_stk_mercurial" } },

  use = function(self, card, area, copier)
    local c = G.jokers.cards[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('card1', 1)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        c:add_sticker(card.ability.extra.enh_key, true)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('tarot2', 1, 0.6)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,
}

ABN.CrimsonCard {
  key = "moztu",
  pos = { x = 4, y = 1 },
  config = { extra = { enh_key = "abn_stk_petroleum" } },

  use = function(self, card, area, copier)
    local c = G.jokers.cards[#G.jokers.cards]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('card1', 1)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        c:add_sticker(card.ability.extra.enh_key, true)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('tarot2', 1, 0.6)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,
}

ABN.CrimsonCard {
  key = "aleazioa",
  pos = { x = 5, y = 1 },
  config = { extra = { enh_key = "abn_stk_kintsugi" } },

  use = function(self, card, area, copier)
    local c = G.jokers.cards[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('card1', 1)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        c:add_sticker(card.ability.extra.enh_key, true)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('tarot2', 1, 0.6)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,
}


ABN.CrimsonCard {
  key = "iraunkorrak",
  pos = { x = 6, y = 1 },
  config = { extra = { enh_key = "abn_stk_monitor" } },
  use = function(self, card, area, copier)
    local c = G.jokers.cards[#G.jokers.cards]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('card1', 1)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        local _key = "_"..pseudorandom_element(ABN.monitor_suits, pseudoseed("abn_iraunkorrak")).key
        c:add_sticker(card.ability.extra.enh_key.._key, true)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('tarot2', 1, 0.6)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,
}

ABN.CrimsonCard {
  key = "ahalegina",
  pos = { x = 7, y = 1 },
  config = { extra = { enh_key = "abn_stk_wallpaper" } },
  use = function(self, card, area, copier)
    local c = G.jokers.cards[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('card1', 1)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        c:add_sticker(card.ability.extra.enh_key, true)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('tarot2', 1, 0.6)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,
}

ABN.CrimsonCard {
  key = "sakratua",
  pos = { x = 8, y = 1 },
  config = { extra = { enh_key = "abn_stk_infra" } },
  use = function(self, card, area, copier)
    local c = G.jokers.cards[#G.jokers.cards]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('card1', 1)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        c:add_sticker(card.ability.extra.enh_key, true)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        c:flip()
        play_sound('tarot2', 1, 0.6)
        c:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,
}