SMODS.Joker {
  key = 'dorcelessness',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = { card.ability.extra.repetitions } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet2',
  pos = { x = 8, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { repetitions = 1 } },

  in_pool = function(self)
    if not G or not G.jokers then return false end

    for _, joker in ipairs(G.jokers.cards) do
      if joker.ability and joker.ability.abn_perma_flipped then
        return true
      end
    end

    return false
  end,

  calculate = function(self, card, context)
    if context.retrigger_joker_check then
      local pos = ABN.get_pos(card, G.jokers.cards)
      local left = G.jokers.cards[pos - 1]
      local right = G.jokers.cards[pos + 1]
      for _, adj in pairs({ left, right }) do
        if adj == context.other_card and adj.facing == "back" then
          return {
            repetitions = 1
          }
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "Warpedcloset"
  },
}
