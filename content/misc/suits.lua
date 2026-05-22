SMODS.Suit {
  key = 'Snow',
  card_key = 'SN',
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
