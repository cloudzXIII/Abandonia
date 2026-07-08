SMODS.Joker {
  key = 'ante_up',
  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 9, y = 0 },
  pixel_size = { w = 71, h = 71 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  set_ability = function(self, card, initial)
    card:set_eternal(true)
  end,

  add_to_deck = function(self, card)
    G.GAME.win_ante = G.GAME.win_ante + 2
  end,

  remove_from_deck = function(self, card)
    G.GAME.win_ante = G.GAME.win_ante - 2
  end,

  calculate = function(self, card, context)
    -- This context runs once for every single card held in hand during scoring
    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      if context.other_card.debuff then
        return {
          message = localize('k_debuffed'),
          colour = G.C.RED,
          card = card
        }
      else
        -- Returns 2x the nominal value (Rank) of the specific card being evaluated
        return {
          mult = 2 * context.other_card.base.nominal,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Pailleboy"
  },
}
