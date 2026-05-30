-- Program Pack Consumables (coded by cloudzXIII)

SMODS.ConsumableType {
  key = "program_pack",
  primary_colour = HEX("5d6a58"),
  secondary_colour = HEX("5d6a58"),
  collection_rows = { 3, 3 },
  shop_rate = 4,
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
      if not c.edition then
        held[#held + 1] = c
      end
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
  hidden = true,
  soul_set = 'Spectral', -- hmm, what should it be appearing in

  config = {
    extra = {
      base1 = 7,
      odds1 = 10,
      base2 = 1,
      odds2 = 10,
      base3 = 1,
      odds3 = 20,
    }
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chthonian
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_fossil
    local cthonian_num, cthonian_denom = SMODS.get_probability_vars(card, card.ability.extra.base1,
      card.ability.extra.odds1,
      'abn_cthonian')
    local fossil_num, fossil_denom = SMODS.get_probability_vars(card, card.ability.extra.base2,
      card.ability.extra.odds2,
      'abn_fossil')
    local destroy_num, destroy_denom = SMODS.get_probability_vars(card, card.ability.extra.base3,
      card.ability.extra.odds3,
      'abn_destroy')
    return {
      vars = {
        cthonian_num,
        cthonian_denom,
        fossil_num,
        fossil_denom,
        destroy_num,
        destroy_denom,
      }
    }
  end,

  can_use = function(self, card)
    return G.playing_cards and #G.playing_cards > 0
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
    for _, deck_card in ipairs(G.playing_cards) do
      if not deck_card.edition and SMODS.pseudorandom_probability(card, 'abn_exe1', card.ability.extra.base1, card.ability.extra.odds1, 'abn_chthonian') then
        deck_card:set_edition("e_abn_chthonian", true)
        --print("cthonian")
      elseif SMODS.pseudorandom_probability(card, 'abn_exe2', card.ability.extra.base2, card.ability.extra.odds2, 'abn_fossil') then
        deck_card:set_ability("m_abn_fossil")
        --print("fossil")
      elseif SMODS.pseudorandom_probability(card, 'abn_exe3', card.ability.extra.base3, card.ability.extra.odds3, 'abn_destroy') then
        SMODS.destroy_cards(deck_card)
        --print("destroyed")
      end
    end
  end,
  abn_artist_credits = {
    artist = "Strawberry Cereal",
  },
}
