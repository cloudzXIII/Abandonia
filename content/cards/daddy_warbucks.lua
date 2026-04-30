SMODS.Joker {
  key = 'daddy_warbucks',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.dollars
      }
    }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet5',
  pos = { x = 1, y = 3 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      chips = 50,
      dollars = 20
    },
  },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if G.GAME.dollars >= card.ability.extra.dollars then
        return {
          chips = card.ability.extra.chips
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Littleroot"
  },
}
