-- Improved Joker
SMODS.Joker {
  key = 'improved_joker',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
    return { vars = { cae.xmult, cae.asc_power } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet20',
  pos = { x = 8, y = 6 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 5, asc_power = 0.4 } },
  calculate = function(self, card, context)
    if context.initial_scoring_step and #context.scoring_hand == 5 then
      return {
        x_mult = card.ability.extra.xmult
      }
    end
    if context.individual and context.cardarea == G.play and next(SMODS.find_card("j_joker")) then
      return {
        plus_asc = card.ability.extra.asc_power
      }
    end
  end,
  abn_artist_credits = {
    artist = "Gud",
  },

}
