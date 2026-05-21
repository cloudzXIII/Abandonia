-- Frigid Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'frigid_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, localize(card.ability.extra.suit, 'suits_singular') } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet10',
  pos = { x = 7, y = 2 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 5, suit = "abn_Snow" } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit(card.ability.extra.suit) then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Spyman",
  },

  in_pool = function(self)
    for _, card in ipairs(G.playing_cards or {}) do
      if card:is_suit("abn_Snow") then
        return true
      end
    end
    return false
  end,
}
