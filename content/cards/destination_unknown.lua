SMODS.Joker {
  key = 'destination_unknown',
  rarity = 2,
  atlas = 'ABNJokerSheet3',
  pos = { x = 3, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  unlocked = true,
  config = { 
    extra = { 
      xchips = 1,
      chips = 0, 
      xchipsadd = 0.1,
      chipsadd = 10,
    } 
  }, 

  loc_vars = function(self, info_queue, card)
    return { 
      vars = {  
        card.ability.extra.xchips, 
        card.ability.extra.chips, 
        card.ability.extra.chipsadd,
        card.ability.extra.xchipsadd, -- Maps to #4# in your localization file
      } 
    }
  end,

  -- Only allow this Joker to appear if at least one rank is completely gone from the deck
  in_pool = function(self, args)
    if not G.playing_cards then return false end
    
    local ranks_in_deck = {}
    for _, playing_card in ipairs(G.playing_cards) do
      if playing_card.base and playing_card.base.value then
        ranks_in_deck[playing_card.base.value] = true
      end
    end

    local standard_ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
    for _, rank in ipairs(standard_ranks) do
      if not ranks_in_deck[rank] then
        return true -- Found a missing rank, it's safe to put in the pool immediately
      end
    end

    return false
  end,

  calculate = function(self, card, context) 
    -- When selecting blind
    if context.setting_blind and not context.blueprint then
      local ranks_in_deck = {}
      for _, playing_card in ipairs(G.playing_cards) do
        if playing_card.base and playing_card.base.value then
          ranks_in_deck[playing_card.base.value] = true
        end
      end

      local missing_count = 0
      local standard_ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
      
      for _, rank in ipairs(standard_ranks) do
        if not ranks_in_deck[rank] then
          missing_count = missing_count + 1
        end
      end

      if missing_count > 0 then
        -- Upgrade the regular chips
        card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chipsadd * missing_count)
        
        -- Also upgrade XChips if the special edition matches
        if card.edition and card.edition.abn_abandond then
          card.ability.extra.xchips = card.ability.extra.xchips + (card.ability.extra.xchipsadd * missing_count)
        end

        return {
          message = localize('k_upgrade_ex'), -- display upgrade
          colour = G.C.CHIPS,
          card = card
        }
      end
    end

    -- Scoring
    if context.joker_main then
      return {
        xchips = card.ability.extra.xchips,
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end, 

  abn_artist_credits = {
    artist = "lilboyaka",
  },
}