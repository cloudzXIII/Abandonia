SMODS.Joker {
  key = 'sikhs_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet18',
  pos = { x = 5, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xchips = 1,
      xchipsadd = 0.1,
      base = 1,
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xchips,
        card.ability.extra.xchipsadd
      }
    }
  end,

  update = function(self, card, dt)
    local minor_arcana_used = 0
    if G.GAME and G.GAME.consumeable_usage then
      for _, v in pairs(G.GAME.consumeable_usage) do
        if v.set == 'paperback_minor_arcana' then
          minor_arcana_used = minor_arcana_used + 1
        end
      end
    end

    card.ability.extra.xchips = card.ability.extra.base + (minor_arcana_used * card.ability.extra.xchipsadd)
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card then
        return {
          xchips = card.ability.extra.xchips,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Papermoon & B.b.b.b",
  },
  dependencies = {
    "paperback"
  },
}
