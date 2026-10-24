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
    return {
      vars = {
        card.ability.extra.asc_gain,
        card.ability.extra.amperage,
        card.ability.extra.amperage_gain
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual
    and context.cardarea == G.play
    and context.other_card
    and context.other_card:get_id() ~= 0
    and context.other_card:get_id() <= 10
    and context.other_card:get_id() >= 2
    and context.other_card:get_id() % 2 == 0 then
      card.ability.extra.asc = card.ability.extra.asc + card.ability.extra.asc_gain
    end

    if context.joker_main then
      local has_even_steven = false

      for _, joker in ipairs(G.jokers.cards) do
        if joker.config.center.key == "j_even_steven" then
          has_even_steven = true
          break
        end
      end

      if has_even_steven then
        local even_count = 0

        for _, playing_card in ipairs(context.scoring_hand or {}) do
          local id = playing_card:get_id()
          if id >= 2 and id <= 10 and id % 2 == 0 then
            even_count = even_count + 1
          end
        end

        return {
          xamp = card.ability.extra.amperage
              + card.ability.extra.amperage_gain * even_count,
          colour = G.C.ABN_AMPERAGE
        }
      end
    end

    if context.other_joker then
      return {
        asc = card.ability.extra.asc
      }
    end
  end,

  abn_artist_credits = {
    artist = "Weasel.922"
  }
}
