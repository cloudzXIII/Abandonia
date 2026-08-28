SMODS.Joker {
  key = 'celestial_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet17',
  pos = { x = 3, y = 4 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 20,
    }
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,

  calculate = function(self, card, context)
    if context.setting_blind then
      for _, joker in ipairs(G.jokers.cards) do
        joker.ability.abn_perma_bonus = (joker.ability.abn_perma_bonus or 0) + card.ability.extra.chips
        SMODS.calculate_effect({ message = localize("k_upgrade_ex"), colour = G.C.CHIPS }, joker)
      end
    end
  end,

  abn_artist_credits = {
    artist = "0kronix",
  },
}
