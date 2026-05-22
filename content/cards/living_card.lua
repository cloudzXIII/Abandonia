-- Living Card (coded by cloudzXIII)
SMODS.Joker {
  key = 'living_card',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.chips } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 9, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = false,

  config = { extra = { chips = 3, mult = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == "unscored" then
      context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chips
      context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
      SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, context.other_card)
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
