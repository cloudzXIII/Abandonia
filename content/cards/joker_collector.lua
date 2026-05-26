-- Joker Collector (coded by cloudzXIII)
SMODS.Joker {
  key = 'joker_collector',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.chips * (G.GAME.abn_jokers_purchased or 0),
        card.ability.extra.xmult,
        card.ability.extra.xmult
      }
    }
  end,

  rarity = 2,
  atlas = 'ABNJokerSheet1',
  pos = { x = 0, y = 5 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      chips = 10,
      xmult = 2
    },
  },
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability.extra.chips * (G.GAME.abn_jokers_purchased or 0),
        xmult = (G.GAME.abn_jokers_purchased or 0) >= 10 and card.ability.extra.xmult
      }
    end
  end,
  abn_artist_credits = {
    artist = "MorphineMilkshake",
  },
}

local SMODS_calculate_context_ref = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
  if context.buying_card and context.card.ability.set == "Joker" then
    G.GAME.abn_jokers_purchased = (G.GAME.abn_jokers_purchased or 0) + 1
  end
  return SMODS_calculate_context_ref(context, return_table)
end
