SMODS.Joker {
  key = 'busybee',
  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 3, y = 4 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,
  attributes = { "food" },

  config = { extra = { odds = 0, dollars = 5 } },


  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
    return { vars = { numerator, denominator, card.ability.extra.dollars } }
  end,

  --only appear if you have food
  in_pool = function(self)
    if not G.playing_cards or not G.jokers then return false end

    local has_food = false

    -- Check for Food Jokers
    for _, j in ipairs(G.jokers.cards) do
      if j and j.has_attribute and j:has_attribute("food") then
        has_food = true
        break
      end
    end

    -- Only return true if we have food
    return has_food
  end,


  calculate = function(self, card, context)
    -- retrigger rightmost food
    if context.retrigger_joker_check and not context.retrigger_joker and context.other_card and not context.end_of_round and not context.main_eval then
      -- Find the rightmost food joker
      local rightmost_food = nil
      for i = #G.jokers.cards, 1, -1 do
        local j = G.jokers.cards[i]
        if j:has_attribute("food") then
          rightmost_food = j
          break
        end
      end

      -- Only retrigger if the card being checked is that specific rightmost food
      if rightmost_food and context.other_card == rightmost_food then
        ease_dollars(-card.ability.extra.dollars)
        return {
          message = localize('k_again_ex'),
          repetitions = 1,
          card = card
        }
      end
    end

    if context.mod_probability and not context.blueprint and not context.retrigger_joker then
      if context.trigger_obj and context.trigger_obj.has_attribute and context.trigger_obj:has_attribute("food") then
        -- Only return the new numerator if the current one isn't already the target value
        if context.trigger_obj.ability.numerator ~= card.ability.extra.odds then
          return {
            numerator = card.ability.extra.odds
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Mark_rat",
  },
}
