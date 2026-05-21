-- Ishihara Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'ishihara_',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, localize(card.ability.extra.suit, 'suits_singular') } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet8',
  pos = { x = 7, y = 5 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 5, suit = "abn_Penumbra" } },
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
    artist = "Vega",
  },

  in_pool = function(self)
    for _, card in ipairs(G.playing_cards or {}) do
      if card:is_suit("abn_Penumbra") then
        return true
      end
    end
    return false
  end,
}
