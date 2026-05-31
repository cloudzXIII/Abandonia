SMODS.PokerHand {
  key = '6oak',
  mult = 16,
  chips = 160,
  l_chips = 35,
  l_mult = 3,
  visible = false,
  above_hand = 'Five of a Kind',
  example = {

    { 'S_A', true },
    { 'D_A', true },
    { 'C_A', true },
    { 'H_A', true },
    { 'S_A', true },
    { 'D_A', true }

  },
  evaluate = function(parts, hand)
    return get_X_same(6, hand)
  end
}

SMODS.Consumable {
  key = "grandcross",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 0, y = 0 },
  config = { hand_type = "abn_6oak", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Dallan"
  },
}

SMODS.PokerHand {
  key = 'double_triple',
  mult = 6,
  chips = 60,
  l_mult = 4,
  l_chips = 40,
  visible = false,
  example = {
    { 'H_Q', true },
    { 'C_Q', true },
    { 'D_Q', true },
    { 'H_7', true },
    { 'D_7', true },
    { 'S_7', true },
  },
  evaluate = function(parts, hand)
    return #parts._3 >= 2 and parts._all_pairs or {}
  end
}

SMODS.Consumable {
  key = "queaor",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 4, y = 3 },
  config = { hand_type = "abn_double_triple", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Bunnet"
  },
}

SMODS.PokerHand {
  key = 'triple_pair',
  mult = 3,
  chips = 20,
  l_mult = 2,
  l_chips = 20,
  visible = false,
  above_hand = 'Two Pair',
  example = {
    { 'H_Q', true },
    { 'C_Q', true },
    { 'D_6', true },
    { 'H_6', true },
    { 'D_7', true },
    { 'S_7', true },
  },
  evaluate = function(parts, hand)
    if #hand == 6 then
      if #parts._2 < 3 then
        return {}
      end
      return parts._all_pairs
    end
  end
}

SMODS.Consumable {
  key = "supernova",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 1, y = 0 },
  config = { hand_type = "abn_triple_pair", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Dallan"
  },
}

if not (next(SMODS.find_mod('Bunco')) or next(SMODS.find_mod("SixSuits")) or next(SMODS.find_mod("SpectrumFramework"))) then
  -- Spectrum Hands (Credits to SpectrumFramework, Paperback, Bunco and SixSuits)

  --if not next(SMODS.find_mod('Paperback')) then
  SMODS.PokerHandPart { -- Spectrum Part - Copied from SpectrumFramework who got it from Bunco who got it from SixSuits
    key = 'spectrum',
    func = function(hand)
      if #hand < 5 then return {} end
      local suits = {}

      for k, _ in pairs(SMODS.Suits) do
        suits[k] = 0
      end

      for _, card in ipairs(hand) do
        if not SMODS.has_any_suit(card) then
          for suit, count in pairs(suits) do
            if card:is_suit(suit, nil, true) and count == 0 then
              suits[suit] = count + 1
              break
            end
          end
        end
      end

      for _, card in ipairs(hand) do
        if SMODS.has_any_suit(card) then
          for suit, count in pairs(suits) do
            if card:is_suit(suit, nil, true) and count == 0 then
              suits[suit] = count + 1
              break
            end
          end
        end
      end

      local unique_suits = 0

      for _, v in pairs(suits) do
        if v > 0 then unique_suits = unique_suits + 1 end
      end
      return (unique_suits >= 5) and { hand } or {}
    end
  }

  SMODS.PokerHand { -- Spectrum (Copied from Paperback who referenced it from SixSuits, thanks!)
    key = 'Spectrum',
    visible = false,
    chips = 50,
    mult = 6,
    l_chips = 20,
    l_mult = 2,
    example = {
      { 'S_2', true },
      { 'D_7', true },
      { 'C_3', true },
      { 'H_5', true, enhancement = "m_wild" },
      { 'H_K', true },
    },

    evaluate = function(parts)
      return parts.abn_spectrum
    end
  }
  SMODS.Consumable {
    key = "korim",
    set = "Planet",
    cost = 4,
    atlas = "AbandoniaPlanets",
    pos = { x = 3, y = 2 },
    config = { hand_type = "abn_Spectrum", softlock = true },
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          G.GAME.hands[card.ability.hand_type].level,
          localize(card.ability.hand_type, 'poker_hands'),
          G.GAME.hands[card.ability.hand_type].l_mult,
          G.GAME.hands[card.ability.hand_type].l_chips,
          colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
        }
      }
    end,
    abn_artist_credits = {
      artist = "Dallan"
    },
  }
  SMODS.PokerHand { -- Straight Spectrum (Copied from Paperback who referenced it from SixSuits, thanks!)
    key = 'Straight Spectrum',
    visible = false,
    chips = 120,
    mult = 10,
    l_chips = 45,
    l_mult = 4,
    example = {
      { 'S_Q', true },
      { 'H_3', true, enhancement = "m_wild" },
      { 'C_T', true },
      { 'D_9', true },
      { 'H_8', true }
    },

    evaluate = function(parts)
      if not next(parts.abn_spectrum) or not next(parts._straight) then return {} end
      return { SMODS.merge_lists(parts.abn_spectrum, parts._straight) }
    end,

    modify_display_text = function(self, _cards, scoring_hand)
      local royal = true
      for j = 1, #scoring_hand do
        local rank = not SMODS.has_no_rank(scoring_hand[j]) and SMODS.Ranks[scoring_hand[j].base.value]
        royal = rank and royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
      end

      if royal then
        return self.key .. ' (Royal)'
      end
    end
  }
  SMODS.Consumable {
    key = "malin",
    set = "Planet",
    cost = 4,
    atlas = "AbandoniaPlanets",
    pos = { x = 4, y = 2 },
    config = { hand_type = "abn_Straight Spectrum", softlock = true },
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          G.GAME.hands[card.ability.hand_type].level,
          localize(card.ability.hand_type, 'poker_hands'),
          G.GAME.hands[card.ability.hand_type].l_mult,
          G.GAME.hands[card.ability.hand_type].l_chips,
          colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
        }
      }
    end,
    abn_artist_credits = {
      artist = "Dallan"
    },
  }
  SMODS.PokerHand { -- Spectrum House (Copied from Paperback who referenced it from SixSuits, thanks!)
    key = 'Spectrum House',
    above_hand = 'Flush House',
    visible = false,
    chips = 150,
    mult = 15,
    l_chips = 40,
    l_mult = 4,
    example = {
      { 'S_Q', true },
      { 'S_Q', true, enhancement = "m_wild" },
      { 'C_Q', true },
      { 'D_8', true },
      { 'H_8', true }
    },

    evaluate = function(parts)
      if #parts._3 < 1 or #parts._2 < 2 or not next(parts.abn_spectrum) then return {} end
      return { SMODS.merge_lists(parts._all_pairs, parts.abn_spectrum) }
    end
  }
  SMODS.Consumable {
    key = "thaeton",
    set = "Planet",
    cost = 4,
    atlas = "AbandoniaPlanets",
    pos = { x = 5, y = 2 },
    config = { hand_type = "abn_Spectrum House", softlock = true },
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          G.GAME.hands[card.ability.hand_type].level,
          localize(card.ability.hand_type, 'poker_hands'),
          G.GAME.hands[card.ability.hand_type].l_mult,
          G.GAME.hands[card.ability.hand_type].l_chips,
          colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
        }
      }
    end,
    abn_artist_credits = {
      artist = "Dallan"
    },
  }
  SMODS.PokerHand { -- Spectrum Five (Copied from Paperback who referenced it from SixSuits, thanks!)
    key = 'Spectrum Five',
    above_hand = 'Flush Five',
    visible = false,
    chips = 180,
    mult = 18,
    l_chips = 55,
    l_mult = 3,
    example = {
      { 'S_7', true },
      { 'D_7', true },
      { 'H_7', true, enhancement = "m_wild" },
      { 'H_7', true },
      { 'C_7', true }
    },

    evaluate = function(parts)
      if not next(parts._5) or not next(parts.abn_spectrum) then return {} end
      return { SMODS.merge_lists(parts._5, parts.abn_spectrum) }
    end
  }
  SMODS.Consumable {
    key = "muroth",
    set = "Planet",
    cost = 4,
    atlas = "AbandoniaPlanets",
    pos = { x = 0, y = 3 },
    config = { hand_type = "abn_Spectrum Five", softlock = true },
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          G.GAME.hands[card.ability.hand_type].level,
          localize(card.ability.hand_type, 'poker_hands'),
          G.GAME.hands[card.ability.hand_type].l_mult,
          G.GAME.hands[card.ability.hand_type].l_chips,
          colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
        }
      }
    end,
    abn_artist_credits = {
      artist = "Dallan"
    },
  }
  --end
  SMODS.PokerHand { -- Spectrum Six
    key = 'Spectrum Six',
    above_hand = 'Spectrum Five',
    visible = false,
    chips = 180,
    mult = 18,
    l_chips = 55,
    l_mult = 3,
    example = {
      { 'S_7',      true },
      { 'D_7',      true },
      { 'abn_SN_7', true },
      { 'H_7',      true },
      { 'C_7',      true },
      { 'H_7',      true, enhancement = "m_wild" },
    },

    evaluate = function(parts, hand)
      if not next(get_X_same(6, hand)) or not next(parts.abn_spectrum) then return {} end
      return { SMODS.merge_lists(get_X_same(6, hand), parts.abn_spectrum) }
    end
  }

  SMODS.PokerHand { -- Specflush
    key = 'Specflush',
    visible = false,
    chips = 75,
    mult = 10,
    l_chips = 35,
    l_mult = 5,
    example = {
      { 'S_2', true },
      { 'D_5', true, enhancement = "m_wild" },
      { 'H_J', true, enhancement = "m_wild" },
      { 'S_A', true, enhancement = "m_wild" },
      { 'C_8', true, enhancement = "m_wild" },
    },
    evaluate = function(parts)
      if not next(parts.abn_spectrum) or not next(parts._flush) then return {} end
      return { SMODS.merge_lists(parts.abn_spectrum, parts._flush) }
    end,
  }
  SMODS.Consumable {
    key = "itea",
    set = "Planet",
    cost = 4,
    atlas = "AbandoniaPlanets",
    pos = { x = 1, y = 3 },
    config = { hand_type = "abn_Specflush", softlock = true },
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          G.GAME.hands[card.ability.hand_type].level,
          localize(card.ability.hand_type, 'poker_hands'),
          G.GAME.hands[card.ability.hand_type].l_mult,
          G.GAME.hands[card.ability.hand_type].l_chips,
          colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
        }
      }
    end,
    abn_artist_credits = {
      artist = "Dallan"
    },
  }
  SMODS.PokerHand { -- Straight Specflush
    key = 'Straight Specflush',
    visible = false,
    chips = 130,
    mult = 11,
    l_chips = 40,
    l_mult = 5,
    example = {
      { 'S_A', true },
      { 'H_2', true, enhancement = "m_wild" },
      { 'H_3', true, enhancement = "m_wild" },
      { 'C_4', true, enhancement = "m_wild" },
      { 'C_5', true, enhancement = "m_wild" },
    },
    evaluate = function(parts)
      if not next(parts.abn_spectrum) or not next(parts._flush) or not next(parts._straight) then return {} end
      return { SMODS.merge_lists(parts.abn_spectrum, parts._flush, parts._straight) }
    end,
  }

  SMODS.PokerHand { -- Specflush House
    key = 'Specflush House',
    visible = false,
    chips = 175,
    mult = 15,
    l_chips = 70,
    l_mult = 5,
    example = {
      { 'S_A', true },
      { 'C_A', true, enhancement = "m_wild" },
      { 'C_A', true, enhancement = "m_wild" },
      { 'C_5', true, enhancement = "m_wild" },
      { 'D_5', true, enhancement = "m_wild" },
    },
    evaluate = function(parts)
      if #parts._3 < 1 or #parts._2 < 2 or not next(parts.abn_spectrum) or not next(parts._flush) then return {} end
      return { SMODS.merge_lists(parts.abn_spectrum, parts._flush, parts._all_pairs) }
    end,
  }

  SMODS.PokerHand { -- Specflush Five
    key = 'Specflush Five',
    visible = false,
    chips = 190,
    mult = 19,
    l_chips = 80,
    l_mult = 5,
    example = {
      { 'S_8', true },
      { 'D_8', true, enhancement = "m_wild" },
      { 'H_8', true, enhancement = "m_wild" },
      { 'H_8', true, enhancement = "m_wild" },
      { 'C_8', true, enhancement = "m_wild" },
    },
    evaluate = function(parts)
      if not next(parts._5) or not next(parts.abn_spectrum) or not next(parts._flush) then return {} end
      return { SMODS.merge_lists(parts.abn_spectrum, parts._flush, parts._5) }
    end,
  }
  SMODS.Consumable {
    key = "zakerna",
    set = "Planet",
    cost = 4,
    atlas = "AbandoniaPlanets",
    pos = { x = 2, y = 3 },
    config = { hand_type = "abn_Specflush Five", softlock = true },
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          G.GAME.hands[card.ability.hand_type].level,
          localize(card.ability.hand_type, 'poker_hands'),
          G.GAME.hands[card.ability.hand_type].l_mult,
          G.GAME.hands[card.ability.hand_type].l_chips,
          colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
        }
      }
    end,
    abn_artist_credits = {
      artist = "Dallan"
    },
  }
  SMODS.PokerHand {
    key = 'Specflush Six',
    visible = false,
    chips = 200,
    mult = 20,
    l_chips = 80,
    l_mult = 5,
    example = {
      { 'S_8', true },
      { 'D_8', true, enhancement = "m_wild" },
      { 'H_8', true, enhancement = "m_wild" },
      { 'H_8', true, enhancement = "m_wild" },
      { 'C_8', true, enhancement = "m_wild" },
      { 'S_8', true, enhancement = "m_wild" },
    },
    evaluate = function(parts, hand)
      local six_oak = get_X_same(6, hand)
      if #hand == 6 and next(six_oak) and next(parts.abn_spectrum) and next(parts._flush) then
        return { SMODS.merge_lists(six_oak, parts.abn_spectrum, parts._flush) }
      end
    end
  }
end
SMODS.Consumable {
  key = "veuv",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 3, y = 3 },
  config = { hand_type = "abn_Specflush Six", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Dallan"
  },
}

--#region new pokerhands
SMODS.PokerHand {
  key = 'Abyss',
  visible = false,
  chips = 38,
  mult = 4,
  l_chips = 20,
  l_mult = 2,
  example = {
    { 'abn_SUI_2', true },
    { 'abn_SUI_7', true },
    { 'abn_SUI_3', true },
    { 'abn_SUI_5', true },
    { 'abn_SUI_K', true },
  },
  evaluate = function(parts, hand)
    if #hand < 5 then return {} end
    local suitless_count = 0
    local suitless_cards = {}

    for _, card in ipairs(hand) do
      if SMODS.has_no_suit(card) then
        suitless_count = suitless_count + 1
        table.insert(suitless_cards, card)
      end
    end

    if suitless_count >= 5 then
      return { suitless_cards }
    end

    return {}
  end
}

SMODS.PokerHand {
  key = 'Haunted House',
  visible = false,
  chips = 75,
  mult = 6,
  l_chips = 30,
  l_mult = 2,
  example = {
    { 'S_Q',       true },
    { 'D_Q',       true },
    { 'C_Q',       true },
    { 'abn_SUI_7', true },
    { 'abn_SUI_7', true },
    { 'abn_SUI_7', true },
  },
  evaluate = function(parts, hand)
    if #hand < 6 then return {} end
    local suit_cards = {}
    local suitless_cards = {}

    for _, card in ipairs(hand) do
      if SMODS.has_no_suit(card) then
        table.insert(suitless_cards, card)
      else
        table.insert(suit_cards, card)
      end
    end

    if #suit_cards >= 3 and #suitless_cards >= 3 then
      local three_suits = get_X_same(3, suit_cards)
      local three_suitless = get_X_same(3, suitless_cards)

      if next(three_suits) and next(three_suitless) then
        return { SMODS.merge_lists(three_suits, three_suitless) }
      end
    end
    return {}
  end
}


SMODS.PokerHand {
  key = 'Empty Throne',
  visible = false,
  chips = 120,
  mult = 9,
  l_chips = 40,
  l_mult = 4,
  example = {
    { 'abn_SUI_5', true },
    { 'abn_SUI_6', true },
    { 'abn_SUI_7', true },
    { 'abn_SUI_8', true },
    { 'abn_SUI_9', true },
  },
  evaluate = function(parts, hand)
    if #hand < 5 then return {} end
    local suitless_cards = {}

    for _, card in ipairs(hand) do
      if SMODS.has_no_suit(card) then
        table.insert(suitless_cards, card)
      end
    end

    if #suitless_cards < 5 then return {} end

    return get_straight(suitless_cards, SMODS.four_fingers('straight'), SMODS.shortcut(), SMODS.wrap_around_straight())
  end,
  modify_display_text = function(self, _cards, scoring_hand)
    local royal = true
    for j = 1, #scoring_hand do
      local rank = not SMODS.has_no_rank(scoring_hand[j]) and SMODS.Ranks[scoring_hand[j].base.value]
      royal = rank and royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
    end
    if royal then
      return self.key .. ' (Royal)'
    end
  end
}


SMODS.PokerHand {
  key = 'Void Space',
  visible = false,
  chips = 50,
  mult = 4,
  l_chips = 25,
  l_mult = 3,
  example = {
    { 'abn_SUI_2', true },
    { 'abn_SUI_5', true },
    { 'abn_SUI_3', true },
    { 'H_A',       true, enhancement = "m_abn_polkadot" },
    { 'S_K',       true, enhancement = "m_abn_petroleum" },
  },
  evaluate = function(parts, hand)
    if #hand < 5 then return {} end
    local rankless_cards = {}
    local suitless_cards = {}

    for _, card in ipairs(hand) do
      if SMODS.has_no_rank(card) then
        table.insert(rankless_cards, card)
      elseif SMODS.has_no_suit(card) and not SMODS.has_no_rank(card) then
        table.insert(suitless_cards, card)
      end
    end

    if #rankless_cards >= 2 and #suitless_cards >= 3 then
      return { SMODS.merge_lists(rankless_cards, suitless_cards) }
    end
    return {}
  end
}

SMODS.PokerHand {
  key = 'Inverse Spectrum',
  visible = false,
  chips = 80,
  mult = 8,
  l_chips = 25,
  l_mult = 3,
  example = {
    { 'S_2',       true },
    { 'D_7',       true },
    { 'C_3',       true },
    { 'H_5',       true },
    { 'abn_SN_K',  true },
    { 'abn_SUI_A', true },
  },
  evaluate = function(parts, hand)
    if #hand < 6 then return {} end
    if not next(parts.abn_spectrum) then return {} end

    local suitless_cards = {}
    for _, card in ipairs(hand) do
      if SMODS.has_no_suit(card) then
        table.insert(suitless_cards, card)
      end
    end

    if #suitless_cards >= 1 then
      return { SMODS.merge_lists(parts.abn_spectrum, suitless_cards) }
    end
    return {}
  end
}

SMODS.PokerHand {
  key = 'Divider Conquered',
  visible = false,
  chips = 120,
  mult = 10,
  l_chips = 40,
  l_mult = 4,
  example = {
    { 'H_Q',       true },
    { 'D_Q',       true },
    { 'S_7',       true },
    { 'C_7',       true },
    { 'abn_SUI_3', true },
    { 'abn_SUI_5', true },
  },
  evaluate = function(parts, hand)
    if #hand < 6 then return {} end
    local light_cards = {}
    local dark_cards = {}
    local suitless_cards = {}

    for _, card in ipairs(hand) do
      if SMODS.has_no_suit(card) then
        table.insert(suitless_cards, card)
      elseif ABN.is_light(card) then
        table.insert(light_cards, card)
      elseif ABN.is_dark(card) then
        table.insert(dark_cards, card)
      end
    end

    if #light_cards >= 2 and #dark_cards >= 2 and #suitless_cards >= 2 then
      return { SMODS.merge_lists(suitless_cards, light_cards, dark_cards) }
    end
    return {}
  end
}

SMODS.PokerHand {
  key = 'Twilight Distillation',
  visible = false,
  chips = 150,
  mult = 15,
  l_chips = 45,
  l_mult = 4,
  example = {
    { 'H_5',       true },
    { 'D_6',       true },
    { 'S_7',       true },
    { 'C_8',       true },
    { 'abn_SUI_9', true },
    { 'abn_SUI_T', true },
  },
  evaluate = function(parts, hand)
    if #hand < 6 then return {} end
    local light_cards = {}
    local dark_cards = {}
    local suitless_cards = {}

    for _, card in ipairs(hand) do
      if SMODS.has_no_suit(card) then
        table.insert(suitless_cards, card)
      elseif ABN.is_light(card) then
        table.insert(light_cards, card)
      elseif ABN.is_dark(card) then
        table.insert(dark_cards, card)
      end
    end

    if #light_cards < 2 or #dark_cards < 2 or #suitless_cards < 2 then
      return {}
    end

    return get_straight(SMODS.merge_lists(suitless_cards, light_cards, dark_cards), SMODS.four_fingers('straight'),
      SMODS.shortcut(), SMODS.wrap_around_straight())
  end,
}
--#endregion


SMODS.Consumable {
  key = "numa",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 5, y = 3 },
  config = { hand_type = "abn_Empty Throne", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Feli"
  },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_asteroid"),
      get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour,
      1.2)
  end
}

SMODS.Consumable {
  key = "felix",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 1, y = 4 },
  config = { hand_type = "abn_Inverse Spectrum", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Feli"
  },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_satellite"),
      get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour,
      1.2)
  end
}

SMODS.Consumable {
  key = "nikos",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 0, y = 4 },
  config = { hand_type = "abn_Abyss", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Feli"
  },
}

SMODS.Consumable {
  key = "suzuho",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 2, y = 4 },
  config = { hand_type = "abn_Divider Conquered", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Feli"
  },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_split"),
      get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour,
      1.2)
  end
}

SMODS.Consumable {
  key = "arret",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 3, y = 4 },
  config = { hand_type = "abn_Haunted House", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Feli"
  },
  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_tenalp"),
      get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour,
      1.2)
  end
}

SMODS.Consumable {
  key = "korobos",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 4, y = 4 },
  config = { hand_type = "abn_Twilight Distillation", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Feli"
  },
}

SMODS.Consumable {
  key = "myrios",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 5, y = 4 },
  config = { hand_type = "abn_Void Space", softlock = true },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.hands[card.ability.hand_type].level,
        localize(card.ability.hand_type, 'poker_hands'),
        G.GAME.hands[card.ability.hand_type].l_mult,
        G.GAME.hands[card.ability.hand_type].l_chips,
        colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
      }
    }
  end,
  abn_artist_credits = {
    artist = "Feli"
  },
}
