-- Rando Jester (coded by cloudzXIII)
SMODS.Joker {
  key = 'rando_jester',

  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.prob_up } }
  end,

  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 6, y = 13 },
  soul_pos = { x = 7, y = 13 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { x_mult = 1.5, x_mult_gain = 0.04, prob_up = 1, current_prob_up = 0 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
      if next(SMODS.find_card("j_joker")) then
        card.ability.extra.current_prob_up = card.ability.extra.current_prob_up + card.ability.extra.prob_up
        SMODS.calculate_effect({ message = localize('k_upgrade_ex'), colour = G.C.GREEN }, context.other_card)
      end
      if not context.blueprint then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
        })
      end
      return {
        x_mult = card.ability.extra.x_mult,
        card = card,
        colour = G.C.MULT
      }
    end

    if context.pseudorandom_result and context.result == true and card.ability.extra.times_failed > 0 then
      card.ability.extra.current_prob_up = 0
      SMODS.calculate_effect({ message = localize('k_reset'), colour = G.C.FILTER }, card)
    end

    if context.mod_probability and card.ability.extra.current_prob_up > 0 and not context.blueprint then
      return {
        numerator = context.numerator + card.ability.extra.current_prob_up
      }
    end
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  abn_artist_credits = {
    artist = "Abelsketch",
  },
}
