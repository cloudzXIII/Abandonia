-- its joever
SMODS.Joker {
  key = 'joerror',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
      }
    }
  end,

  rarity = 2,
  atlas = 'AbandoniaJokers',
  pos = { x = 9, y = 18 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      xmult = 2,
    },
  },
  calculate = function(self, card, context)
    if context.other_joker then
      return {
        xmult = card.ability.extra.xmult
      }
    end
    if context.after and context.main_eval and not context.blueprint then
      SMODS.destroy_cards(card, nil, nil, true)
      SMODS.calculate_effect({ message = localize('k_abn_destroyed'), colour = G.C.FILTER }, card)
    end
  end,
  abn_artist_credits = {
    artist = "BrownieBread"
  },
}
