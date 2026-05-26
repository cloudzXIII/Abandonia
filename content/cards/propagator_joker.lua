SMODS.Joker {
  key = 'propagator_joker',

  set_badges = function(self, card, badges)
    badges[#badges + 1] = create_badge(localize("k_abn_plagued"), G.C.BLACK, G.C.WHITE, 1.0)
  end,

  rarity = "abn_VirusRare",
  atlas = 'ABNJokerSheet12',
  pos = { x = 5, y = 2 },
  soul_pos = { x = 6, y = 2 },
  cost = 25,
  discovered = false,
  blueprint_compat = true,
  config = { extra = { odds = 4, emult = 2.0 } },
  pools = { ["Plagued"] = true, },
  
  loc_vars = function(self, info_queue, card)
    return { 
      vars = { 
        G.GAME.probabilities.normal, 
        card.ability.extra.odds, 
        card.ability.extra.emult 
      } 
    }
  end,
  
  -- only available on jimbo stakes
  in_pool = function(self)
    return G.GAME.modifiers.Toxic or G.GAME.modifiers.Menacing or G.GAME.modifiers.Honor
  end,

  calculate = function(self, card, context)
    -- Scoring Logic ^2.0 Mult per card that shares the same rank and suit
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      local matching_cards = 0

      -- Count how many scoring cards match BOTH rank and suit of the current card
      for k, v in ipairs(context.scoring_hand) do
        if v:get_id() == target_card:get_id() and v:is_suit(target_card.base.suit) then
          matching_cards = matching_cards + 1
        end
      end

      if matching_cards > 0 then
        local total_emult = card.ability.extra.emult * matching_cards
        return {
          emult = total_emult,
          card = card
        }
      end
    end

    -- Dupe Logic 1/4
    if context.before and not context.blueprint then
      if SMODS.pseudorandom_probability(card, 'propagator', 1, card.ability.extra.odds) then   
        -- Get first card
        if context.scoring_hand and context.scoring_hand[1] then
          local first_card = context.scoring_hand[1]
          
          local clone = copy_card(first_card, nil, nil, G.playing_card)
          clone:add_to_deck()
          G.deck.config.card_limit = G.deck.config.card_limit + 1
          table.insert(G.playing_cards, clone)
          G.hand:emplace(clone)
          return nil
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Da Gorbage Rat",
  },
}