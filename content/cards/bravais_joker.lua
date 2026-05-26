SMODS.Joker {
  key = 'bravais_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet4',
  pos = { x = 9, y = 2 },
  cost = 5,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { chips = 0, mult = 0, chipsadd = 10, multadd = 3 } },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_mercurial
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    return {
      vars = {
        card.ability.extra.chips,
        card.ability.extra.mult,
        card.ability.extra.chipsadd,
        card.ability.extra.multadd
      }
    }
  end,

  in_pool = function(self)
    -- check for Wild or Mercurial cards in the deck
    local has_card = false
    if G.playing_cards then
      for _, card in ipairs(G.playing_cards) do
        if card and card.config and card.config.center and (card.config.center == G.P_CENTERS.m_wild or card.config.center == G.P_CENTERS.m_abn_mercurial) then
          has_card = true
          break
        end
      end
    end

    -- check run data for played Spectrum hands
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

    return has_card and hand_played
  end,

  calculate = function(self, card, context)
    -- SCALING LOGIC: Happens 'before' the hand scores
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      -- List of valid hands that trigger scaling
      local valid_hands = {
        ["abn_Spectrum"] = true,
        ["abn_Specflush"] = true,
        ["abn_Straight Specflush"] = true,
        ["abn_Specflush House"] = true,
        ["abn_Specflush Five"] = true,
        ["abn_Specflush Six"] = true
      }

      if valid_hands[context.scoring_name] then
        for _, scoring_card in ipairs(context.scoring_hand) do
          local triggered = false

          -- Check for Wild Cards
          if scoring_card.config.center == G.P_CENTERS.m_wild then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
            if card.edition then
              scoring_card.ability.perma_bonus = (scoring_card.ability.perma_bonus or 0) + card.ability.extra.chipsadd
            end
            triggered = true
          end

          -- Check for Mercurial Cards
          if scoring_card.config.center == G.P_CENTERS.m_abn_mercurial then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
            if card.edition then
              scoring_card.ability.perma_mult = (scoring_card.ability.perma_mult or 0) + card.ability.extra.multadd
            end
            triggered = true
          end

          -- Visual notification over the card being upgraded
          if triggered then
            card_eval_status_text(scoring_card, 'extra', nil, nil, nil, { message = "Upgrade!", colour = G.C.Mult })
            card:juice_up()
          end
        end
      end
    end

    -- scoring logic
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end,

  abn_artist_credits = {
    artist = "Samuran",
  },
}
