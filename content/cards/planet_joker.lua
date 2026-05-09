-- Planet Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'planet_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.amount } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 4, y = 3 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { amount = 1 } },

  calculate = function(self, card, context)
    if context.after and context.main_eval and not context.blueprint and SMODS.last_hand_oneshot and G.GAME.blind.boss then
      SMODS.calculate_effect({ message = localize('k_upgrade_ex'), colour = G.C.FILTER }, card)
      update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
        { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
          play_sound('tarot1')
          card:juice_up(0.8, 0.5)
          G.TAROT_INTERRUPT_PULSE = true
          return true
        end
      }))
      update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
          play_sound('tarot1')
          card:juice_up(0.8, 0.5)
          return true
        end
      }))
      update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
          play_sound('tarot1')
          card:juice_up(0.8, 0.5)
          G.TAROT_INTERRUPT_PULSE = nil
          return true
        end
      }))
      update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
      delay(1.3)
      SMODS.upgrade_poker_hands({ instant = true, level_up = card.ability.extra.amount })
      update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
        { mult = 0, chips = 0, handname = '', level = '' })
    end
  end,
  abn_artist_credits = {
    artist = "Vega"
  },
}
