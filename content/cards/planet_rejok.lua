-- Planet Rejok (coded by cloudzXIII)
SMODS.Joker {
  key = 'planet_rejok',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 5, y = 3 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },

  calculate = function(self, card, context)
    if context.joker_main then
      local chip_total = 0
      local mult_total = 0
      if context.scoring_name and context.poker_hands then
        for hand, v in pairs(context.poker_hands) do
          if hand ~= context.scoring_name and next(context.poker_hands[hand]) and G.GAME.hands[hand] then
            chip_total = chip_total + G.GAME.hands[hand].chips
            mult_total = mult_total + G.GAME.hands[hand].mult
          end
        end
      end
      if chip_total > 0 and mult_total > 0 then
        return {
          mult = mult_total,
          chips = chip_total
        }
      elseif chip_total > 0 then
        return {
          chips = chip_total
        }
      elseif mult_total > 0 then
        return {
          mult = mult_total
        }
      end
    end
  end,
  abn_artist_credits = {
    artist = "Vega"
  },
}
