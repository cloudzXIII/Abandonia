SMODS.Joker {
  key = 'patient_zero',
  rarity = 2,
  atlas = 'ABNJokerSheet4',
  pos = { x = 6, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_beneficial_sticker_info", set = "Other" }
  end,

  set_ability = function(self, card, initial)
    card:add_sticker("abn_immortal", true)
  end,

  in_pool = function(self)
    -- Ensure G.jokers exists (prevents errors on the main menu/loading)
    if G.jokers and G.jokers.cards then
      for _, joker in ipairs(G.jokers.cards) do
        -- Check all registered Stickers
        for k, v in pairs(SMODS.Stickers) do
          -- If the Joker has the ability key corresponding to the sticker
          if joker.ability[k] then
            return true
          end
        end
      end
    end
    -- If no stickers are found on any Jokers, it won't appear in the pool
    return false
  end,

  calculate = function(self, card, context)
    -- Trigger this at blind selection
    if context.setting_blind then
      local rightmost_joker = G.jokers.cards[#G.jokers.cards]

      -- Check if a rightmost joker exists
      if rightmost_joker then
        -- Get all positive stickers
        local abn_stickers = ABN.get_positive_stickers()

        -- Select a random sticker key from the list
        local chosen_sticker = pseudorandom_element(abn_stickers, pseudoseed('patient_zero'))

        -- Apply the random sticker
        rightmost_joker:add_sticker(chosen_sticker, true)
        rightmost_joker:juice_up()

        -- Visual/Sound feedback
        return {
          message = 'Infected!',
          colour = G.C.MULT,
          card = rightmost_joker,
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Scorionik",
  },
}
