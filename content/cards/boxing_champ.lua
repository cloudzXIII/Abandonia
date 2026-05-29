-- Boxing Champ (coded by cloudzXIII)
SMODS.Joker {
  key = 'boxing_champ',

  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain, cae.chips, cae.chips_gain } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 0, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 2, chips = 0, chips_gain = 4 } },
  calculate = function(self, card, context)
    if context.post_trigger and context.other_card.ability.set == "Joker" and context.other_card ~= card and not context.blueprint then
      -- timing is pretty ugly, but like if i put it in an event it happens too late :thonk:
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
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Littlesamu",
  },
}
