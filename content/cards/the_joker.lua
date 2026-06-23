SMODS.Joker {
  key = 'the_joker',
  rarity = "abn_ParallelRare",
  atlas = 'AbandoniaParallel',
  pos = { x = 6, y = 4 },
  soul_pos = { x = 7, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = true,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local currentCard = context.other_card
      if currentCard then
        local new_chips = G.GAME.blind.chips * 0.90
        
        if new_chips < 1 then 
          new_chips = 0 
        end

        G.GAME.blind.chips = new_chips
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

        currentCard:juice_up()

        return {
          extra = { message = "-10%!", colour = G.C.Mult },
          colour = G.C.Mult,
          card = currentCard
        }
      end
    end
  end,

  abn_artist_credits = {
    artist = "Tje.tsu"
  },
}