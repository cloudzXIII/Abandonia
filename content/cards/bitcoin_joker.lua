SMODS.Joker {
  key = 'bitcoin_joker',

  rarity = 1,
  atlas = 'ABNJokerSheet3',
  pos = { x = 2, y = 4 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 0,
      mult = 0,
      chips_gain = 10,
      mult_gain = 3,
      sell_value_gain = 1,
    }
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return {
      vars = {
        cae.chips, cae.sell_value_gain, cae.mult_gain, cae.chips_gain, cae.mult
      },
    }
  end,


  calculate = function(self, card, context)
    if context.pseudorandom_result and context.trigger_obj and context.trigger_obj.config and context.trigger_obj.config.center.set == "astro_cards" then
      if context.result == false then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          message_key = "a_chips",
        })

        SMODS.scale_card(card, {
          ref_table = card.ability,
          scalar_table = card.ability.extra,
          scalar_value = "sell_value_gain",
          ref_value = "extra_value",
          scaling_message = {
            message = localize('k_val_up'),
            colour = G.C.MONEY
          }
        })
      end
      if context.result == true then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          message_key = "a_mult",
        })
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Null",
  },
}
