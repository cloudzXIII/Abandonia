local Card_set_debuff = Card.set_debuff
function Card:set_debuff(should_debuff)
    if self.edition then
        local runedelta_copies = SMODS.find_card('j_abn_runedelta_disc2')
        if next(runedelta_copies) then	
            for _, runedelta in ipairs(runedelta_copies) do
                if runedelta.edition then
                    self.debuff = false
                    return
                end
            end
        end
    end
    
    -- Fall back to default behavior if conditions aren't met
    Card_set_debuff(self, should_debuff)
end

SMODS.Joker {
  key = 'runedelta_disc2',
  rarity = 3, 
  atlas = 'ABNJokerSheet17',
  pos = { x = 6, y = 6 }, 
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  config = { 
    extra = { 
      xmult = 1, 
      xchips = 1, 
      xmult_add = 0.2, 
      xchips_add = 0.3
    } 
  },
  
  loc_vars = function(self, info_queue, card)
    return { 
      vars = { 
        card.ability.extra.xmult,     
        card.ability.extra.xchips,    
        card.ability.extra.xmult_add, 
        card.ability.extra.xchips_add,
      } 
    }
  end,

  calculate = function(self, card, context)

    if context.joker_main then
      return {
        x_mult = card.ability.extra.xmult,
        x_chips = card.ability.extra.xchips,
        card = card
      }
    end


    if context.cardarea == G.play and context.repetition and context.other_card and context.scoring_hand then
      local scoring_card = context.other_card
      
      if scoring_card:get_edition() then
        local first_even_card = nil
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i]:get_edition() and ABN.is_even(context.scoring_hand[i]) then
            first_even_card = context.scoring_hand[i]
            break
          end
        end


        local first_odd_card = nil
        for i = 1, #context.scoring_hand do
          if context.scoring_hand[i]:get_edition() and ABN.is_odd(context.scoring_hand[i]) then
            first_odd_card = context.scoring_hand[i]
            break
          end
        end


        local is_first_even = (first_even_card == scoring_card)
        local is_first_odd = (first_odd_card == scoring_card)

        if is_first_even or is_first_odd then
          local card_edition_key = nil
          for k, v in pairs(scoring_card:get_edition()) do
            if v then card_edition_key = k break end
          end

          if card_edition_key then
            local matching_joker_count = 0
            for i = 1, #G.jokers.cards do
              local joker = G.jokers.cards[i]
              local joker_edition = joker:get_edition()
              if joker_edition and joker_edition[card_edition_key] then
                matching_joker_count = matching_joker_count + 1
              end
            end

            if matching_joker_count > 0 then
              if is_first_even then
                if not context.blueprint then
                  card.ability.extra.xmult = card.ability.extra.xmult + (matching_joker_count * card.ability.extra.xmult_add)
                end
                return {
                  repetitions = matching_joker_count,
                  card = scoring_card
                }
              end

              if is_first_odd then
                if not context.blueprint then
                  card.ability.extra.xchips = card.ability.extra.xchips + (matching_joker_count * card.ability.extra.xchips_add)
                end
                return {
                  repetitions = matching_joker_count,
                  card = scoring_card
                }
              end
            end
          end
        end
      end
    end
  end,

  abn_artist_credits = {
    artist = "Comykel",
  },
}