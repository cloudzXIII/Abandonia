-- Calligraphy Consumables (coded by cloudzXIII)
SMODS.ConsumableType {
  key = "calligraphy",
  primary_colour = HEX("fd5f55"),
  secondary_colour = HEX("fd5f55"),
  collection_rows = { 5, 5 },
  shop_rate = 0,
}

ABN.CalligraphyCard = SMODS.Consumable:extend({
  set = 'calligraphy',
  cost = 4,
  atlas = "abn_AbandoniaCalligraphy",
  pos = { x = 0, y = 0 },
  abn_artist_credits = {
    artist = "0kronix"
  },
})

ABN.CalligraphyCard {
  key = "azu",
  pos = { x = 0, y = 0 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_singular'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Sword", mod_conv = "m_abn_first_aid" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local leftmost = G.hand.cards[1]
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
        leftmost:flip()
        play_sound('card1', 1)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(leftmost, card.ability.extra.suit_conv)
        leftmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        leftmost:flip()
        play_sound('tarot2', 1, 0.6)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}


ABN.CalligraphyCard {
  key = "buky",
  pos = { x = 1, y = 0 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Coin", mod_conv = "m_gold", rank = "Ace" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local rightmost = G.hand.cards[#G.hand.cards]
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
        rightmost:flip()
        play_sound('card1', 1)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(rightmost, card.ability.extra.suit_conv, card.ability.extra.rank)
        rightmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        rightmost:flip()
        play_sound('tarot2', 1, 0.6)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}


ABN.CalligraphyCard {
  key = "vede",
  pos = { x = 2, y = 0 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_singular'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Baton", mod_conv = "m_abn_mountain", } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local rightmost = G.hand.cards[#G.hand.cards]
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
        rightmost:flip()
        play_sound('card1', 1)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(rightmost, card.ability.extra.suit_conv)
        rightmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        rightmost:flip()
        play_sound('tarot2', 1, 0.6)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}

ABN.CalligraphyCard {
  key = "ghe",
  pos = { x = 3, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.amount
      }
    }
  end,

  config = { extra = { amount = 2 } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local leftmost = G.hand.cards[1]
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
        leftmost:flip()
        play_sound('card1', 1)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        assert(SMODS.modify_rank(leftmost, -card.ability.extra.amount))

        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        leftmost:flip()
        play_sound('tarot2', 1, 0.6)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}

ABN.CalligraphyCard {
  key = "de",
  pos = { x = 4, y = 0 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_singular'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Goblet", mod_conv = "m_abn_ocean", } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local rightmost = G.hand.cards[#G.hand.cards]
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
        rightmost:flip()
        play_sound('card1', 1)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(rightmost, card.ability.extra.suit_conv)
        rightmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        rightmost:flip()
        play_sound('tarot2', 1, 0.6)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}


ABN.CalligraphyCard {
  key = "ye",
  pos = { x = 5, y = 0 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Sword", mod_conv = "m_abn_kintsugi", rank = "4" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local leftmost = G.hand.cards[1]
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
        leftmost:flip()
        play_sound('card1', 1)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(leftmost, card.ability.extra.suit_conv, card.ability.extra.rank)
        leftmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        leftmost:flip()
        play_sound('tarot2', 1, 0.6)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}

ABN.CalligraphyCard {
  key = "yo",
  pos = { x = 0, y = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "Clubs", mod_conv = "m_glass", rank = "abn_13" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local leftmost = G.hand.cards[1]
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
        leftmost:flip()
        play_sound('card1', 1)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(leftmost, card.ability.extra.suit_conv, card.ability.extra.rank)
        leftmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        leftmost:flip()
        play_sound('tarot2', 1, 0.6)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}

ABN.CalligraphyCard {
  key = "zhe",
  pos = { x = 1, y = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Rose", mod_conv = "m_abn_wallpaper", rank = "10" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local rightmost = G.hand.cards[#G.hand.cards]
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
        rightmost:flip()
        play_sound('card1', 1)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(rightmost, card.ability.extra.suit_conv, card.ability.extra.rank)
        rightmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        rightmost:flip()
        play_sound('tarot2', 1, 0.6)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}


ABN.CalligraphyCard {
  key = "ze",
  pos = { x = 2, y = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Baton", mod_conv = "m_abn_reinforcement", rank = "abn_12" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local leftmost = G.hand.cards[1]
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
        leftmost:flip()
        play_sound('card1', 1)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(leftmost, card.ability.extra.suit_conv, card.ability.extra.rank)
        leftmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        leftmost:flip()
        play_sound('tarot2', 1, 0.6)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}

ABN.CalligraphyCard {
  key = "i",
  pos = { x = 3, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  config = { extra = {} },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind and
        not SMODS.has_no_suit(G.hand.cards[1])
  end,

  use = function(self, card, area, copier)
    local leftmost = G.hand.cards[1]
    local to_convert = {}
    for _, v in ipairs(G.hand.cards) do
      if v ~= leftmost then
        to_convert[#to_convert + 1] = v
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
    for i = 1, #to_convert do
      local percent = 1.15 - (i - 0.999) / (#to_convert - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          to_convert[i]:flip()
          play_sound('card1', percent)
          to_convert[i]:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.2)
    for i = 1, #to_convert do
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
          SMODS.change_base(to_convert[i], leftmost.base.suit)
          return true
        end
      }))
    end
    for i = 1, #to_convert do
      local percent = 0.85 + (i - 0.999) / (#to_convert - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          to_convert[i]:flip()
          play_sound('tarot2', percent, 0.6)
          to_convert[i]:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.hand:unhighlight_all()
        return true
      end
    }))
    delay(0.5)
  end,

}

ABN.CalligraphyCard {
  key = "kratkoye",
  pos = { x = 4, y = 1 },

  loc_vars = function(self, info_queue, card)
    local unique = 0
    if G.hand and #G.hand.cards > 0 then
      local cards = {}
      for _, v in ipairs(G.hand.cards) do
        cards[v.base.suit] = true
      end

      for _ in pairs(cards) do
        unique = unique + 1
      end
    end

    return {
      vars = {
        card.ability.extra.mult_gain,
        card.ability.extra.mult_gain * unique
      }
    }
  end,

  config = { extra = { mult_gain = 1 } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local rightmost = G.hand.cards[#G.hand.cards]

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    local unique = 0
    local cards = {}
    for _, v in ipairs(G.hand.cards) do
      cards[v.base.suit] = true
    end

    for _ in pairs(cards) do
      unique = unique + 1
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        rightmost.ability.perma_mult = (rightmost.ability.perma_mult or 0) + (card.ability.extra.mult_gain * unique)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, rightmost)
        return true
      end
    }))
    delay(0.2)
  end,

}

ABN.CalligraphyCard {
  key = "ka",
  pos = { x = 5, y = 1 },

  loc_vars = function(self, info_queue, card)
    local count = 0
    if G.hand and #G.hand.cards > 0 and not SMODS.has_no_suit(G.hand.cards[1]) then
      local leftmost = G.hand.cards[1]
      for _, v in ipairs(G.hand.cards) do
        if v:is_suit(leftmost.base.suit) then
          count = count + 1
        end
      end
    end

    return {
      vars = {
        card.ability.extra.chips_gain,
        card.ability.extra.chips_gain * count
      }
    }
  end,

  config = { extra = { chips_gain = 8 } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind and
        not SMODS.has_no_suit(G.hand.cards[1])
  end,

  use = function(self, card, area, copier)
    local leftmost = G.hand.cards[1]

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    local count = 0
    for _, v in ipairs(G.hand.cards) do
      if v:is_suit(leftmost.base.suit) then
        count = count + 1
        v:juice_up(0.3, 0.3)
      end
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        leftmost.ability.perma_bonus = (leftmost.ability.perma_bonus or 0) + (card.ability.extra.chips_gain * count)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.CHIPS }, leftmost)
        return true
      end
    }))
    delay(0.2)
  end,

}


ABN.CalligraphyCard {
  key = "el",
  pos = { x = 0, y = 2 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_singular'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Bell", mod_conv = "m_abn_hot_iron", } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local rightmost = G.hand.cards[#G.hand.cards]
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
        rightmost:flip()
        play_sound('card1', 1)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(rightmost, card.ability.extra.suit_conv)
        rightmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        rightmost:flip()
        play_sound('tarot2', 1, 0.6)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}


ABN.CalligraphyCard {
  key = "em",
  pos = { x = 1, y = 2 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Leaf", mod_conv = "m_abn_zen", rank = "8" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local leftmost = G.hand.cards[1]
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
        leftmost:flip()
        play_sound('card1', 1)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(leftmost, card.ability.extra.suit_conv, card.ability.extra.rank)
        leftmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        leftmost:flip()
        play_sound('tarot2', 1, 0.6)
        leftmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}

ABN.CalligraphyCard {
  key = "en",
  pos = { x = 2, y = 2 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Florette", mod_conv = "m_abn_mountain", rank = "Ace" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local rightmost = G.hand.cards[#G.hand.cards]
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
        rightmost:flip()
        play_sound('card1', 1)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(rightmost, card.ability.extra.suit_conv, card.ability.extra.rank)
        rightmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        rightmost:flip()
        play_sound('tarot2', 1, 0.6)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}

ABN.CalligraphyCard {
  key = "o_cal",
  pos = { x = 3, y = 2 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
      }
    }
  end,

  config = { extra = { amount = 3 } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind and G.hand.cards[1]:get_id() < 5
  end,

  use = function(self, card, area, copier)
    local leftmost = G.hand.cards[1]
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
        leftmost.ability.perma_bonus = (leftmost.ability.perma_bonus or 0) +
            (leftmost.base.nominal * card.ability.extra.amount)
        SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.CHIPS }, leftmost)
        return true
      end
    }))
    delay(0.2)
  end,

}

ABN.CalligraphyCard {
  key = "pe",
  pos = { x = 5, y = 2 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {

        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Acorn", mod_conv = "m_abn_kinship", rank = "Ace" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

  use = function(self, card, area, copier)
    local rightmost = G.hand.cards[#G.hand.cards]
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
        rightmost:flip()
        play_sound('card1', 1)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      func = function()
        SMODS.change_base(rightmost, card.ability.extra.suit_conv, card.ability.extra.rank)
        rightmost:set_ability(card.ability.extra.mod_conv)
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        rightmost:flip()
        play_sound('tarot2', 1, 0.6)
        rightmost:juice_up(0.3, 0.3)
        return true
      end
    }))
    delay(0.5)
  end,

}
