SMODS.Joker {
  key = 'triple_star_license',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult, card.ability.extra.xchips } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet3',
  pos = { x = 0, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 3, xchips = 2 } },

  in_pool = function(self)
    if G.GAME.HunterDied and G.GAME.HunterAnte and G.GAME.HunterAnte < G.GAME.round_resets.ante then
      return true
    end
  end,

  calculate = function(self, card, context)
    if context.selling_card and context.card ~= card and context.card.config.center.rarity and context.card.ability.set == 'Joker' then
      card:start_dissolve()
    end

    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        xchips = card.ability.extra.xchips,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Gelopsys"
  },
}
