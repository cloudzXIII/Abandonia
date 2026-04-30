SMODS.Joker {
  key = 'jamie',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 8, y = 3 },
  soul_pos = { x = 9, y = 3 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      return {
        level_up = true,
        message = localize('k_level_up_ex')
      }
    end
  end,

  abn_artist_credits = {
    artist = "Long Rooster",
  },
}
