SMODS.Joker {
  key = 'health_stickers',
  rarity = 2,
  atlas = 'ABNJokerSheet8',
  pos = { x = 7, y = 2 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_beneficial_sticker_info", set = "Other" }
  end

  calculate = function(self, card, context)
    -- Trigger at end of round
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      -- Access the first card in the Jokers area (index 1)
      local leftmost_joker = G.jokers.cards[1]

      -- Check if a leftmost joker exists
      if leftmost_joker then
        -- Get all positive stickers
        local abn_stickers = ABN.get_positive_stickers()

        -- Select a random sticker key from the list
        local chosen_sticker = pseudorandom_element(abn_stickers, pseudoseed('health_stickers'))

        -- Apply the random sticker to the leftmost joker
        leftmost_joker:add_sticker(chosen_sticker, true)
        leftmost_joker:juice_up()
      end
    end
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}
