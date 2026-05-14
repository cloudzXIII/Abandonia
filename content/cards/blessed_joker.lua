SMODS.Joker {
  key = 'blessed_joker',
  rarity = 3,
  atlas = 'ABNJokerSheet9',
  pos = { x = 7, y = 2 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,

  config = { extra = { dollars = 5 } },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS.abn_violet
    info_queue[#info_queue + 1] = G.P_SEALS.abn_brown
    info_queue[#info_queue + 1] = G.P_SEALS.Red
  end,
  
  in_pool = function(self)
    if not G.playing_cards then return false end
    for _, v in ipairs(G.playing_cards) do
      if v.edition and (v.edition.key == 'e_foil' or v.edition.key == 'e_polychrome') then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    -- Trigger for every card in the scoring hand individually
    if context.individual and context.cardarea == G.play then
      local target_card = context.other_card
      
      -- Proceed only if the card has an edition
      if target_card.edition then
        local ed_key = target_card.edition.key
        local seal_to_add = nil

        -- Determine which seal corresponds to the edition
        if ed_key == 'e_foil' then seal_to_add = 'abn_violet'
        elseif ed_key == 'e_holo' then seal_to_add = 'abn_brown'
        elseif ed_key == 'e_polychrome' then seal_to_add = 'Red'
        end

        -- If the card matches one of our target editions
        if seal_to_add then
          local is_first = false
          for i = 1, #context.scoring_hand do
            local sc = context.scoring_hand[i]
            -- Check if this is the first card in the hand with this specific edition
            if sc.edition and sc.edition.key == ed_key then
              is_first = (sc == target_card)
              break
            end
          end

          if is_first then
            target_card:set_seal(seal_to_add, true)
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Bunnet & Comykel",
  },
}