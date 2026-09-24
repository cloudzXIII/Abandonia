-- Equation Error (coded by cloudzXIII)
SMODS.Joker {
  key = 'equationerror',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
    return {
      vars = {
        cae.chips,
        cae.mult,
        numerator,
        denominator,
        cae.mult_gain,
        cae.chips_gain
      }
    }
  end,

  rarity = 2,
  atlas = "ABNJokerSheet15",
  pos = { x = 2, y = 5 },
  cost = 4.5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { odds = 4, chips = 1, mult = 1, chips_gain = 1, mult_gain = 1 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.pseudorandom_probability(card, 'abn_equationerror', 1, card.ability.extra.odds) then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          operation = '+',
          no_message = true
        })
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          operation = '+',
        })
      end
    end
    if context.joker_type_destroyed and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult",
        operation = '+',
        no_message = true,
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips",
        operation = '+',
        scaling_message = {
          message = localize("k_abn_doubled_ex"),
          colour = G.C.GREEN
        }
      })
    end
    if context.before and context.scoring_name ~= "High Card" and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chips",
        operation = '+',
        scaling_message = {
          message = localize("k_abn_doubled_ex"),
          colour = G.C.CHIPS
        }
      })
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,

  abn_artist_credits = {
    artist = "???",
  },
}
