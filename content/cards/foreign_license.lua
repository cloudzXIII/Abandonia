-- Foreign License (coded by cloudzXIII)
SMODS.Joker {
  key = 'foreign_license',

  loc_vars = function(self, info_queue, card)
    local foreign_tally = 0
    for _, playing_card in pairs(G.playing_cards or {}) do
      if next(SMODS.get_enhancements(playing_card)) then foreign_tally = foreign_tally + 1 end
    end
    return { vars = { card.ability.extra.xchips, card.ability.extra.foreign_amount, foreign_tally } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 3, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xchips = 3, foreign_amount = 16 } },
  calculate = function(self, card, context)
    if context.joker_main then
      local foreign_tally = 0
      for _, playing_card in pairs(G.playing_cards) do
        if next(SMODS.get_enhancements(playing_card)) then foreign_tally = foreign_tally + 1 end
      end
      if foreign_tally >= card.ability.extra.foreign_amount then
        return {
          xchips = card.ability.extra.xchips
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Vega",
  },
}
