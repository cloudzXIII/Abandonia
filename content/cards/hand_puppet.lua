-- Hand Pupper (coded by cloudzXIII)
SMODS.Joker {
  key = 'hand_puppet',
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet13',
  pos = { x = 9, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0 } },

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local total = 0
      for i = 1, #G.hand.cards do
        if G.hand.cards[i].edition then
          G.hand.cards[i]:juice_up(0.3, 0.5)
          total = total + (G.hand.cards[i].base.nominal * 2)
        end
      end
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + total
        end,
      })
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,

  abn_artist_credits = {
    artist = "La Ginger",
  },
}
