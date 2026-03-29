SMODS.Joker {
  key = 'joker_invoice',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.dollars
      }
    }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 4, y = 24 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      mult = 50,
      dollars = 5
    },
  },
  calculate = function(self, card, context)
    if context.joker_main then
      if G.GAME.dollars <= card.ability.extra.dollars then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Littleroot"
  },
}
