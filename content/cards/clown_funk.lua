-- Rip destroyed joker tracking from fortlatro
local start_dissolve_original = Card.start_dissolve

function Card:start_dissolve(...)
    -- Only track if it's a Joker
    if self.config and self.config.center and self.config.center.set == "Joker" then
        
        -- Check if this joker has an edition
        if self.edition then
            -- Find all instances of j_abn_clown_funk on the board
            local clown_funks = SMODS.find_card('j_abn_clown_funk')
            for _, clown in ipairs(clown_funks) do
                -- If at least one Clown Funk has an edition, block destruction entirely
                if clown.edition then
                    return 
                end
            end
        end

        G.GAME.destroyed_jokers = G.GAME.destroyed_jokers or {}
        local key = self.config.center.key

        local already_added = false
        for _, stored_key in ipairs(G.GAME.destroyed_jokers) do
            if stored_key == key then
                already_added = true
                break
            end
        end

        if not already_added then
            table.insert(G.GAME.destroyed_jokers, key)
        end
    end

    -- Call original method
    return start_dissolve_original(self, ...)
end



SMODS.Joker {
  key = 'clown_funk',
  rarity = 3,
  atlas = 'ABNJokerSheet14',
  pos = { x = 0, y = 4 },
  cost = 10,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_gloss
	info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_pearlescent
	info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_iridescent
	info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_chromatic
  end,
  
  in_pool = function(self, args)
    if G.jokers and G.jokers.cards then
      for _, j in ipairs(G.jokers.cards) do
        if j.edition then
          return true
        end
      end
    end
    return false
  end,
  
  
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and G.GAME.current_round.hands_played == 0 then
      local leftmost_joker = G.jokers.cards[1]
      
      if leftmost_joker then
        -- Flush hearts
        if context.scoring_name == "Flush" then
          local all_hearts = true
          for i, v in ipairs(context.scoring_hand) do
            if not v:is_suit("Hearts") then all_hearts = false break end
          end
          if all_hearts then
            leftmost_joker:set_edition({abn_gloss = true}, true)
          end
        end

        -- Straight spades
        if context.scoring_name == "Straight" then
          local all_spades = true
          for i, v in ipairs(context.scoring_hand) do
            if not v:is_suit("Spades") then all_spades = false break end
          end
          if all_spades then
            leftmost_joker:set_edition({abn_pearlescent = true}, true)
          end
        end

        -- Full House diamonds
        if context.scoring_name == "Full House" then
          local all_diamonds = true
          for i, v in ipairs(context.scoring_hand) do
            if not v:is_suit("Diamonds") then all_diamonds = false break end
          end
          if all_diamonds then
            leftmost_joker:set_edition({abn_iridescent = true}, true)
          end
        end

        -- 5 of a kind clubs
        if context.scoring_name == "Five of a Kind" then
          local all_clubs = true
          for i, v in ipairs(context.scoring_hand) do
            if not v:is_suit("Clubs") then all_clubs = false break end
          end
          if all_clubs then
            leftmost_joker:set_edition({abn_chromatic = true}, true)
          end
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "Comykel",
  },
}
