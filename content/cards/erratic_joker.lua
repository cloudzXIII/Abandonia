SMODS.Joker {
  key = 'erratic_joker',
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips_gain, card.ability.extra.chips } }
  end,
  rarity = 2,
  atlas = 'ABNJokerSheet6',
  pos = { x = 4, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = false,
  config = { extra = { chips = 0, chips_gain = 2 } },
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local all_suits = { "Diamonds", "Spades", "Hearts", "Clubs" }
      if SMODS.Suits then
        for _, suit in ipairs(SMODS.Suits) do
          if suit.key and not (suit.key == "Diamonds" or suit.key == "Spades" or suit.key == "Hearts" or suit.key == "Clubs") then
            table.insert(all_suits, suit.key)
          end
        end
      end
      local changed = 0
      -- Solo procesar cartas que anotan
      for _, played_card in ipairs(G.play.cards) do
        if played_card:is_scoring() then
          local available_suits = {}
          for _, suit in ipairs(all_suits) do
            if suit ~= played_card.base.suit then
              table.insert(available_suits, suit)
            end
          end
          if #available_suits > 0 then
            local new_suit = available_suits[math.random(#available_suits)]
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
