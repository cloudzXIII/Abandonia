-- copy pasted over from scrabble joker
SMODS.Joker {
  key = 'crossword_puzzle',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.x_chips, card.ability.extra.x_chips_gain } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 3, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { x_chips = 1, x_chips_gain = 0.1 } },
  calculate = function(self, card, context)
    if context.abn_letter_activated then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_chips",
        scalar_value = "x_chips_gain",
        operation = '+',
        message_key = "a_xmult"
      })
    end
    if context.joker_main then
      return {
        x_chips = card.ability.extra.x_chips
      }
    end
    -- added by revo 
    if context.selling_card and context.card and context.card.ability and context.card.ability.set == "lexica" then
      card.ability.extra.x_chips = 1
      ABN.msg(card, localize("k_reset"))
    end
  end,
  abn_artist_credits = {
    artist = "Sustato",
  },
  in_pool = function(self)
    return (G.GAME.abn_letters_activated or 0) > 0
  end
}
