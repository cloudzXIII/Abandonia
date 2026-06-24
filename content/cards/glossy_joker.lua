SMODS.Joker {
  key = 'glossy_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 5, y = 0 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      xmult = 2,
      mult = 0,
      mult_gain = 10,
    }
  },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.mult,
        card.ability.extra.mult_gain,
      },
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if card.edition and card.edition.key == 'e_abn_gloss' and context.other_card.edition and context.other_card.edition.key == 'e_abn_gloss' then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_gain",
        })
      end
      return {
        xmult = card.ability.extra.xmult,
      }
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
      }
    end
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}
