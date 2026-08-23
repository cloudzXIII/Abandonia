-- Program Pack Consumables (coded by cloudzXIII + EricTheToon)

SMODS.ConsumableType {
  key = "program_pack",
  primary_colour = HEX("25a289"),
  secondary_colour = HEX("25a289"),
  collection_rows = { 5, 5 },
  shop_rate = 1,
}

SMODS.UndiscoveredSprite {
  key = 'program_pack',
  atlas = 'abn_AbandoniaUndiscovered',
  pos = { x = 4, y = 1 },
}

SMODS.Consumable {
  key = "png",
  set = 'program_pack',
  cost = 4,
  atlas = "abn_AbandoniaProgramPack",
  pos = { x = 0, y = 0 },
  config = { extra = { amount = 3 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_playing_card', set = 'Edition', config = { extra = 1 } }
    info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
    return { vars = { card.ability.extra.amount } }
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 -- and next(SMODS.Edition:get_edition_cards(G.hand, true))
  end,
  use = function(self, card, area, copier)
    local held = {}
    for _, c in ipairs(G.hand.cards) do
      if not c.edition then
        held[#held + 1] = c
      end
    end
    pseudoshuffle(held, pseudoseed("abn_png"))
    local to_enhance = {}
    for i = 1, math.min(card.ability.extra.amount, #held) do
      to_enhance[#to_enhance + 1] = held[i]
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
    for i, c in ipairs(to_enhance) do
      local percent = 1.15 - (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('card1', percent)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    for _, c in ipairs(to_enhance) do
      G.E_MANAGER:add_event(Event({
        func = function()
          c:set_edition("e_negative", true)
          c:set_ability("m_lucky")
          return true
        end
      }))
    end
    for i, c in ipairs(to_enhance) do
      local percent = 0.85 + (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('tarot2', percent, 0.6)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.5)
  end,
  abn_artist_credits = {
    artist = "Strawberry Cereal",
  },
}

SMODS.Consumable {
  key = "mp4",
  set = 'program_pack',
  cost = 4,
  atlas = "abn_AbandoniaProgramPack",
  pos = { x = 1, y = 0 },
  config = { extra = { amount = 4 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    return { vars = { card.ability.extra.amount } }
  end,
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0 -- and next(SMODS.Edition:get_edition_cards(G.hand, true))
  end,
  use = function(self, card, area, copier)
    local held = {}
    for _, c in ipairs(G.hand.cards) do
      held[#held + 1] = c
    end
    pseudoshuffle(held, pseudoseed('abn_mp4'))

    local chosen = {}
    local destroyed = {}
    for i, c in ipairs(held) do
      if i <= card.ability.extra.amount then
        chosen[#chosen + 1] = c
      else
        destroyed[#destroyed + 1] = c
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
    for _, c in ipairs(chosen) do
      G.E_MANAGER:add_event(Event({
        func = function()
          c:set_edition("e_abn_gloss", true)
          c:set_ability("m_bonus")
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        if #destroyed > 0 then
          SMODS.destroy_cards(destroyed)
        end
        return true
      end
    }))
    delay(0.5)
  end,
  abn_artist_credits = {
    artist = "Strawberry Cereal",
  },
}

SMODS.Consumable {
  key = "apk",
  set = 'program_pack',
  cost = 4,
  atlas = "abn_AbandoniaProgramPack",
  pos = { x = 0, y = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_mercurial
  end,
  can_use = function(self, card)
    local thunk = false
    for _, c in ipairs(G.hand.cards) do
      if ABN.is_number(c) then -- and not c.edition then
        thunk = true
      end
    end
    return G.hand and #G.hand.cards > 0 and thunk
  end,
  use = function(self, card, area, copier)
    local to_enhance = {}
    for _, c in ipairs(G.hand.cards) do
      if ABN.is_number(c) then -- and not c.edition then
        to_enhance[#to_enhance + 1] = c
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
    for i, c in ipairs(to_enhance) do
      local percent = 1.15 - (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('card1', percent)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    for _, c in ipairs(to_enhance) do
      G.E_MANAGER:add_event(Event({
        func = function()
          c:set_ability("m_abn_mercurial")
          c:set_edition("e_foil", true)
          return true
        end
      }))
    end
    for i, c in ipairs(to_enhance) do
      local percent = 0.85 + (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('tarot2', percent, 0.6)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.5)
  end,
  abn_artist_credits = {
    artist = "Strawberry Cereal",
  },
}

SMODS.Consumable {
  key = "zip",
  set = 'program_pack',
  cost = 4,
  atlas = "abn_AbandoniaProgramPack",
  pos = { x = 1, y = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
  end,

  can_use = function(self, card)
    local thunk = false
    for _, c in ipairs(G.hand.cards) do
      local rank = c:get_id()
      if (rank == 2 or rank == 3 or rank == 4 or rank == 5) then -- and not c.edition then
        thunk = true
      end
    end

    return G.hand and #G.hand.cards > 0 and thunk
  end,
  use = function(self, card, area, copier)
    local to_enhance = {}
    for _, c in ipairs(G.hand.cards) do
      local rank = c:get_id()
      if (rank == 2 or rank == 3 or rank == 4 or rank == 5) then -- and not c.edition then
        to_enhance[#to_enhance + 1] = c
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
    for i, c in ipairs(to_enhance) do
      local percent = 1.15 - (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('card1', percent)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    for _, c in ipairs(to_enhance) do
      G.E_MANAGER:add_event(Event({
        func = function()
          c:set_ability("m_mult")
          c:set_edition("e_holo", true)
          return true
        end
      }))
    end
    for i, c in ipairs(to_enhance) do
      local percent = 0.85 + (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('tarot2', percent, 0.6)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.5)
  end,
  abn_artist_credits = {
    artist = "Strawberry Cereal",
  },
}

SMODS.Consumable {
  key = "obj",
  set = 'program_pack',
  cost = 4,
  atlas = "abn_AbandoniaProgramPack",
  pos = { x = 2, y = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
  end,

  can_use = function(self, card)
    local thunk = false
    for _, c in ipairs(G.hand.cards) do
      if c:is_face() then -- and not c.edition then
        thunk = true
      end
    end
    return G.hand and #G.hand.cards > 0 and thunk
  end,
  use = function(self, card, area, copier)
    local to_enhance = {}
    for _, c in ipairs(G.hand.cards) do
      if c:is_face() then -- and not c.edition then
        to_enhance[#to_enhance + 1] = c
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
    for i, c in ipairs(to_enhance) do
      local percent = 1.15 - (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('card1', percent)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    for _, c in ipairs(to_enhance) do
      G.E_MANAGER:add_event(Event({
        func = function()
          assert(SMODS.change_base(c, nil, 'Ace'))
          c:set_edition("e_abn_abandond")
          return true
        end
      }))
    end
    for i, c in ipairs(to_enhance) do
      local percent = 0.85 + (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('tarot2', percent, 0.6)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.5)
  end,
  abn_artist_credits = {
    artist = "Strawberry Cereal",
  },
}

SMODS.Consumable {
  key = "exe",
  set = 'program_pack',
  cost = 4,
  atlas = "abn_AbandoniaProgramPack",
  pos = { x = 2, y = 0 },

  config = {
    extra = {
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    return {
      vars = {
      }
    }
  end,

  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    local suit_mapping = {
      Hearts = 'abn_Coin',
      Diamonds = 'abn_Baton',
      Clubs = 'abn_Chalice',
      Spades = 'abn_Sword'
    }

    local to_enhance = {}

    -- convert to suit
    for _, hand_card in ipairs(G.hand.cards) do
      local changed = false

      for base_suit, target_suit in pairs(suit_mapping) do
        if hand_card:is_suit(base_suit) then
          hand_card:change_suit(target_suit)
          to_enhance[#to_enhance + 1] = hand_card
          changed = true
          break
        end
      end

      if changed then
        hand_card:juice_up(0.3, 0.3)
      end
    end

    delay(0.5)

    -- enhancing
    for i, c in ipairs(to_enhance) do
      local percent = 1.15 - (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('card1', percent)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    for _, c in ipairs(to_enhance) do
      G.E_MANAGER:add_event(Event({
        func = function()
          c:set_ability("m_bonus")
          c:set_edition("e_foil", true)
          return true
        end
      }))
    end
    for i, c in ipairs(to_enhance) do
      local percent = 0.85 + (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('tarot2', percent, 0.6)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.5)
  end,
  abn_artist_credits = {
    artist = "Strawberry Cereal",
  },
}

SMODS.Consumable {
  key = "lua",
  set = 'program_pack',
  cost = 4,
  atlas = "abn_AbandoniaProgramPack",
  pos = { x = 3, y = 0 },

  config = {
    extra = {}
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_vintage
    return {
      vars = {}
    }
  end,

  can_use = function(self, card)
    if G.hand and #G.hand.cards > 0 then
      local target_ranks = { abn_11 = true, abn_12 = true, abn_13 = true, abn_14 = true }
      for _, hand_card in ipairs(G.hand.cards) do
        if target_ranks[hand_card.base.value] then
          return true
        end
      end
    end
    return false
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    local suit_mapping = {
      Hearts = 'abn_Florette',
      Diamonds = 'abn_Bell',
      Clubs = 'abn_Leaf',
      Spades = 'abn_Acorn'
    }

    local to_enhance = {}

    -- convert to suit
    for _, hand_card in ipairs(G.hand.cards) do
      local changed = false

      for base_suit, target_suit in pairs(suit_mapping) do
        if hand_card:is_suit(base_suit) then
          hand_card:change_suit(target_suit)
          to_enhance[#to_enhance + 1] = hand_card
          changed = true
          break
        end
      end

      if changed then
        hand_card:juice_up(0.3, 0.3)
      end
    end

    delay(0.5)

    -- enhancing
    for i, c in ipairs(to_enhance) do
      local percent = 1.15 - (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('card1', percent)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    for _, c in ipairs(to_enhance) do
      G.E_MANAGER:add_event(Event({
        func = function()
          c:set_ability("m_bonus")
          c:set_edition("e_abn_vintage", true)
          return true
        end
      }))
    end
    for i, c in ipairs(to_enhance) do
      local percent = 0.85 + (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('tarot2', percent, 0.6)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.5)
  end,


  abn_artist_credits = {
    artist = "Comykel",
  },

  in_pool = function(self, args)
    local target_ranks = { abn_11 = true, abn_12 = true, abn_13 = true, abn_14 = true }

    for _, playing_card in ipairs(G.playing_cards or {}) do
      if target_ranks[playing_card.base.value] then
        return true
      end
    end
    return false
  end
}

SMODS.Consumable {
  key = "pdf",
  set = 'program_pack',
  cost = 4,
  atlas = "abn_AbandoniaProgramPack",
  pos = { x = 4, y = 0 },

  config = {
    extra = {}
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    return {
      vars = {}
    }
  end,

  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    local suit_mapping = {
      Hearts = 'abn_Snow',
      Diamonds = 'abn_Penumbra',
      Clubs = 'abn_Tie',
      Spades = 'abn_Bow'
    }

    local to_enhance = {}

    -- convert to suit
    for _, hand_card in ipairs(G.hand.cards) do
      local changed = false

      for base_suit, target_suit in pairs(suit_mapping) do
        if hand_card:is_suit(base_suit) then
          hand_card:change_suit(target_suit)
          to_enhance[#to_enhance + 1] = hand_card
          changed = true
          break
        end
      end

      if changed then
        hand_card:juice_up(0.3, 0.3)
      end
    end

    delay(0.5)

    -- enhancing
    for i, c in ipairs(to_enhance) do
      local percent = 1.15 - (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('card1', percent)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    for _, c in ipairs(to_enhance) do
      G.E_MANAGER:add_event(Event({
        func = function()
          c:set_ability("m_mult")
          c:set_edition("e_foil", true)
          return true
        end
      }))
    end
    for i, c in ipairs(to_enhance) do
      local percent = 0.85 + (i - 0.999) / (#to_enhance - 0.998) * 0.3
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          c:flip()
          play_sound('tarot2', percent, 0.6)
          c:juice_up(0.3, 0.3)
          return true
        end
      }))
    end
    delay(0.5)
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}


SMODS.Consumable {
  key = "jpg",
  set = "program_pack",
  config = { extra = { chips = 15, mult = 10 } },
  pos = { x = 3, y = 1 },
  atlas = "AbandoniaProgramPack",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area, copier)
    for _, v in ipairs(G.playing_cards) do
      if v:is_suit("Diamonds") or v:is_suit("Hearts") or v:is_suit("abn_suitless") then
        v.permadebuff = true
      elseif v:is_suit("Spades") or v:is_suit("Clubs") or v:is_suit("abn_Snow") or v:is_suit("abn_Tie") or v:is_suit("abn_Bow") or v:is_suit("abn_Penumbra") then
        v.ability.perma_bonus = (v.ability.perma_bonus or 0) + card.ability.extra.chips
        v.ability.perma_mult = (v.ability.perma_mult or 0) + card.ability.extra.mult
      end
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}

SMODS.Consumable {
  key = "gif",
  set = "program_pack",
  config = { extra = { chips = 15, mult = 10 } },
  pos = { x = 4, y = 1 },
  atlas = "AbandoniaProgramPack",
  cost = 4,
  discovered = false,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
  end,

  can_use = function(self, card)
    return true
  end,

  use = function(self, card, area, copier)
    for _, v in ipairs(G.playing_cards) do
      if v:is_suit("Spades") or v:is_suit("Clubs") or v:is_suit("abn_Snow") or v:is_suit("abn_Tie") or v:is_suit("abn_Bow") or v:is_suit("abn_Penumbra") then
        v.permadebuff = true
      elseif v:is_suit("Diamonds") or v:is_suit("Hearts") or v:is_suit("abn_suitless") then
        v.ability.perma_bonus = (v.ability.perma_bonus or 0) + card.ability.extra.chips
        v.ability.perma_mult = (v.ability.perma_mult or 0) + card.ability.extra.mult
      end
    end
  end,

  abn_artist_credits = {
    artist = "Grass",
  },
}
