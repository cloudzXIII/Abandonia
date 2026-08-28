-- Deck of Cards (coded by cloudzXIII)
SMODS.Joker {
  key = 'deck_o_cards',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.chips } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet24',
  pos = { x = 3, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0 } },

  calculate = function(self, card, context)
    if context.playing_card_added and not context.blueprint then
      local ranks = 0
      for _, playing_card in ipairs(context.cards) do
        if not SMODS.has_no_rank(playing_card) then
          ranks = ranks + playing_card.base.nominal
        end
      end
      if ranks > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "chips",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + ranks * change
          end,
          message_colour = G.C.CHIPS
        })
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  abn_artist_credits = {
    artist = "Vevekhi",
  },
}
