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
    local edition = false
    local has_spanish = false
    local spanish_suits = {
      abn_Chalice = 0,
      abn_Coin = 0,
      abn_Baton = 0,
      abn_Sword = 0,
    }

    if G.jokers then
      for _, j in ipairs(G.jokers.cards or {}) do
        if j.edition then
          edition = true
        end
      end
    end
    if G.playing_cards then
      for _, playing in ipairs(G.playing_cards or {}) do
        if spanish_suits[playing.base.suit] and not SMODS.has_no_suit(playing) then
          spanish_suits[playing.base.suit] = spanish_suits[playing.base.suit] + 1
        end
      end
    end

    for _, count in pairs(spanish_suits) do
      if count >= 5 then
        has_spanish = true
      end
    end


    return edition and has_spanish
  end,


  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and G.GAME.current_round.hands_played == 0 then
      local leftmost_joker = G.jokers.cards[1]

      if leftmost_joker then
        -- Flush of Chalices
        if context.scoring_name == "Flush" then
          local all_chalices = true
          for i, v in ipairs(context.scoring_hand) do
            if not v:is_suit("abn_Chalice") then
              all_chalices = false
              break
            end
          end
          if all_chalices then
            leftmost_joker:set_edition({ abn_gloss = true }, true)
          end
        end

        -- Straight of Coins
        if context.scoring_name == "Straight" then
          local all_coins = true
          for i, v in ipairs(context.scoring_hand) do
            if not v:is_suit("abn_Coin") then
              all_coins = false
              break
            end
          end
          if all_coins then
            leftmost_joker:set_edition({ abn_pearlescent = true }, true)
          end
        end

        -- Full House of Diamonds
        if context.scoring_name == "Full House" then
          local all_batons = true
          for i, v in ipairs(context.scoring_hand) do
            if not v:is_suit("abn_Baton") then
              all_batons = false
              break
            end
          end
          if all_batons then
            leftmost_joker:set_edition({ abn_iridescent = true }, true)
          end
        end

        -- Five of a kind of Swords
        if context.scoring_name == "Five of a Kind" then
          local all_swords = true
          for i, v in ipairs(context.scoring_hand) do
            if not v:is_suit("abn_Sword") then
              all_swords = false
              break
            end
          end
          if all_swords then
            leftmost_joker:set_edition({ abn_chromatic = true }, true)
          end
        end
      end
    end
  end,
  abn_artist_credits = {
    artist = "Comykel",
  },
}
