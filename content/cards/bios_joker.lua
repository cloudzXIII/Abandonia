SMODS.Joker {
  key = 'bios_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 0, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },

  calculate = function(self, card, context)
  end,
  abn_artist_credits = {
    artist = "lolhappy909_lol"
  },
}
local use_consumeable_ref = Card.use_consumeable
function Card:use_consumeable(area, copier)
  local g = use_consumeable_ref(self, area, copier)
  if next(SMODS.find_card('j_abn_bios_joker')) and self.ability.set == "Planet" then
    for k, v in pairs(SMODS.find_card('j_abn_bios_joker')) do
      SMODS.calculate_effect({ message = localize('k_again_ex') }, self)
      use_consumeable_ref(self, area, copier)
    end
  end
  return g
end
