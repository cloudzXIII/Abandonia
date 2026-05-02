SMODS.Joker {
  key = 'feste',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 0, y = 3 },
  soul_pos = { x = 1, y = 3 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      SMODS.add_card { set = "nightshift_cards", edition = "e_negative" }
    end
  end,

  abn_artist_credits = {
    artist = "Grass",
  },
}
