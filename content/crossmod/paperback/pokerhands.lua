SMODS.PokerHand {
  key = 'Rapture',
  chips = 100,
  mult = 10,
  l_chips = 40,
  l_mult = 4,
  visible = false,
  example = {
    { 'S_paperback_APOSTLE', true },
    { 'S_A', true },
    { 'S_K', true },
    { 'S_Q', true },
    { 'S_J', true },
  },
  evaluate = function(parts, hand)
    if next(parts._flush) and next(parts._straight) then
      local _strush = SMODS.merge_lists(parts._flush, parts._straight)
      local rapture = true
      for j = 1, #_strush do
        local rank = SMODS.Ranks[_strush[j].base.value]
        rapture = rapture and (rank.key == 'paperback_Apostle' or rank.key == 'Ace' or rank.face)
      end
      if rapture then return { _strush } end
    end
  end,
}

SMODS.PokerHand {
  key = 'Rapture Spectrum',
  chips = 150,
  mult = 10,
  l_chips = 50,
  l_mult = 5,
  visible = false,
  example = {
    { 'S_paperback_APOSTLE', true },
    { 'H_A', true },
    { 'D_K', true },
    { 'C_Q', true },
    { 'paperback_CROWNS_J', true },
  },
  evaluate = function(parts, hand)
    if next(parts.abn_spectrum) and next(parts._straight) then
      local _strush = SMODS.merge_lists(parts.abn_spectrum, parts._straight)
      local rapture = true
      for j = 1, #_strush do
        local rank = SMODS.Ranks[_strush[j].base.value]
        rapture = rapture and (rank.key == 'paperback_Apostle' or rank.key == 'Ace' or rank.face)
      end
      if rapture then return { _strush } end
    end
  end,
}

SMODS.PokerHand {
  key = 'Inverse Rapture',
  chips = 180,
  mult = 10,
  l_chips = 65,
  l_mult = 4,
  visible = false,
  example = {
    { 'S_paperback_APOSTLE', true },
    { 'H_A', true },
    { 'D_K', true },
    { 'C_Q', true },
    { 'paperback_CROWNS_J', true },
    { 'abn_SUI_T', true },
  },
  evaluate = function(parts, hand)
    if next(parts.abn_spectrum) and next(parts._straight) then
      local _strush = SMODS.merge_lists(parts.abn_spectrum, parts._straight)
      local rapture = true
      for j = 1, #_strush do
        -- TODO: CHECK FOR AT LEAST ONE NULL suit
        local rank = SMODS.Ranks[_strush[j].base.value]
        rapture = rapture and (rank.key == 'paperback_Apostle' or rank.key == 'Ace' or rank.face or rank.key == '10')
      end
      if rapture then return { _strush } end
    end
  end,
}
