SMODS.Joker {
  key = 'jorick',

  set_card_type_badge = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_yradnegel"), G.C.RARITY[4], G.C.WHITE, 1.2)
  end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_mult_gain, card.ability.extra.draws, card.ability.extra.draws_remaining, card.ability.extra.x_mult } }
  end,

  rarity = 4,
  atlas = 'AbandoniaReverse',
  pos = { x = 1, y = 0 },
  soul_pos = { x = 0, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { draws = 23, draws_remaining = 23, x_mult = 1, x_mult_gain = 1 } },

  calculate = function(self, card, context)
    if context.hand_drawn then
      if card.ability.extra.draws_remaining <= 0 then
        card.ability.extra.draws_remaining = card.ability.extra.draws
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "x_mult",
          scalar_value = "x_mult_gain",
          operation = '+',
          message_key = 'a_xmult'
        })
      else
        card.ability.extra.draws_remaining = card.ability.extra.draws_remaining - #context.hand_drawn
        return nil, true
      end
    end
  end,
  abn_artist_credits = {
    artist = "Olsberg",
  },
}
