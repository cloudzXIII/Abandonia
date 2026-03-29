SMODS.Joker {
  key = 'gerrymandering',

  loc_vars = function(self, info_queue, card)
    local suit = (G.GAME.current_round.abn_gerrymandering or {}).suit or 'Hearts'
    return {
      vars = {
        localize(suit, 'suits_singular'),
        colours = { G.C.SUITS[suit] }
      }
    }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 7, y = 1 },
  cost = 3,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { repetitions = 1 } },

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and context.other_card:is_suit(G.GAME.current_round.abn_gerrymandering.suit) then
      return {
        repetitions = card.ability.extra.repetitions
      }
    end
  end,
  abn_artist_credits = {
    artist = "CB_915",
  },
}

function ABN.reset_abn_gerrymandering()
  G.GAME.current_round.abn_gerrymandering = G.GAME.current_round.abn_gerrymandering or { suit = 'Hearts' }
  local gerry_suits = {}
  for k, v in ipairs({ 'Spades', 'Hearts', 'Clubs', 'Diamonds' }) do
    if v ~= G.GAME.current_round.abn_gerrymandering.suit then gerry_suits[#gerry_suits + 1] = v end
  end
  local suit = pseudorandom_element(gerry_suits, 'j_abn_gerrymandering' .. G.GAME.round_resets.ante)
  G.GAME.current_round.abn_gerrymandering.suit = suit
end
