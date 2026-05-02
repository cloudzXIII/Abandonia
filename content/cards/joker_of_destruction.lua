SMODS.Joker {
  key = 'joker_of_destruction',
  rarity = 3,
  atlas = 'ABNJokerSheet6',
  pos = { x = 2, y = 0 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = { triggered = 0 }
  },

  calculate = function(self, card, context)
    -- Jiggle on first hand
    if context.first_hand_drawn and not context.blueprint then
      card.ability.extra.triggered = 0
      local eval = function()
        return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES
      end
      juice_card_until(card, eval, true)
    end

    -- Trigger on first hand with exactly 4 cards
    if (context.destroy_card and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 and #context.full_hand == 4) or
    (context.destroy_card and context.cardarea == "unscored" and G.GAME.current_round.hands_played == 0 and #context.full_hand == 4) then
      if card.ability.extra.triggered == 0 then
        card.ability.extra.triggered = 1

        -- Define the set list of 3 items (replace with your actual item keys)
        local summon_pool = { 'c_soul', 'c_abn_body', 'c_abn_mind' }
        local chosen_key = pseudorandom_element(summon_pool, pseudoseed('destruction'))

        -- Create the specific card from the list
        SMODS.add_card { set = "Consumeables", key = chosen_key }

        card:juice_up()
      end

      return { remove = true }
    end
  end,

  abn_artist_credits = {
    artist = "Teserex",
  },
}
