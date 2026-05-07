SMODS.Joker {
  key = 'enchanted_night',
  rarity = 2,
  atlas = 'ABNJokerSheet8',
  pos = { x = 4, y = 0 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  
  in_pool = function(self)
    if not G.playing_cards then return false end
    local count = 0
    for _, card in ipairs(G.playing_cards) do
      if ABN.is_dark(card) and card.edition then
        return true
      end
    end
    return false
  end,

  calculate = function(self, card, context)
	if context.repetition and context.cardarea == G.play then
		if context.other_card and ABN.is_dark(context.other_card) and context.other_card.edition then
			return {
                message = localize('k_again_ex'),
                repetitions = 1,
				card = card
            }
		end
	end
  end,

  abn_artist_credits = {
    artist = "Gud",
  },
}
