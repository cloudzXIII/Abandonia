SMODS.Joker {
  key = 'felix_joker',

  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 2, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,

  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then

      -- destroy non spectrals
      for i = #G.consumeables.cards, 1, -1 do
        local v = G.consumeables.cards[i]
        if v.config.center.set ~= 'Spectral' then
          v:start_dissolve()
		  -- create new spectrals
		  local new_card = create_card('Spectral', G.consumeables)
          new_card:add_to_deck()
		  G.consumeables:emplace(new_card)
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Littlesamu",
  },
}