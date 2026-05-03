SMODS.Joker {
  key = 'feline_joker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.chips,
        card.ability.extra.dollars
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 9, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      xmult = 2,
      chips = 100,
      dollars = 1
    },
  },

  calculate = function(self, card, context)
    if context.joker_main then
      if pseudorandom("j_abn_feline_joker") < 0.3 then
        return {
          xmult = card.ability.extra.xmult
        }
      elseif pseudorandom("j_abn_feline_joker") < 0.6 then
        return {
          chips = card.ability.extra.chips
        }
      else
        return {
          dollars = card.ability.extra.dollars
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Heart of [Crow]"
  },
}
