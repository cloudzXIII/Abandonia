SMODS.Joker {
  key = 'polychameleon',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    local count = 0
    for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
      if joker.edition and joker.edition.key == "e_polychrome" then
        count = count + 1
      end
      if joker.edition and joker.edition.key == "e_holo" then
        count = count + 1
      end
    end
    return { vars = { card.ability.extra.xmult, 1 + (card.ability.extra.xmult * count), localize({ type = 'name_text', key = "e_polychrome", set = "Edition" }), localize({ type = 'name_text', key = "e_holo", set = "Edition" }) } }
  end,

  rarity = 3,
  atlas = 'AbandoniaJokers',
  pos = { x = 6, y = 10 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { xmult = 0.5 } },

  calculate = function(self, card, context)
    if context.joker_main then
      local count = 0
      for _, joker in ipairs(G.jokers.cards) do
        if joker.edition and joker.edition.key == "e_polychrome" then
          count = count + 1
        end
        if joker.edition and joker.edition.key == "e_holo" then
          count = count + 1
        end
      end
      return {
        x_mult = 1 + (card.ability.extra.xmult * count)
      }
    end
  end,
  in_pool = function(self, args)
    local holo = false
    local polychrome = false
    for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
      if joker.edition and joker.edition.key == "e_polychrome" then
        polychrome = true
      end
      if joker.edition and joker.edition.key == "e_holo" then
        holo = true
      end
    end
    return holo and polychrome
  end,
  abn_artist_credits = {
    artist = "Grass",
  },
}
