-- Joker by the Weekend (coded by cloudzXIII) ps. this was the 300th Joker :3
SMODS.Joker {
  key = 'joker_of_the_weekend',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.x_mult, cae.x_mult_gain, cae.x_chips, cae.x_chips_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 6, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,

  config = { extra = { x_mult = 1, x_mult_gain = 0.3, x_chips = 1, x_chips_gain = 0.3 } },

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and not context.blueprint then
      local blind_type = G.GAME.blind:get_type()
      if blind_type == "Small" or blind_type == "Boss" then -- odd
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          operation = '+',
          message_key = 'a_xmult'
        })
      elseif blind_type == "Big" then -- even
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_chips",
          scalar_value = "x_chips_gain",
          operation = '+',
          message_key = 'a_xchips'
        })
      end
    end
    if context.joker_main then
      return {
        x_chips = card.ability.extra.x_chips > 1 and card.ability.extra.x_chips or nil,
        x_mult = card.ability.extra.x_mult
      }
    end
  end,

  abn_artist_credits = {
    artist = "JJth'Rat",
  },
}
