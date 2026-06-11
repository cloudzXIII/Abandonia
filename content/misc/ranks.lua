SMODS.Rank {
  key = '11',
  card_key = '11',
  shorthand = '11',

  lc_atlas = 'AbandoniaRanks',
  hc_atlas = 'AbandoniaRanks',
  pos = { x = 0 },

  next = { 'abn_12' },
  nominal = 11,

  suit_map = {
    abn_Snow = 0,
    abn_Penumbra = 1,
    abn_suitless = 2,
    Hearts = 3,
    Clubs = 4,
    Diamonds = 5,
    Spades = 6,
	abn_Tie = 7,
	abn_Bow = 8,
  },

  in_pool = function(self, args)
    if args and ((args.suit == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Rank {
  key = '12',
  card_key = '12',
  shorthand = '12',

  lc_atlas = 'AbandoniaRanks',
  hc_atlas = 'AbandoniaRanks',
  pos = { x = 1 },

  next = { 'abn_13' },
  nominal = 12,

  suit_map = {
    abn_Snow = 0,
    abn_Penumbra = 1,
    abn_suitless = 2,
    Hearts = 3,
    Clubs = 4,
    Diamonds = 5,
    Spades = 6,
	abn_Tie = 7,
	abn_Bow = 8,
  },

  in_pool = function(self, args)
    if args and ((args.suit == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Rank {
  key = '13',
  card_key = '13',
  shorthand = '13',

  lc_atlas = 'AbandoniaRanks',
  hc_atlas = 'AbandoniaRanks',
  pos = { x = 2 },

  next = { 'abn_14' },
  nominal = 13,

  suit_map = {
    abn_Snow = 0,
    abn_Penumbra = 1,
    abn_suitless = 2,
    Hearts = 3,
    Clubs = 4,
    Diamonds = 5,
    Spades = 6,
	abn_Tie = 7,
	abn_Bow = 8,
  },

  in_pool = function(self, args)
    if args and ((args.suit == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Rank {
  key = '14',
  card_key = '14',
  shorthand = '14',

  lc_atlas = 'AbandoniaRanks',
  hc_atlas = 'AbandoniaRanks',
  pos = { x = 3 },

  straight_edge = true,
  next = { '2' },
  nominal = 14,

  suit_map = {
    abn_Snow = 0,
    abn_Penumbra = 1,
    abn_suitless = 2,
    Hearts = 3,
    Clubs = 4,
    Diamonds = 5,
    Spades = 6,
	abn_Tie = 7,
	abn_Bow = 8,
  },


  in_pool = function(self, args)
    if args and ((args.suit == '') or (args.initial_deck)) then
      return false
    else
      return true
    end
  end,
}

SMODS.Rank:take_ownership('Ace',
  {
    next = { 'abn_11' },
    straight_edge = false
  }
)
