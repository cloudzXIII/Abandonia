SMODS.Joker {
  key = 'van_joker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.voucher_slots
      }
    }
  end,

  rarity = 1,
  atlas = 'AbandoniaJokers',
  pos = { x = 3, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      voucher_slots = 1
    },
  },
  add_to_deck = function(self, card, from_debuff)
    SMODS.change_voucher_limit(card.ability.extra.voucher_slots)
  end,
  remove_from_deck = function(self, card, from_debuff)
    SMODS.change_voucher_limit(-card.ability.extra.voucher_slots)
  end,
  abn_artist_credits = {
    artist = "Sheithan"
  },
}
