-- Black Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'blackhat_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet10',
  pos = { x = 3, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 10 } },
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local found = false
      for _, consumeable in ipairs(G.consumeables.cards or {}) do
        if consumeable.ability.set == "program_pack" then
          found = true
        end
      end
      if found then
        return {
          chips = card.ability.extra.chips
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Comykel",
  },

  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.program_pack and
        G.GAME.consumeable_usage_total.program_pack > 0
  end,
}
