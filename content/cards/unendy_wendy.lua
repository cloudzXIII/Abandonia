SMODS.Joker {
  key = 'unendy_wendy',

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.repetitions } }
  end,

  rarity = 3,
  atlas = 'ABNJokerSheet1',
  pos = { x = 4, y = 0 },
  cost = 9,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { repetitions = 1 } },
  
  update = function(self, card)
    -- Only run logic if the card is in the Joker slots
    if card.area == G.jokers then
		for _, card in ipairs(G.playing_cards) do
			if card:is_face() then
				card:set_debuff(true)
            end
        end
	end
  end,
  
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and ABN.is_number(context.other_card) then
      return {
        repetitions = card.ability.extra.repetitions
      }
    end
  end,
  abn_artist_credits = {
    artist = "Firch",
  },
}
