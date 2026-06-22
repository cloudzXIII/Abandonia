local Card_set_debuff = Card.set_debuff
function Card:set_debuff(should_debuff)
  if self.config and self.config.center then
    
    if next(SMODS.find_card("j_abn_joker_in_a_nutshell")) then
      if self.config.center.set == "Joker" and self.config.center.rarity and self.config.center.rarity == 1 and not self.edition then                                                     
        self.debuff = false
        return
      end
    end

  end

  Card_set_debuff(self, should_debuff)
end

SMODS.Joker {
    key = 'joker_in_a_nutshell',
    rarity = 1,
    atlas = 'ABNJokerSheet17', 
    pos = { x = 4, y = 2 }, 
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    
	add_to_deck = function(self, card)
		G.GAME.uncommon_mod = 0
        G.GAME.rare_mod = 0
    end,
	
	remove_from_deck = function(self, card)
        G.GAME.uncommon_mod = 1
        G.GAME.rare_mod = 1
    end,

    abn_artist_credits = {
        artist = "D.J.",
    },
}