SMODS.Joker {
  key = 'vaporwave_joker.lua',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    return { vars = { card.ability.extra.mult } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 8, y = 5 },
  soul_pos = { x = 9, y = 5 },
  cost = 8,
  discovered = true,
  blueprint_compat = false,

  config = { extra = { mult = 8 } },

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
        mult = card.ability.extra.mult
      }
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.edition and context.other_card.edition.key == "e_polychrome" then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
  end,
  in_pool = function(self, args)
    for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
      if joker.edition and joker.edition.key == "e_polychrome" then
        return true
      end
    end
    return false
  end,
  abn_artist_credits = {
    artist = "Skellington",
  },
}
