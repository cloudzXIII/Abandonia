SMODS.Joker {
  key = 'mana',
  loc_txt = {
    ['en-us'] = {
      unlock = {
        "?????",
      },
    }
  },
  rarity = 4,
  atlas = 'AbandoniaLegendary',
  pos = { x = 2, y = 0 },
  soul_pos = { x = 3, y = 0 },
  cost = 20,
  discovered = false,
  blueprint_compat = true,
  unlocked = false,

  config = { extra = { dollars = 5 } },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_sunscourge
    return { vars = { card.ability.extra.dollars } }
  end,

  add_to_deck = function(self, card)
    unlock_card(self)
  end,

  calculate = function(self, card, context)
    -- Trigger for every card in the scoring hand individually
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      local id = target_card:get_id()

      if context.other_card:get_id() ~= 1 then
        local is_first_ace = false
        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          if scoring_card:get_id() == 14 then
            is_first_ace = (scoring_card == context.other_card)
            break
          end
        end

        for i = 1, #context.scoring_hand do
          local scoring_card = context.scoring_hand[i]
          if scoring_card:get_id() == 2 then
            is_first_two = (scoring_card == context.other_card)
            break
          end
        end

        -- Logic for First Ace of the round
        if is_first_ace and G.GAME.current_round.hands_played == 0 then
          context.other_card:set_edition('e_abn_sunscourge', true)
        end
        -- Logic for First two of the round
        if is_first_two and G.GAME.current_round.hands_played == 0 then
          context.other_card:set_edition('e_abn_sunscourge', true)
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}
