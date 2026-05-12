-- Crybaby (coded by cloudzXIII) tboi reference?!
SMODS.Joker {
  key = 'crybaby',

  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 1, y = 5 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      mult = 1,
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult
      },
    }
  end,

  calculate = function(self, card, context)
    if context.discard then
      context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult
      SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, card)
    end
  end,
  abn_artist_credits = {
    artist = "DrSmey",
  },
}
