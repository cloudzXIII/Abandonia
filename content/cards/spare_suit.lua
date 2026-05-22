-- Spare Suit (coded by cloudzXIII)
SMODS.Joker {
  key = 'spare_suit',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS["m_abn_mercurial"]
    local cae = card.ability.extra
    return { vars = { cae.mult, cae.mult_gain, localize(cae.type, 'poker_hands'), } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 2, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  config = { extra = { mult = 0, mult_gain = 5, type = "abn_Spectrum", repetitions = 1 } },

  calculate = function(self, card, context)
    if context.before and next(context.poker_hands[card.ability.extra.type]) then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
      })
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
    if context.repetition and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, "m_abn_mercurial") then
        return {
          repetitions = card.ability.extra.repetitions
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "NiceCream",
  },
}
