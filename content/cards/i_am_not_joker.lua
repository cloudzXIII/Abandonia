-- I am not Joker (coded by cloudzXIII)
SMODS.Joker {
  key = 'i_am_not_joker',

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_hazard
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet3',
  pos = { x = 9, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { mult = 0, mult_gain = 10 } },

  calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and context.game_over == false and G.GAME.blind.boss and not context.blueprint then
      local leftmost = G.jokers.cards[1]
      if leftmost then
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            if leftmost.facing == 'front' then
              leftmost:flip()
            end
            leftmost.ability.abn_perma_flipped = true
            leftmost:juice_up(0.3, 0.5)
            return true
          end
        }))
      end
    end

    if context.post_trigger and context.other_card.ability.set == "Joker" and context.other_card.ability.abn_perma_flipped then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        operation = '+',
      })
    end

    if context.before and not context.blueprint and card.ability.abn_perma_flipped then
      if context.scoring_hand and context.scoring_hand[1] then
        local first_card = context.scoring_hand[1]
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            first_card:set_ability("m_abn_hazard", true)
            card:juice_up(0.3, 0.5)
            return true
          end
        }))
      end
    end

    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
  abn_artist_credits = {
    artist = "Modliich",
  },
  in_pool = function(self)
    for _, joker in ipairs(G.jokers.cards or {}) do
      if joker.ability.abn_perma_flipped then
        return true
      end
    end
    return false
  end
}
