SMODS.Joker {
  key = 'comedic_audience',
  rarity = 3,
  cost = 8,
  discovered = false,
  blueprint_compat = false,
  atlas = 'ABNJokerSheet8', 
  pos = { x = 6, y = 5 },
  
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      -- Target the leftmost Joker slot
      local target_joker = G.jokers.cards[1]
      
      if target_joker and not target_joker.getting_sliced and target_joker ~= card then
        local target_rarity = target_joker.config.center.rarity
        
        target_joker.getting_sliced = true
        target_joker:start_dissolve({G.C.RED})
        

        local next_rarity = nil
        
        if target_rarity == 3 then
          next_rarity = 'abn_SuperRare'     
        elseif target_rarity == 'abn_SuperRare' then
          next_rarity = 4 
        elseif target_rarity == 4 or target_rarity == 'legendary' then
          next_rarity = 'abn_ParallelRare'  
        else

          next_rarity = target_rarity 
        end

        -- Create and add the new Joker
        G.E_MANAGER:add_event(Event({
          func = function()
            local new_card = SMODS.create_card({
              set = 'Joker',
              area = G.jokers,
              rarity = next_rarity,
              legendary = (next_rarity == 4) 
            })
            if new_card then
              new_card:add_to_deck()
              G.jokers:emplace(new_card)
              new_card:start_materialize()
            end
            return true
          end
        }))
        
      end
    end
  end,

  abn_artist_credits = {
    artist = "Vega",
  },
}