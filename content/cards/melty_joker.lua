SMODS.Joker {
  key = 'melty_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 6, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = false,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.before then
      local leftmost = context.scoring_hand[1]
      local rightmost = context.scoring_hand[#context.scoring_hand]
      if leftmost and rightmost and #context.scoring_hand >= 2 then
        leftmost.ability.perma_bonus = (leftmost.ability.perma_bonus or 0)
            + rightmost.base.nominal
        SMODS.destroy_cards(rightmost)
        SMODS.calculate_effect({ message = localize('k_upgrade_ex'), colour = G.C.FILTER }, leftmost)
      end
    end
  end,
  abn_artist_credits = {
    artist = "emmythegremlin",
  },
}
