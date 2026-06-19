-- Mainframe Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'mainframe_joker',

  rarity = 1,
  atlas = 'ABNJokerSheet11',
  pos = { x = 0, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { chips = 0, chips_gain = 3, mult = 0, mult_gain = 1 } },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips, cae.chips_gain, cae.mult, cae.mult_gain }, }
  end,
  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint then
      if context.consumeable.ability.set == "program_pack" then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_value = "chips_gain",
          message_key = "a_chips",
          message_colour = G.C.CHIPS
        })
      end
      if context.consumeable.ability.set == "solid_state" then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
          message_key = "a_mult",
          message_colour = G.C.MULT
        })
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
  in_pool = function(self)
    local lexica = false
    local program = false
    if G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.solid_state and
        G.GAME.consumeable_usage_total.solid_state > 0 then
      lexica = true
    end
    if G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.program_pack and
        G.GAME.consumeable_usage_total.program_pack > 0 then
      program = true
    end
    return lexica or program
  end
}
