SMODS.Joker {
  key = "double_entendre",

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.x_chips
      }
    }
  end,

  rarity = 2,
  atlas = "AbandoniaJokers",
  pos = { x = 9, y = 19 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 10, x_chips = 1.5 } },

  calculate = function(self, card, context)
    if context.joker_main then
      if G.GAME.current_round.hands_left % 2 == 0 then
        return {
          x_mult = card.ability.extra.xmult
        }
      end
      if G.GAME.current_round.hands_left % 2 == 1 then
        return {
          x_chips = card.ability.extra.xchips
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Alloyallies",
  },
}
