SMODS.Joker {
  key = 'ichor',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    return {
      vars = { card.ability.extra.xmult, localize({ type = 'name_text', key = "e_negative", set = "Edition" })
      }
    }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 0, y = 1 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,

  config = { extra = { xmult = 1.5 } },

  calculate = function(self, card, context)
    if context.other_joker and context.other_joker.edition and context.other_joker.edition.negative == true and card ~= context.other_joker
    then
      G.E_MANAGER:add_event(Event({
        func = function()
          context.other_joker:juice_up(0.5, 0.5)
          return true
        end,
      }))
      return {
        x_mult = card.ability.extra.xmult
      }
    end
  end,
  in_pool = function(self, args)
    for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
      if joker.edition and joker.edition.key == "e_negative" then
        return true
      end
    end
    return false
  end,
  abn_artist_credits = {
    artist = "Dogg-Fly",
  },
}
