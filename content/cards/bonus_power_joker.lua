SMODS.Joker {
  key = 'bonus_power_joker',
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    return {
      vars = {
        card.ability.extra.dollars,
        card.ability.extra.mult,
        card.ability.extra.chips,
      },
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 8, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      mult = 10,
      dollars = 3,
      chips = 15,
    },

  },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_bonus") then
        return {
          mult = card.ability.extra.mult,
          dollars = card.ability.extra.dollars,
          chips = card.ability.extra.chips,
        }
      end
    end
  end,

  enhancement_gate = "m_bonus",

  abn_artist_credits = {
    artist = "Ricottakitten",
  },
}
