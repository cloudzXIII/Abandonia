SMODS.Joker {
  key = 'colour_vortex',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, localize(card.ability.extra.poker_hand, 'poker_hands') } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 9, y = 2 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 3, poker_hand = "Flush" } },

  calculate = function(self, card, context)
    if context.joker_main and context.scoring_name == card.ability.extra.poker_hand and G.GAME.current_round.hands_played == 0 then
      return {
        x_mult = card.ability.extra.xmult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Fridgemancer"
  },
}
