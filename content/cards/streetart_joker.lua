local csa = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    csa(self, center, initial, delay_sprites)
    if center == G.P_CENTERS.m_stone and next(SMODS.find_card('j_abn_streetart_joker')) then
        self.config.center.replace_base_card = false
        self.config.center.no_rank = false
        self.config.center.no_suit = false
    end
end

local shf = Card.should_hide_front
function Card:should_hide_front()
    if self.ability.effect == 'Stone Card' and next(SMODS.find_card('j_abn_streetart_joker')) then return false end
    return shf(self)
end


SMODS.Joker {
  key = 'streetart_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet3',
  pos = { x = 1, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  abn_artist_credits = {
    artist = "EverSoNitro",
  },
}
