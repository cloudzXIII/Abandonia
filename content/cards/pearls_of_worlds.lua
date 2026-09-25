SMODS.Joker({
  key = "pearls_of_worlds",
  config = {
    extra = {
      chips = 0,
    },
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
      },
    }
  end,

  rarity = 2,
  atlas = "ABNJokerSheet14",
  pos = { x = 6, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  calculate = function(self, card, context)
    if
    context.post_trigger
    and context.other_card
    and context.other_card ~= card
    and context.other_card.config
    and context.other_card.config.center
    and context.other_card.config.center.key ~= "j_abn_pearls_of_worlds"
    and not context.blueprint
    then
      local scale = {
        chip_gain = 0,
      }
      local text = ABN.retrieve_joker_text(context.other_card)
      local number_regex = "%d+"
      for num in string.gmatch(text, number_regex) do
        scale.chip_gain = scale.chip_gain + tonumber(num)
      end
      if scale.chip_gain > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          scalar_table = scale,
          scalar_value = "chip_gain",
          message_colour = G.C.CHIPS,
        })
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
      }
    end
  end,
  abn_artist_credits = {
    artist = "Sustato",
  },
})
