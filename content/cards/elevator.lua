SMODS.Joker {
  key = 'elevator',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.choice } }
  end,

  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 2, y = 3 },
  cost = 4,
  discovered = false,
  blueprint_compat = false,

  config = { extra = {} },
  calculate = function(self, card, context)
    if context.final_scoring_step and not context.blueprint then
      for _, scored_card in ipairs(context.scoring_hand) do
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            scored_card:flip()
            play_sound('card1', 1)
            scored_card:juice_up(0.3, 0.3)
            return true
          end
        }))
        delay(0.2)

        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.1,
          func = function()
            assert(SMODS.modify_rank(scored_card, 1))
            return true
          end
        }))

        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            scored_card:flip()
            play_sound('tarot2', 1, 0.6)
            scored_card:juice_up(0.3, 0.3)
            return true
          end
        }))
        delay(0.5)
      end

      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.FILTER
      }
    end
  end,
  abn_artist_credits = {
    artist = "iprefercheddar"
  },
}
