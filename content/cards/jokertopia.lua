-- Jokertopia (coded by cloudzXIII)
SMODS.Joker {
  key = 'jokertopia',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, localize(card.ability.extra.type, 'poker_hands') } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 0, y = 3 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 10, type = "abn_Spectrum" } },
  calculate = function(self, card, context)
    if context.before and next(context.poker_hands[card.ability.extra.type]) then
      local has_continent = false
      for _, v in ipairs(G.consumeables.cards) do
        if v.ability.set == "continent" then
          has_continent = true
        end
      end
      if has_continent then
        local suits = {}
        for _, v in ipairs(context.scoring_hand) do
          suits[v.base.suit] = true
        end

        local unique_suits = 0
        for _ in pairs(suits) do
          unique_suits = unique_suits + 1
        end

        for _, joker in ipairs(G.jokers.cards) do
          joker.ability.abn_perma_mult = (joker.ability.abn_perma_mult or 0) + (card.ability.extra.mult * unique_suits)
          SMODS.calculate_effect({ message = localize("k_upgrade_ex") }, joker)
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "Null",
  },
  in_pool = function(self)
    return G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.continent and
        G.GAME.consumeable_usage_total.continent > 0 and G.GAME.hands["abn_Spectrum"] and
        G.GAME.hands["abn_Spectrum"].played > 0
  end
}

local set_cost_ref = Card.set_cost_value
function Card:set_cost_value(...)
  local ret = set_cost_ref(self, ...)
  if next(SMODS.find_card("j_abn_jokertopia")) then
    if self.ability.set == 'continent' then
      self.cost = 0
    end
  end
  return ret
end
