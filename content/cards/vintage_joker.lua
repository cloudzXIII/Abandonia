local level_up_hand_ref = level_up_hand
function level_up_hand(card, hand, instant, amount)
  level_up_hand_ref(card, hand, instant, amount)

  if not G.GAME.vintage_joker_processing then
    local vintage_jokers = SMODS.find_card('j_abn_vintage_joker')
    local matching_joker = nil
    
    for _, joker in ipairs(vintage_jokers or {}) do
      if joker.edition and joker.edition.key == 'e_abn_vintage' then
        matching_joker = joker
        break
      end
    end

    if matching_joker then
      local eligible_hands = {}
      for hand_key, hand_data in pairs(G.GAME.hands) do
        if hand_key ~= hand and hand_data.visible then
          table.insert(eligible_hands, hand_key)
        end
      end

      if #eligible_hands > 0 then
        G.GAME.vintage_joker_processing = true
        local random_hand = pseudorandom_element(eligible_hands, pseudoseed('vintage_joker'))
        level_up_hand(matching_joker, random_hand, instant, amount)
        G.GAME.vintage_joker_processing = nil
      end
    end
  end
end


SMODS.Joker {
  key = 'vintage_joker',

  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet7',
  pos = { x = 3, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  config = { extra = {} },
  calculate = function(self, card, context)
    if context.before and G.GAME.current_round.hands_played == 0 then
      
      local standard_hands = {
        ["High Card"] = true,
        ["Pair"] = true,
        ["Two Pair"] = true,
        ["Three of a Kind"] = true,
        ["Straight"] = true,
        ["Flush"] = true,
        ["Full House"] = true,
        ["Four of a Kind"] = true,
        ["Straight Flush"] = true,
      }

      if standard_hands[context.scoring_name] then
        local valid_suits = true
        for _, played_card in ipairs(context.scoring_hand) do
          local is_vanilla = played_card:is_suit('Spades') 
                          or played_card:is_suit('Hearts') 
                          or played_card:is_suit('Clubs') 
                          or played_card:is_suit('Diamonds')
          if not is_vanilla then
            valid_suits = false
            break
          end
        end

        if valid_suits then
          return {
			level_up = true,
            message = localize('k_level_up_ex'),
            colour = G.C.ATTENTION
          }
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Creechie Doctrine",
  },
}