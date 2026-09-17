SMODS.Consumable {
  key = "grandcross",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 4, y = 5 },
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

SMODS.Consumable {
  key = "supernova",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 5, y = 5 },
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

SMODS.Consumable {
  key = "korim",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 0, y = 5 },
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

SMODS.Consumable {
  key = "malin",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 0, y = 6 },
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
  config = { hand_type = "abn_Haunted Mansion", softlock = true },
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

SMODS.Consumable {
  key = "rao",
  set = "Planet",
  cost = 4,
  atlas = "AbandoniaPlanets",
  pos = { x = 2, y = 7 },
  config = { hand_type = "abn_Royal Flush", softlock = true },
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
