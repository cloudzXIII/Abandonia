-- woooo 400!! ~Eric

SMODS.Joker {
  key = 'mariner_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 3, y = 5 },
  cost = 5,
  discovered = false,
  blueprint_compat = false,

  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "continent" then
      SMODS.add_card({ set = 'Planet', attributes = { "rank_planet" } })
      SMODS.calculate_effect({ message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }, card)
    end
  end,
  abn_artist_credits = {
    artist = "Vlambambo",
  },
}
