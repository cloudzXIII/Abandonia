SMODS.PokerHand {
  key = '6oak',
  mult = 16,
  chips = 160,
  l_chips = 35,
  l_mult = 3,
  visible = true,
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
  config = { hand_type = "abn_6oak" },
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
  key = 'triple_pair',
  mult = 3,
  chips = 20,
  l_mult = 2,
  l_chips = 20,
  visible = true,
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
  config = { hand_type = "abn_triple_pair" },
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
