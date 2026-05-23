local card_set_cost_value_ref = Card.set_cost_value
function Card:set_cost_value(...) 
    local ret = card_set_cost_value_ref(self, ...)
    if next(SMODS.find_card("j_abn_color_anomia")) then
        if self.ability.set == 'program_pack' then
			self.cost = 0 
		end
    end
    return ret
end


local valid_hands = {
  ["abn_Spectrum"] = true,
  ["abn_Specflush"] = true,
  ["abn_Straight Specflush"] = true,
  ["abn_Specflush House"] = true,
  ["abn_Specflush Five"] = true,
  ["abn_Specflush Six"] = true
}

SMODS.Joker {
  key = 'color_anomia',
  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 2, y = 1 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  unlocked = true,
  config = { extra = { chips = 0, chipsadd = 10, } }, 

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chipsadd } }
  end,
  
  in_pool = function(self)
    if not (G.GAME and G.GAME.hands) then return false end
    
    -- Check if any Spectrum hand has been played
    local spectrum_played = false
    for hand_name, _ in pairs(valid_hands) do
        if G.GAME.hands[hand_name] and G.GAME.hands[hand_name].played > 0 then
            spectrum_played = true
            break
        end
    end

    -- Check if a program card has been used
    local program_card_used = false
    if G.GAME.consumeable_usage then
        for _, v in pairs(G.GAME.consumeable_usage) do
            if v.set == 'program_pack' then
                program_card_used = true
                break 
            end
        end
    end

    -- If all yes spawn
    return spectrum_played and program_card_used
  end,

  calculate = function(self, card, context) 
    -- If using a program card and has edition
    if context.using_consumeable and context.consumeable.ability.set == "program_pack" and card.edition then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS
        }
    end
    
    if context.cardarea == G.jokers and context.before then
      local base_hand = context.scoring_name
      
      -- If playing spectrum hand
      if valid_hands[base_hand] then
        
        -- and all scored cards are numbers
        local all_numbers = true
        if context.scoring_hand and #context.scoring_hand > 0 then
          for i = 1, #context.scoring_hand do
            local card_rank = context.scoring_hand[i].base.value
            

            local numeric_rank = tonumber(card_rank)
            if not numeric_rank or numeric_rank < 2 or numeric_rank > 10 then
              all_numbers = false
              break
            end
          end
        else
          all_numbers = false
        end

        -- level up the cards
        if all_numbers then
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Level Up!", colour = G.C.CHIPS })
          card:juice_up()

          for i = 1, #context.scoring_hand do
            local scoring_card = context.scoring_hand[i]
            local card_rank = scoring_card.base.value 

            if card_rank and G.GAME.abn_rank_upgrades[card_rank] then
              ABN.level_up_rank(scoring_card, card_rank, 1, false)
            end
          end
        end
      end 
    end 
	
	-- scoring
	if context.joker_main then
		return {
			chips = card.ability.extra.chips
		}
	end
  end,

  abn_artist_credits = {
    artist = "Triangle Snack",
  },
}