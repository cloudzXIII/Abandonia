SMODS.Joker {
  key = 'bestfriend_photograph',
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_chips,
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet13',
  pos = { x = 3, y = 5 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      x_chips = 2,
    },

  },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and ABN.is_number(context.other_card) then
      local first_number = nil
      for i = 1, #context.scoring_hand do
        local v = context.scoring_hand[i]
        if ABN.is_number(v) then
          first_number = v
          break
        end
      end
      
      if context.other_card == first_number then
        return {
          x_chips = card.ability.extra.x_chips,
        }
      end
    end
  end,


  abn_artist_credits = {
    artist = "b.b.b.b",
  },
}
