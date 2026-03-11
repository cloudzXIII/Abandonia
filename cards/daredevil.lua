SMODS.Joker {
  key = 'daredevil',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 6, y = 11 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 4 } },

  calculate = function(self, card, context)
    if context.stay_flipped and context.to_area == G.hand and G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 then
      return {
        stay_flipped = true
      }
    end
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "GhostSalt"
  },
}
