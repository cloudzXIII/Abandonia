SMODS.Joker {
  key = 'nuruomino_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet8',
  pos = { x = 0, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,
  unlocked = true,
  config = { extra = { chips = 10, triggered = 0 } },

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,

  in_pool = function(self)
    if not (G.GAME and G.GAME.hands) then return false end

    -- Check if a Straight has been played
    local straight_played = false
    if G.GAME.hands['Straight'] and G.GAME.hands['Straight'].played > 0 then
      straight_played = true
    end

    -- Check if a program card has been used
    local program_card_used = G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.program_pack and
        G.GAME.consumeable_usage_total.program_pack > 0

    -- If all yes spawn
    return straight_played and program_card_used
  end,

  calculate = function(self, card, context)
    -- If using a program card
    if context.using_consumeable and context.consumeable.ability.set == "program_pack" then
      if G.hand.cards then
        for _, c in ipairs(G.hand.cards) do
          -- Give held dark cards chips
          if ABN.is_dark(c) then
            c.ability.perma_bonus = (c.ability.perma_bonus or 0) + card.ability.extra.chips
          end
        end
      end
    end

    if context.cardarea == G.jokers and context.before then
      -- Check if the played hand is a Straight or Straight Flush
      local base_hand = context.scoring_name
      if base_hand == "Straight" or base_hand == "Straight Flush" then
        -- Check if the cards are all dark
        local all_dark = true
        if context.scoring_hand and #context.scoring_hand > 0 then
          for i = 1, #context.scoring_hand do
            if not ABN.is_dark(context.scoring_hand[i]) then
              all_dark = false
              break
            end
          end
        else
          all_dark = false
        end

        -- Level up
        if all_dark and card.ability.extra.triggered == 0 then
          card.ability.extra.triggered = 1
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Level Up!", colour = G.C.CHIPS })
          card:juice_up()

          -- Upgrade each cards rank
          for i = 1, #context.scoring_hand do
            local scoring_card = context.scoring_hand[i]
            local card_rank = scoring_card.base.value

            if card_rank and G.GAME.abn_rank_upgrades[card_rank] then
              ABN.level_up_rank(card, card_rank, card.ability.extra.level_amount, false)
            end
          end
        end
      end
    end

    -- Reset tracking
    if context.end_of_round then
      card.ability.extra.triggered = 0
    end
  end,

  abn_artist_credits = {
    artist = "Firch",
  },
}
