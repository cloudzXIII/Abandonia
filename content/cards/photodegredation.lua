SMODS.Joker {
  key = 'photodegradation',
  rarity = 1,
  atlas = 'ABNJokerSheet1',
  pos = { x = 7, y = 2 },
  cost = 4,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      chips = 0,
      mult = 0,
      x_mult = 1,
      chipsadd = 4,
      multadd = 2,
      xmultadd = 0.05
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.x_mult,
        card.ability.extra.chipsadd,
        card.ability.extra.multadd,
        card.ability.extra.xmultadd
      }
    }
  end,

  in_pool = function(self)
    -- check if any of the spectrum hands have been played this run
    local hand_played = false
    local spectrum_hands = {
      "abn_Spectrum",
      "abn_Specflush",
      "abn_Straight Specflush",
      "abn_Specflush House",
      "abn_Specflush Five",
      "abn_Specflush Six"
    }

    if G.GAME and G.GAME.hands then
      for _, hand_name in ipairs(spectrum_hands) do
        if G.GAME.hands[hand_name] and G.GAME.hands[hand_name].played > 0 then
          hand_played = true
          break
        end
      end
    end

    return hand_played
  end,

  calculate = function(self, card, context)
    -- scaling
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      local valid_hands = {
        ["abn_Spectrum"] = true,
        ["abn_Specflush"] = true,
        ["abn_Straight Specflush"] = true,
        ["abn_Specflush House"] = true,
        ["abn_Specflush Five"] = true,
        ["abn_Specflush Six"] = true
      }

      if valid_hands[context.scoring_name] then
        -- count occurrences of each suit in the hand (not played cards)
        local suit_counts = {}
        local max_count = 0

        for _, hc in ipairs(G.hand.cards) do
          local suit = hc:is_suit()
          suit_counts[suit] = (suit_counts[suit] or 0) + 1
          if suit_counts[suit] > max_count then
            max_count = suit_counts[suit]
          end
        end

        -- scale if we have matching suits (max_count > 1)
        if max_count > 0 then
          card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chipsadd * max_count)
          card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.multadd * max_count)

          -- edition check
          if card.edition then
            card.ability.extra.x_mult = card.ability.extra.x_mult + (card.ability.extra.xmultadd * max_count)
          end

          card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Upgrade!", colour = G.C.BLUE })
          card:juice_up()
        end
      end
    end

    -- SCORING LOGIC
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult,
        x_mult = card.ability.extra.x_mult,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Fridgemancer",
  },
}
