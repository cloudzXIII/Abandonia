SMODS.Joker {
  key = 'late_pass',
  rarity = 1,
  atlas = 'ABNJokerSheet26',
  pos = { x = 7, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { chips = 100 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,

  calculate = function(self, card, context)
    if context.final_scoring_step then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,

  abn_artist_credits = {
    artist = "Vlambambo"
  },
}