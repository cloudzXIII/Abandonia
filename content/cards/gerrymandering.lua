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

  rarity = 2,
  atlas = 'ABNJokerSheet1',
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
  local current_suit = G.GAME.current_round.abn_gerrymandering.suit

  local gerry_suits = {}
  local seen = {}

  for _, c in ipairs(G.playing_cards) do
    local s = c.base.suit
    if not seen[s] then
      seen[s] = true
    end
  end

  for suit_name, _ in pairs(seen) do
    if suit_name ~= current_suit then
      table.insert(gerry_suits, suit_name)
    end
  end

  if #gerry_suits == 0 and seen[current_suit] then
    table.insert(gerry_suits, current_suit)
  end

  if #gerry_suits > 0 then
    local suit = pseudorandom_element(gerry_suits, 'j_abn_gerrymandering' .. G.GAME.round_resets.ante)
    G.GAME.current_round.abn_gerrymandering.suit = suit
  end
end
