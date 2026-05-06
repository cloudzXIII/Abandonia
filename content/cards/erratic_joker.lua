SMODS.Joker {
  key = 'erratic_joker',
  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.chips_gain, card.ability.extra.chips }
    }
  end,
  rarity = 1,
  atlas = 'ABNJokerSheet6',
  pos = { x = 4, y = 4 },
  cost = 2,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  config = { extra = { chips = 0, chips_gain = 10 } },
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local suit_map = { Diamonds = "Spades", Spades = "Hearts", Hearts = "Clubs", Clubs = "Diamonds", }
      local changed = 0
      for _, played_card in ipairs(G.play.cards) do
        local new_suit = suit_map[played_card.base.suit]
        if new_suit and played_card.base.suit ~= new_suit then
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
              played_card:flip()
              play_sound('card1', 1)
              played_card:juice_up(0.3, 0.3)
              return true
            end
          }))
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
              assert(SMODS.change_base(played_card, new_suit, nil))
              return true
            end
          }))
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
              played_card:flip()
              play_sound('tarot2', 1, 0.6)
              played_card:juice_up(0.3, 0.3)
              return true
            end
          }))
          changed = changed + 1
        end
      end
      if changed > 0 then
        card.ability.extra.chips = card.ability.extra.chips + (changed * card.ability.extra.chips_gain)
        return { message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }, colour = G.C.CHIPS, }
      end
    end
    if context.joker_main then
      return { chips = card.ability.extra.chips }
    end
  end,
  abn_artist_credits = { artist = "Realeddyplayz" },
}
