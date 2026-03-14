SMODS.Joker {
  key = 'xenon_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    return { vars = { card.ability.extra.xmult } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 0, y = 8 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 1.5 } },

  calculate = function(self, card, context)
    if context.other_joker and context.other_joker.edition and context.other_joker.edition.polychrome == true and card ~= context.other_joker
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
    if context.individual and context.cardarea == G.play then
      if context.other_card.edition and context.other_card.edition.key == "e_holo" then
        return {
          x_mult = card.ability.extra.xmult
        }
      end
    end
  end,
  in_pool = function(self, args)
    for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
      if joker.edition and joker.edition.key == "e_holo" then
        return true
      end
    end
    return false
  end,
  abn_artist_credits = {
    artist = "Iwas_nevergood",
  },
}
