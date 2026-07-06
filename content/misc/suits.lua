SMODS.Suit {
  key = 'Snow',
  card_key = 'SN',
  shade = "light",
  lc_atlas = "AbandoniaSuits",
  hc_atlas = "AbandoniaSuits",
  lc_ui_atlas = "AbandoniaSuitIcons",
  hc_ui_atlas = "AbandoniaSuitIcons",
  pos = { y = 0 },
  ui_pos = { x = 0, y = 0 },
  lc_colour = HEX("5dacdf"),
  in_pool = function(self, args)
    if args and ((args.rank == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Suit {
  key = 'Penumbra',
  card_key = 'PN',
  shade = "dark",
  lc_atlas = "AbandoniaSuits",
  hc_atlas = "AbandoniaSuits",
  lc_ui_atlas = "AbandoniaSuitIcons",
  hc_ui_atlas = "AbandoniaSuitIcons",
  pos = { y = 1 },
  ui_pos = { x = 1, y = 0 },
  lc_colour = HEX("8570c7"),
  in_pool = function(self, args)
    if args and ((args.rank == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Suit {
  key = 'suitless',
  card_key = 'SUI',
  shade = "suitless",
  lc_atlas = "AbandoniaSuits",
  hc_atlas = "AbandoniaSuits",
  lc_ui_atlas = "AbandoniaSuitIcons",
  hc_ui_atlas = "AbandoniaSuitIcons",
  pos = { y = 2 },
  ui_pos = { x = 4, y = 0 },
  lc_colour = HEX("8d9fa3"),
  in_pool = function(self, args)
    if args and ((args.rank == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

local has_no_suit_ref = SMODS.has_no_suit
function SMODS.has_no_suit(card)
  if card.base.suit == 'abn_suitless' then
    return true
  end
  return has_no_suit_ref(card)
end

local perma_ref = SMODS.localize_perma_bonuses
function SMODS.localize_perma_bonuses(specific_vars, desc_nodes)
  local ret = perma_ref(specific_vars, desc_nodes)
  if specific_vars and specific_vars.suit == "abn_suitless" then
    localize { type = 'other', key = 'abn_suitless', nodes = desc_nodes, vars = {} }
  end
  return ret
end

SMODS.Suit {
  key = 'Tie',
  card_key = 'TI',
  shade = "light",
  lc_atlas = "AbandoniaSuits",
  hc_atlas = "AbandoniaSuits",
  lc_ui_atlas = "AbandoniaSuitIcons",
  hc_ui_atlas = "AbandoniaSuitIcons",
  pos = { y = 3 },
  ui_pos = { x = 2, y = 0 },
  lc_colour = HEX("82e888"),
  in_pool = function(self, args)
    if args and ((args.rank == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Suit {
  key = 'Bow',
  card_key = 'BW',
  shade = "dark",
  lc_atlas = "AbandoniaSuits",
  hc_atlas = "AbandoniaSuits",
  lc_ui_atlas = "AbandoniaSuitIcons",
  hc_ui_atlas = "AbandoniaSuitIcons",
  pos = { y = 4 },
  ui_pos = { x = 3, y = 0 },
  lc_colour = HEX("3f2c6d"),
  in_pool = function(self, args)
    if args and ((args.rank == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Suit {
  key = 'Chalice',
  card_key = 'CHAL',
  shade = "dark",
  lc_atlas = "AbandoniaSpanishSuits",
  hc_atlas = "AbandoniaSpanishSuits",
  lc_ui_atlas = "AbandoniaSuitIcons",
  hc_ui_atlas = "AbandoniaSuitIcons",
  pos = { y = 0 },
  ui_pos = { x = 1, y = 1 },
  lc_colour = HEX("f0349c"),
  in_pool = function(self, args)
    if args and ((args.rank == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Suit {
  key = 'Sword',
  card_key = 'SW',
  shade = "dark",
  lc_atlas = "AbandoniaSpanishSuits",
  hc_atlas = "AbandoniaSpanishSuits",
  lc_ui_atlas = "AbandoniaSuitIcons",
  hc_ui_atlas = "AbandoniaSuitIcons",
  pos = { y = 1 },
  ui_pos = { x = 2, y = 1 },
  lc_colour = HEX("3c5168"),
  in_pool = function(self, args)
    if args and ((args.rank == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Suit {
  key = 'Coin',
  card_key = 'COI',
  shade = "light",
  lc_atlas = "AbandoniaSpanishSuits",
  hc_atlas = "AbandoniaSpanishSuits",
  lc_ui_atlas = "AbandoniaSuitIcons",
  hc_ui_atlas = "AbandoniaSuitIcons",
  pos = { y = 2 },
  ui_pos = { x = 0, y = 1 },
  lc_colour = HEX("f0ba3f"),
  in_pool = function(self, args)
    if args and ((args.rank == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Suit {
  key = 'Baton',
  card_key = 'BAT',
  shade = "light",
  lc_atlas = "AbandoniaSpanishSuits",
  hc_atlas = "AbandoniaSpanishSuits",
  lc_ui_atlas = "AbandoniaSuitIcons",
  hc_ui_atlas = "AbandoniaSuitIcons",
  pos = { y = 3 },
  ui_pos = { x = 3, y = 1 },
  lc_colour = HEX("235945"),
  in_pool = function(self, args)
    if args and ((args.rank == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}
