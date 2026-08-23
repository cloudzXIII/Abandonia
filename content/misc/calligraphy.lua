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

ABN.AncientCalligraphyCard = SMODS.Consumable:extend({
  set = 'calligraphy',
  cost = 10,
  hidden = true,
  soul_set = "calligraphy",
  soul_rate = 0.003,
  atlas = "abn_AbandoniaAncientCalligraphy",
  pos = { x = 0, y = 0 },
  abn_artist_credits = {
    artist = "0kronix"
  },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize('k_ancient_calligraphy'),
      get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.calligraphy.text_colour,
      1.2)
  end,
  
})

ABN.NumeralCalligraphyCard = SMODS.Consumable:extend({
  set = 'calligraphy',
  cost = 4,
  atlas = "abn_AbandoniaNumeralCalligraphy",
  pos = { x = 0, y = 0 },
  abn_artist_credits = {
    artist = "0kronix"
  },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize('k_numeral_calligraphy'),
      get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.calligraphy.text_colour,
      1.2)
  end,

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
  
  
})

SMODS.UndiscoveredSprite({ -- undiscovered sprite
    key = 'calligraphy',
    atlas = "abn_undiscovered",
    pos = { x = 0, y = 0 },
    no_overlay = true
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

  config = { extra = { suit_conv = "abn_Anchor", mod_conv = "m_abn_ocean", } },
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
  key = "i_cal",
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



-- ANCIENT CALLIGRAPHY

ABN.AncientCalligraphyCard {
  key = "dzelo",
  pos = { x = 0, y = 0 },
  atlas = "abn_AbandoniaAncientCalligraphy",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {}
    }
  end,

  config = { extra = { mod_conv = "m_abn_kinship" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
        and not SMODS.has_no_suit(G.hand.cards[1])
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

    for i = 1, #G.hand.cards do
      local current = G.hand.cards[i]

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('card1', 1)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.change_base(current, leftmost.base.suit)
          current:set_ability(card.ability.extra.mod_conv)
          if leftmost.edition then
            current:set_edition(leftmost.edition, true)
          end
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('tarot2', 1, 0.6)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.5)
  end,


}

ABN.AncientCalligraphyCard {
  key = "ize",
  pos = { x = 1, y = 0 },
  atlas = "abn_AbandoniaAncientCalligraphy",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {}
    }
  end,

  config = { extra = { mod_conv = "m_abn_wallpaper" } },
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

    for i = 1, #G.hand.cards do
      local current = G.hand.cards[i]


      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('card1', 1)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          current:set_ability(card.ability.extra.mod_conv)
          if rightmost.seal then
            current:set_seal(rightmost.seal)
          end
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('tarot2', 1, 0.6)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.5)
  end,


}

ABN.AncientCalligraphyCard {
  key = "oy",
  pos = { x = 2, y = 0 },
  atlas = "abn_AbandoniaAncientCalligraphy",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.e_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Coin", mod_conv = "m_gold", e_conv = "e_gloss", rank = "abn_13" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
        and G.jokers and #G.jokers.cards > 0
  end,

  use = function(self, card, area, copier)
    local leftmost_joker = G.jokers.cards[1]

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    SMODS.destroy_cards(leftmost_joker)

    for i = 1, #G.hand.cards do
      local current = G.hand.cards[i]


      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('card1', 1)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.change_base(current, card.ability.extra.suit_conv, card.ability.extra.rank)
          current:set_ability(card.ability.extra.mod_conv)
          current:set_edition(card.ability.extra.e_conv, true)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('tarot2', 1, 0.6)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.5)
  end,


}

ABN.AncientCalligraphyCard {
  key = "ot",
  pos = { x = 3, y = 0 },
  atlas = "abn_AbandoniaAncientCalligraphy",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_singular'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Florette", mod_conv = "m_abn_reinforcement" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
        and G.jokers and #G.jokers.cards > 0
  end,

  use = function(self, card, area, copier)
    local rightmost_joker = G.jokers.cards[#G.jokers.cards]

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    for i = 1, #G.hand.cards do
      local current = G.hand.cards[i]


      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('card1', 1)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.change_base(current, card.ability.extra.suit_conv)
          current:set_ability(card.ability.extra.mod_conv)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('tarot2', 1, 0.6)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))
    end

    local rightmost_stickers = ABN.listStickers(rightmost_joker)
    if rightmost_stickers and #rightmost_stickers > 0 then
      for _, v in ipairs(G.jokers.cards) do
        if v ~= card then
          for _, sticker in ipairs(rightmost_stickers) do
            v:add_sticker(sticker, true)
            v:juice_up(0.3, 0.5)
          end
        end
      end
    end

    delay(0.5)
  end,


}

ABN.AncientCalligraphyCard {
  key = "yat",
  pos = { x = 4, y = 0 },
  atlas = "abn_AbandoniaAncientCalligraphy",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        G.hand and #G.hand.cards > 0 and G.hand.cards[1].base.nominal or 0
      }
    }
  end,

  config = { extra = { mod_conv = "m_abn_ocean" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind and
        not SMODS.has_no_rank(G.hand.cards[1])
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

    for i = 1, #G.hand.cards do
      local current = G.hand.cards[i]


      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('card1', 1)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          current:set_ability(card.ability.extra.mod_conv)
          current.ability.perma_mult = (current.ability.perma_mult or 0) + leftmost.base.nominal
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('tarot2', 1, 0.6)
          current:juice_up(0.3, 0.3)
          SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, current)
          return true
        end
      }))
    end
    delay(0.5)
  end,


}

ABN.AncientCalligraphyCard {
  key = "iya",
  pos = { x = 5, y = 0 },
  atlas = "abn_AbandoniaAncientCalligraphy",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        G.hand and #G.hand.cards > 0 and (G.hand.cards[#G.hand.cards].base.nominal * 2) or 0
      }
    }
  end,

  config = { extra = { mod_conv = "m_abn_mountain" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind and
        not SMODS.has_no_rank(G.hand.cards[#G.hand.cards])
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

    for i = 1, #G.hand.cards do
      local current = G.hand.cards[i]


      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('card1', 1)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          current:set_ability(card.ability.extra.mod_conv)
          current.ability.perma_bonus = (current.ability.perma_bonus or 0) +
              (rightmost.base.nominal * 2)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('tarot2', 1, 0.6)
          current:juice_up(0.3, 0.3)
          SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.CHIPS }, current)
          return true
        end
      }))
    end
    delay(0.5)
  end,


}


ABN.AncientCalligraphyCard {
  key = "iye",
  pos = { x = 0, y = 1 },
  atlas = "abn_AbandoniaAncientCalligraphy",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        G.hand and #G.hand.cards > 0 and G.hand.cards[#G.hand.cards].base.nominal or 0
      }
    }
  end,

  config = { extra = { mod_conv = "m_abn_zen" } },
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind and
        not SMODS.has_no_rank(G.hand.cards[#G.hand.cards])
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

    for i = 1, #G.hand.cards do
      local current = G.hand.cards[i]


      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('card1', 1)
          current:juice_up(0.3, 0.3)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        func = function()
          current:set_ability(card.ability.extra.mod_conv)
          current.ability.perma_mult = (current.ability.perma_mult or 0) + rightmost.base.nominal
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          current:flip()
          play_sound('tarot2', 1, 0.6)
          current:juice_up(0.3, 0.3)
          SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, current)
          return true
        end
      }))
    end
    delay(0.5)
  end,


}

-- Ascension Power Ancient Calligraphy cards (coded by LasagneFelidae)
if next(SMODS.find_mod("Spectrallib")) then
  ABN.AncientCalligraphyCard {
    key = "izhitsa",
    pos = { x = 0, y = 2 },
    atlas = "abn_AbandoniaAncientCalligraphy",
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
      return {
        vars = {

          (G.hand and #G.hand.cards > 0) and (card.ability.extra.asc_pow * #G.hand.cards) or 0

        }
      }
    end,

    config = { extra = { mod_conv = "m_abn_kintsugi", asc_pow = 1 } },
    can_use = function(self, card)
      return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
    end,

    use = function(self, card, area, copier)
      for i = 1, #G.hand.cards do
        if i == 1 then
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
              G.hand.cards[i]:flip()
              play_sound('card1', 1)
              G.hand.cards[i]:juice_up(0.3, 0.3)
              return true
            end
          }))
          G.E_MANAGER:add_event(Event({
            func = function()
              G.hand.cards[i]:set_ability(card.ability.extra.mod_conv)
              return true
            end
          }))
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
              G.hand.cards[i]:flip()
              play_sound('tarot2', 1, 0.6)
              G.hand.cards[i]:juice_up(0.3, 0.3)
              return true
            end
          }))
          delay(0.5)
        end
        G.E_MANAGER:add_event(Event({
          func = function()
            G.hand.cards[i]:juice_up(0.3, 0.5)
            play_sound('tarot1', 1, 0.6)
            return true
          end
        }))
        G.hand.cards[i].ability.slib_perma_plus_asc = (G.hand.cards[i].ability.slib_perma_plus_asc or 0) + #G.hand.cards
        delay(0.5)
      end
    end,
  }

  ABN.AncientCalligraphyCard {
    key = "koppa",
    pos = { x = 1, y = 2 },
    atlas = "abn_AbandoniaAncientCalligraphy",
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.e_conv]
      return {
        vars = {

          card.ability.extra.asc_pow

        }
      }
    end,

    config = { extra = { e_conv = "e_abn_chromatic", asc_pow = 1 } },
    can_use = function(self, card)
      return G.hand and #G.hand.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
    end,

    use = function(self, card, area, copier)
      for i = 1, #G.hand.cards do
        local current = G.hand.cards[i]
        G.E_MANAGER:add_event(Event({
          func = function()
            current:juice_up(0.3, 0.5)
            play_sound('tarot1', 1)
            return true
          end
        }))
        current.ability.slib_perma_plus_asc = (current.ability.slib_perma_plus_asc or 0) + card.ability.extra.asc_pow
        delay(0.5)

        if i == #G.hand.cards then
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
              current:flip()
              play_sound('card1', 1)
              current:juice_up(0.3, 0.3)
              return true
            end
          }))
          G.E_MANAGER:add_event(Event({
            func = function()
              current:set_edition(card.ability.extra.e_conv)
              return true
            end
          }))
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
              current:flip()
              play_sound('tarot2', 1, 0.6)
              current:juice_up(0.3, 0.3)
              return true
            end
          }))
          delay(0.5)
        end
      end
    end,
  }
end

ABN.CalligraphyCard {
  key = "es",
  pos = { x = 0, y = 3 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Star", mod_conv = "m_abn_flux" } },
  
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
        SMODS.change_base(leftmost, card.ability.extra.suit_conv, leftmost.base.value)
        leftmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
  key = "tje",
  pos = { x = 1, y = 3 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.rank_conv, 'ranks'),
      }
    }
  end,

  config = { extra = { mod_conv = "m_abn_discontinued", rank_conv = "Ace" } },

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
        SMODS.change_base(rightmost, rightmost.base.suit, card.ability.extra.rank_conv)
        rightmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
  key = "ef",
  pos = { x = 3, y = 3 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        localize(card.ability.extra.rank_conv, 'ranks'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "Spades", mod_conv = "m_abn_darkner", rank_conv = "abn_14" } },

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
        SMODS.change_base(rightmost, card.ability.extra.suit_conv, card.ability.extra.rank_conv)
        rightmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
  key = "xe",
  pos = { x = 4, y = 3 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        localize(card.ability.extra.rank_conv, 'ranks'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "Hearts", mod_conv = "m_abn_lightner", rank_conv = "abn_14" } },

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
        SMODS.change_base(leftmost, card.ability.extra.suit_conv, card.ability.extra.rank_conv)
        leftmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
  key = "ce",
  pos = { x = 5, y = 3 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        localize(card.ability.extra.rank_conv, 'ranks'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Crown", mod_conv = "m_abn_tile", rank_conv = "Ace" } },

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
        SMODS.change_base(rightmost, card.ability.extra.suit_conv, card.ability.extra.rank_conv)
        rightmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
  key = "che",
  pos = { x = 0, y = 4 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        localize(card.ability.extra.rank_conv, 'ranks'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Star", mod_conv = "m_abn_papermache", rank_conv = "10" } },

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
        SMODS.change_base(leftmost, card.ability.extra.suit_conv, card.ability.extra.rank_conv)
        leftmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
  key = "sha",
  pos = { x = 1, y = 4 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        localize(card.ability.extra.rank_conv, 'ranks'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Moon", mod_conv = "m_abn_papermache", rank_conv = "9" } },

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
        SMODS.change_base(rightmost, card.ability.extra.suit_conv, card.ability.extra.rank_conv)
        rightmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
  key = "sa",
  pos = { x = 2, y = 4 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_suitless", mod_conv = "m_lucky" } },

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
        SMODS.change_base(leftmost, card.ability.extra.suit_conv, leftmost.base.value)
        leftmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
  key = "be",
  pos = { x = 3, y = 4 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {}
    }
  end,

  config = { extra = { mod_conv = "m_abn_oilfire" } },

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
        rightmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
  key = "yer",
  pos = { x = 4, y = 4 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.suit_conv, 'suits_plural'),
        colours = { G.C.SUITS[card.ability.extra.suit_conv] }
      }
    }
  end,

  config = { extra = { suit_conv = "abn_Talon", mod_conv = "m_abn_teastain" } },

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
        SMODS.change_base(leftmost, card.ability.extra.suit_conv, leftmost.base.value)
        leftmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
  key = "soft_sign",
  pos = { x = 5, y = 4 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.mod_conv]
    return {
      vars = {
        localize(card.ability.extra.rank_conv, 'ranks'),
      }
    }
  end,

  config = { extra = { mod_conv = "m_abn_sew", rank_conv = "abn_13" } },

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
        SMODS.change_base(rightmost, rightmost.base.suit, card.ability.extra.rank_conv)
        rightmost:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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

ABN.NumeralCalligraphyCard {
  key = "adeen",
  pos = { x = 0, y = 0 },
  config = { extra = { enh_key = "abn_stk_gold" } },
  
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

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

ABN.NumeralCalligraphyCard {
  key = "dva",
  pos = { x = 1, y = 0 },
  config = { extra = { enh_key = "abn_stk_mult" } },
  
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

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
ABN.NumeralCalligraphyCard {
  key = "tree",
  pos = { x = 2, y = 0 },
  config = { extra = { enh_key = "abn_stk_bonus" } },
  
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

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

ABN.NumeralCalligraphyCard {
  key = "chyetirye",
  pos = { x = 2, y = 0 },
  config = { extra = { enh_key = "abn_stk_lucky" } },
  
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

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

ABN.NumeralCalligraphyCard {
  key = "pyat",
  pos = { x = 4, y = 0 },
  config = { extra = { enh_key = "abn_stk_stone" } },
  
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

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

ABN.NumeralCalligraphyCard {
  key = "shest",
  pos = { x = 5, y = 0 },
  config = { extra = { enh_key = "abn_stk_steel" } },
  
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

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

ABN.NumeralCalligraphyCard {
  key = "syem",
  pos = { x = 0, y = 1 },
  config = { extra = { enh_key = "abn_stk_glass" } },
  
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

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


ABN.NumeralCalligraphyCard {
  key = "vosyem",
  pos = { x = 1, y = 1 },
  config = { extra = { enh_key = "abn_stk_wild" } },
  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0 and G.GAME.blind and not G.GAME.blind.in_blind
  end,

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