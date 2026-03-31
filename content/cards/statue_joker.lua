SMODS.Joker {
  key = 'statue_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, localize("k_abn_rankless"), localize({ type = 'name_text', key = "e_polychrome", set = "Edition" }) } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 9, y = 3 },
  cost = 9,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_no_rank(context.other_card) then
        context.other_card:set_edition("e_polychrome", true)
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          operation = '+',
        })
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Morphine Milkshake",
  },
}
