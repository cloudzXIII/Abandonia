SMODS.Joker {
  key = 'old_as_dirt',

  loc_vars = function(self, info_queue, card)
    if G.GAME.dollars < 0 then
      return {
        vars = {
          card.ability.extra.Xmult_gain,
          card.ability.extra.x_mult + math.abs(G.GAME.dollars) * card.ability.extra.Xmult_gain
        }
      }
    else
      return {
        vars = {
          card.ability.extra.Xmult_gain,
          card.ability.extra.x_mult
        }
      }
    end
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet5',
  pos = { x = 9, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { Xmult_gain = 1, x_mult = 1, } },
  calculate = function(self, card, context)
    if context.joker_main then
      if G.GAME.dollars < 0 then
        return { x_mult = card.ability.extra.x_mult + math.abs(G.GAME.dollars) * card.ability.extra.Xmult_gain }
      end
    end
  end,

  abn_artist_credits = {
    artist = "D.J.",
  },
}
