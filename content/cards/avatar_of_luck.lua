SMODS.Joker {
  key = 'avatar_of_luck',
  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 8, y = 4 },
  cost = 15,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      hands_remaining = 6,
      hands_required = 6,
      asc_gain = 0.25,
    }
  },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.hands_remaining, card.ability.extra.hands_required, card.ability.extra.asc_gain } }
  end,

  in_pool = function(self, args)
    local lucky_count = 0
    if G and G.playing_cards then
      for _, playing_card in ipairs(G.playing_cards) do
        if SMODS.has_enhancement(playing_card, 'm_lucky') then
          lucky_count = lucky_count + 1
        end
      end
    end
    return lucky_count >= 6
  end,

  add_to_deck = function(self, card, from_debuff)
    SMODS.change_play_limit(1)
  end,

  remove_from_deck = function(self, card, from_debuff)
    SMODS.change_play_limit(-1)
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger then
      if context.scoring_hand then
        for _, scored_card in ipairs(context.scoring_hand) do
          scored_card.ability.abn_perma_asc = (scored_card.ability.abn_perma_asc or 0) + card.ability.extra.asc_gain
        end
      end
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MULT,
        message_card = card
      }
    end

    if context.before then
      local all_lucky = true
      if context.scoring_name ~= "High Card" then
        for _, scored_card in ipairs(context.scoring_hand) do
          if not SMODS.has_enhancement(scored_card, 'm_lucky') then
            all_lucky = false
            break
          end
        end
      else
        all_lucky = false
      end

      if all_lucky then
        local scoring_count = #context.scoring_hand
        if scoring_count >= 6 then
          card.ability.extra.hands_remaining = card.ability.extra.hands_remaining - 1
        end

        -- Check if target hand requirement is met, then level up all hands with Black Hole UI sequence and dissolve
        if card.ability.extra.hands_remaining <= 0 then
          card.ability.extra.hands_remaining = card.ability.extra.hands_required
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
          SMODS.upgrade_poker_hands({ instant = true })
          update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = '', level = '' })

          card:start_dissolve()
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Ruby",
  },
}
