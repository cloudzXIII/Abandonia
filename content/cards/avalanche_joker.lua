-- Avalanche Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'avalanche_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet10',
  pos = { x = 8, y = 2 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 3 } },
  calculate = function(self, card, context)
    if context.joker_main and SMODS.seeing_double_check(context.scoring_hand, 'abn_Snow') then
      return {
        xmult = card.ability.extra.xmult
      }
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
