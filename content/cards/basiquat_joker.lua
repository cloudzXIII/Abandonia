SMODS.Joker {
  key = 'basiquat_joker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 5, y = 1 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, chips = 0, } },

  calculate = function(self, card, context)
    if context.before then
      if context.scoring_hand and #context.scoring_hand % 2 == 0 then
        --upgrade
        for _, j in ipairs(G.jokers.cards) do
          card.ability.extra.chips = card.ability.extra.chips + (j.sell_cost * 2)
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.BLUE,
            card = card
          }
        end
      elseif context.scoring_hand and #context.scoring_hand % 2 ~= 0 then
        --upgrade
        for _, j in ipairs(G.jokers.cards) do
          card.ability.extra.mult = card.ability.extra.mult + (j.sell_cost * 2)
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.RED,
            card = card
          }
        end
      end
    end

    -- Scoring logic
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "HyperReal63",
  },
}
