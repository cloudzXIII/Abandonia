if ((SMODS.Mods["Spectrallib"] or {}).can_load) then
SMODS.Joker {
  key = 'sol_iii',
  rarity = 3,
  atlas = 'ABNJokerSheet18',
  pos = { x = 6, y = 2 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = {
      asc_mod = 0.25
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.asc_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before then
      local hand_level = G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].level or 1
      local total_ascension = hand_level * card.ability.extra.asc_mod

      if total_ascension > 0 then
        return {
          asc = total_ascension,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Papermoon & B.b.b.b",
  },
}
end