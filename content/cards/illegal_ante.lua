local old_ease_dollars = ease_dollars
function ease_dollars(mod, instant)
    mod = mod or 0
    -- double gained dollars if joker exists and the ante is odd
    if mod > 0 
       and next(SMODS.find_card("j_abn_illegal_ante")) 
       and G.GAME.round_resets.blind_ante 
       and G.GAME.round_resets.blind_ante % 2 == 1 then
        mod = mod * 2
    end
    
    old_ease_dollars(mod, instant)
end

SMODS.Joker {
  key = 'illegal_ante',
  rarity = 2,
  atlas = 'ABNJokerSheet11',
  pos = { x = 9, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { triggered = 0 } },
  
  add_to_deck = function(self, card)
	if G.GAME.round_resets.blind_ante % 2 ~= 1 then
		G.GAME.probabilities.normal = G.GAME.probabilities.normal * 2
		card.ability.extra.triggered = 1
	end
  end,

  remove_from_deck = function(self, card)
	if card.ability.extra.triggered == 1 then
		card.ability.extra.triggered = 0
		G.GAME.probabilities.normal = G.GAME.probabilities.normal / 2
	end
  end,
  
  calculate = function(self, card, context)   
	if context.end_of_round and context.main_eval and not context.blueprint and G.GAME.blind.boss and card.ability.extra.triggered == 1 then
		card.ability.extra.triggered = 0
		G.GAME.probabilities.normal = G.GAME.probabilities.normal / 2
	end
	
	if context.starting_shop and card.ability.extra.triggered == 0 and G.GAME.round_resets.blind_ante % 2 ~= 1 or context.setting_blind and card.ability.extra.triggered == 0 and G.GAME.round_resets.blind_ante % 2 ~= 1 then
		G.GAME.probabilities.normal = G.GAME.probabilities.normal * 2
		card.ability.extra.triggered = 1
	end
  end,
  
  abn_artist_credits = {
    artist = "Notextify"
  },
}