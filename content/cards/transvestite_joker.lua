SMODS.Joker {
  key = 'transvestite_joker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips
      }
    }
  end,

  rarity = 3,
  atlas = "ABNJokerSheet5",
  pos = { x = 1, y = 2 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 10, chips = 5 } },

  calculate = function(self, card, context)
    if (context.change_rank and context.old_rank ~= nil) or (context.change_suit and context.old_suit ~= nil) then
      local bp = context.blueprint_card
      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.calculate_effect({
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
            colour = G.C.RED,
            message_card = context.other_card,
            card = bp or card
          })
          context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
          context.other_card.ability.perma_chips = (context.other_card.ability.perma_chips or 0) +
              card.ability.extra.chips
          return true
        end
      }))
    end
  end,

  abn_artist_credits = {
    artist = "Criyo",
  },
}
