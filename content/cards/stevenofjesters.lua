SMODS.Joker {
  key = "stevenofjesters",

  atlas = "ABNJokerSheet27",
  pos = { x = 9, y = 4 },
  cost = 10,
  rarity = 3,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      asc = 0,
      asc_gain = 0.04,
      amperage = 1,
      amperage_gain = 0.4
    }
  },

  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue+1] = G.P_CENTERS.j_even_steven
    return {
      vars = {
        card.ability.extra.asc_gain,
        card.ability.extra.asc,
        card.ability.extra.amperage,
        card.ability.extra.amperage_gain
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and ABN.is_even(context.other_card) and not context.blueprint then
	  SMODS.scale_card(card, {
		ref_table = card.ability.extra,
		ref_value = "asc",
		scalar_value = "asc_gain",
		message_colour = G.C.YELLOW
	  })
    end

    if context.joker_main then
	  local ret = {asc = card.ability.extra.asc}

      if next(SMODS.find_card("j_even_steven")) then
        local even_count = 0

        for _, playing_card in ipairs(context.scoring_hand) do
          if ABN.is_even(playing_card) then
            even_count = even_count + 1
          end
        end

        ret.xamp = card.ability.extra.amperage + card.ability.extra.amperage_gain * even_count
      end

	  return ret
    end
  end,

  abn_artist_credits = {
    artist = "Weasel.922"
  }
}
