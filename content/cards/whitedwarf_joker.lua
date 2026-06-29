-- Whitedwarf Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'whitedwarf_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult_gain, card.ability.extra.x_mult } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet10',
  pos = { x = 2, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_mult = 1, x_mult_gain = 0.1 } },
  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "Planet" and context.consumeable:has_attribute("rank_planet") then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_mult",
        scalar_value = "x_mult_gain",
        operation = '+',
        message_key = "a_xmult"
      })
    end
    if context.joker_main then
      return {
        x_mult = card.ability.extra.x_mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Nevermade",
  },
}
