SMODS.Joker {
  key = 'sloth',
  loc_vars = function(self, info_queue, card)
    local x_mult = card.ability.extra.x_mult*ABN.get_unique_played_poker_hands()
    return {
      vars = {
        x_mult,
        card.ability.extra.x_mult,
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet14',
  pos = { x = 3, y = 0 },
  cost = 1,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      x_mult=0.5,
    },

  },

  calculate = function(self, card, context)
    if context.buying_self then
        for i,v in ipairs(G.jokers.cards) do
            v:set_eternal(true)
        end
    end
    if context.joker_main and G.GAME.current_round.hands_left == 0 then
        return {
            x_mult=card.ability.extra.x_mult*ABN.get_unique_played_poker_hands()
        }
    end
  end,


  abn_artist_credits = {
    artist = "Comkyel",
  },
}
