SMODS.Joker {
  key = 'mardi_gras',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.choice } }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 8, y = 2 },
  cost = 4,
  discovered = true,
  blueprint_compat = true,

  config = { extra = {} },
  abn_artist_credits = {
    artist = "iprefercheddar"
  },
}

local set_ability = Card.set_ability;
function Card:set_ability(...)
  set_ability(self, ...)
  if next(SMODS.find_card("j_abn_mardi_gras")) then
    if self.ability and self.ability.set == "Booster" and self.ability.name:find("Arcana") then
      self.ability.choose = self.ability.choose + #SMODS.find_card("j_abn_mardi_gras")
    end
  end
end
