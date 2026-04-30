SMODS.Joker {
  key = 'beyond_the_rainbow',
  rarity = 2,
  atlas = 'ABNJokerSheet6',
  pos = { x = 3, y = 2 },
  cost = 7,
  discovered = false,
  blueprint_compat = true,

  config = {
    extra = {
      xmult = 1,
      xmultadd = 0.1,
      odds = 8
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xmultadd,
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  in_pool = function(self)
    local spectrum_hands = {
      "abn_Spectrum", "abn_Specflush", "abn_Straight Specflush",
      "abn_Specflush House", "abn_Specflush Five", "abn_Specflush Six"
    }

    if G.GAME and G.GAME.hands then
      for _, hand_name in ipairs(spectrum_hands) do
        if G.GAME.hands[hand_name] and G.GAME.hands[hand_name].played > 0 then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    -- SCALING LOGIC
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
        local suits_found = {}
        local unique_suit_count = 0

        for i = 1, #context.scoring_hand do
          local suit = context.scoring_hand[i].base.suit
          if not suits_found[suit] then
            suits_found[suit] = true
            unique_suit_count = unique_suit_count + 1
          end
        end

        if unique_suit_count > 0 then
          -- Uses the new config value
          card.ability.extra.xmult = card.ability.extra.xmult + (unique_suit_count * card.ability.extra.xmultadd)
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Upgrade!", colour = G.C.Mult })
          card:juice_up()
        end
      end
    end

    -- give tag
    if context.individual and context.cardarea == G.play and card.edition then
      if pseudorandom('rainbow_tag') < G.GAME.probabilities.normal / card.ability.extra.odds then
        add_tag(Tag('tag_double'))
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Double Tag!", colour = G.C.ATTENTION })
        card:juice_up()
      else
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = "NOPE!", colour = G.C.PURPLE })
      end
    end

    -- SCORING LOGIC
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,

  abn_artist_credits = {
    artist = "IPreferCheddar",
  },
}
