-- Monocromator Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'monocromator_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_abandond
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain, cae.chips, cae.chips_gain } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 7, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 2, chips = 0, chips_gain = 5 } },
  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "weather_report" and #G.hand.cards > 0 and not context.blueprint then
      local temp_ID = 15
      local raised_card = nil
      for i = 1, #G.hand.cards do
        if not G.hand.cards[i].edition and temp_ID >= G.hand.cards[i].base.id and not SMODS.has_no_rank(G.hand.cards[i]) then
          temp_ID = G.hand.cards[i].base.id
          raised_card = G.hand.cards[i]
        end
      end
      if raised_card then
        raised_card:set_edition("e_abn_abandond", true)
        card:juice_up(0.3, 0.5)
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.edition and context.other_card.edition.key == "e_abn_abandond" then
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
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Swizik",
  },
  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.weather_report and
        G.GAME.consumeable_usage_total.weather_report > 0
  end
}
