-- Frontier Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'frontier_joker',

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars,
        card.ability.extra.sell_value
      }
    }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet9',
  pos = { x = 3, y = 0 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      dollars = 2,
      sell_value = 1
    },
  },
  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == "continent" then
      for _, other_card in ipairs(G.jokers.cards) do
        if other_card.set_cost then
          other_card.ability.extra_value = (other_card.ability.extra_value or 0) +
              card.ability.extra.sell_value
          other_card:set_cost()
        end
      end
      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
  end,
  calc_dollar_bonus = function(self, card)
    return #G.consumeables.cards > 0 and #G.consumeables.cards * card.ability.extra.dollars or nil
  end,
  abn_artist_credits = {
    artist = "DankPastaMaster",
  },
  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.continent and
        G.GAME.consumeable_usage_total.continent > 0
  end
}

local SMODS_calculate_context_ref = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
  if context.buying_card and context.card.ability.set == "Joker" then
    G.GAME.abn_jokers_purchased = (G.GAME.abn_jokers_purchased or 0) + 1
  end
  return SMODS_calculate_context_ref(context, return_table)
end
