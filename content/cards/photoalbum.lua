-- Photoalbum Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'photoalbum',

  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 6, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      chips = 0,
      chips_gain = 20
    }
  },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.chips_gain
      },
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local faces = false
      local numbers = 0
      for _, playing_card in ipairs(context.scoring_hand) do
        if playing_card:is_face() then
          faces = true
          break
        end
        if ABN.is_number(playing_card) then
          numbers = numbers + 1
        end
      end
      if faces and card.ability.extra.chips > 0 then
        card.ability.extra.chips = 0
        return {
          message = localize('k_reset')
        }
      end
    end
    if context.individual and context.cardarea == G.play and not context.blueprint then
      if ABN.is_number(context.other_card) then
        local faces = 0
        for _, held in ipairs(G.hand.cards) do
          if held:is_face() then
            faces = faces + 1
          end
        end
        if faces > 0 then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "chips",
            scalar_value = "chips_gain",
            message_colour = G.C.CHIPS,
            operation = function(ref_table, ref_value, initial, change)
              ref_table[ref_value] = initial + faces * change
            end,
            message_key = "a_chips",
          })
        end
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
  abn_artist_credits = {
    artist = "Sustato",
  },
}
