SMODS.Joker {
  key = 'weltschmerz_joker',
  rarity = 2, 
  atlas = 'ABNJokerSheet9', 
  pos = { x = 3, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,

  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = {} }
  end,
  
  in_pool = function(self, args)
    if G.playing_cards then
      for _, card in ipairs(G.playing_cards) do
        if card.base.suit == "abn_suitless" then
          return true
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local currentCard = context.other_card

      if currentCard and currentCard.base.suit == "abn_suitless" then
        if currentCard.facing == 'front' then
          currentCard:flip()
        end
        currentCard.ability.abn_perma_flipped = true

      end
    end

    if context.repetition and context.cardarea == G.play then
      local currentCard = context.other_card

      if currentCard and currentCard.base.suit == "abn_suitless" and currentCard.facing == 'back' then
        return {
          message = localize('k_again_ex'),
          repetitions = 1,
          card = card
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Lilboyaka",
  },
}