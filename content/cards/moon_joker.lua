-- Moon Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'moon_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet9',
  pos = { x = 2, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 2 } },

  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
      })
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Yahooyowza"
  },
}
