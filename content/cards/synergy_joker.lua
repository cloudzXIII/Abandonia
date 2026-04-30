SMODS.Joker {
  key = 'synergy_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 0, y = 0 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, mult = 0 } },

  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips
      }
    end
  end,
  calc_scaling = function(self, card, other_card, scaling_value, scalar_value, args)
    if scalar_value > 0 then
      if args.ref_value == "mult" then
        card.ability.extra.mult = card.ability.extra.mult + scalar_value
        SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.MULT }, card)
      end
      if args.ref_value == "chips" then
        card.ability.extra.chips = card.ability.extra.chips + scalar_value
        SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.CHIPS }, card)
      end
    end
  end,
  abn_artist_credits = {
    artist = "Jabo",
  },
  in_pool = function(self, args)
    return G.jokers and #G.jokers.cards >= G.jokers.config.card_limit
  end,
}
