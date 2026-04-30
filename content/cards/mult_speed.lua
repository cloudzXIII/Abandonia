SMODS.Joker {
  key = 'mult_speed',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
        card.ability.extra.dollars
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 0, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,


  config = { extra = { mult = 0.5, chips = 15, dollars = 3 } },

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if G.GAME.current_round.hands_left % 2 == 0 then
        context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) +
            card.ability.extra.dollars
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MONEY
        }
      end

      if G.GAME.current_round.hands_left % 2 == 1 then
        context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
            card.ability.extra.chips
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.CHIPS
        }
      end
      if G.GAME.current_round.hands_left == 0 then
        context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) +
            card.ability.extra.dollars
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MONEY
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Modliich",
  },
}
