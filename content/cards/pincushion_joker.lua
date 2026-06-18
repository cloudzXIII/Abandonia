local old_insert = SMODS.insert_repetitions

SMODS.insert_repetitions = function(repeat_table, value, source, tag)
    -- Check if this specific call is a Joker triggering a retrigger
    if tag == 'joker_retrigger' and value and value.repetitions and value.repetitions > 0 then
        -- Count the exact number of extra triggers this specific card is adding
        G.GAME.abn_JokerRetriggers = (G.GAME.abn_JokerRetriggers or 0) + value.repetitions
    end

    -- Call the original function to let Balatro do its normal behavior
    return old_insert(repeat_table, value, source, tag)
end


SMODS.Joker {
  key = 'pincushion_joker',
  rarity = 3, -- Rare
  atlas = 'ABNJokerSheet5', 
  pos = { x = 6, y = 0 },     
  cost = 10,
  discovered = false,
  blueprint_compat = false,

  config = {
    extra = {
      xmult = 1,
      xmultadd = 0.5,
	  starting_triggers = 0,
	  triggers = 0,
    },
  },
  
  loc_vars = function(self, info_queue, card)
	return {
		vars = {
			card.ability.extra.xmult,
			card.ability.extra.xmultadd,
        }
    }
  end,
  
  update = function(self, card)
    -- Only run logic if the card is in the Joker slots
    if card.area == G.jokers then
      if card.ability.extra.starting_triggers < (G.GAME.abn_JokerRetriggers or 0) then
		card.ability.extra.triggers = G.GAME.abn_JokerRetriggers - card.ability.extra.starting_triggers
	  end
	  card.ability.extra.xmult = 1 + (card.ability.extra.triggers * card.ability.extra.xmultadd)
    end
  end,
  
  add_to_deck = function(self, card)
	card.ability.extra.starting_triggers = G.GAME.abn_JokerRetriggers or 0
  end,

  calculate = function(self, card, context)
    if context.retrigger_joker_check and not context.retrigger_joker and context.other_card and context.other_card.config.center.key ~= card.config.center.key then
      
      local my_pos = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          my_pos = i
          break
        end
      end

      if my_pos and my_pos > 1 and G.jokers.cards[my_pos - 1] == context.other_card then
        return {
          message = localize('k_again_ex'),
          repetitions = 1,
          card = card
        }
      end
    end
	
    if context.final_scoring_step then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,

  abn_artist_credits = {
    artist = "ener",
  },
}