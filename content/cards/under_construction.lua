local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)

    -- Detect clicks on Collection items during Under Construction sequence
    local target = G.CONTROLLER.hovering.target
    if G.GAME.under_construction_active and target and target.config and love.mouse.isDown(1) then
        
        -- Process selection if player clicks a valid Joker card center
        if target.config.center and target.config.center.set == 'Joker' and target.config.center.discovered then
            local rarity = target.config.center.rarity
            local card_key = target.config.center.key
            
            -- restrict choice to Common, Uncommon, and Rare AND block it from choosing itself
            if (rarity == 1 or rarity == 2 or rarity == 3) and card_key ~= 'j_abn_under_construction' then
                
                -- Spawn the chosen Joker
                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, card_key)
                card:add_to_deck()
                G.jokers:emplace(card)
                
                -- Reset tracker state and cleanly dismiss the collection menu
                G.GAME.under_construction_active = nil
                G.FUNCS.exit_overlay_menu()
            end
        end
    end
end


SMODS.Joker {
  key = 'under_construction',
  rarity = 3,
  atlas = 'ABNJokerSheet10',
  pos = { x = 9, y = 1 },
  cost = 6,
  discovered = false,
  blueprint_compat = false,
  unlocked = true,
  config = { 
    extra = { 
      active = 0,
    } 
  }, 

  calculate = function(self, card, context) 
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.blind.boss then
      card.ability.extra.active = 1
      if card.ability.extra.active == 1 then
        local eval = function(card) return not card.REMOVED end
        juice_card_until(card, eval, true)
      end
    end
    
    if context.selling_self and card.ability.extra.active == 1 then
      -- Set our dedicated separate system tracker flag
      G.GAME.under_construction_active = true
      
      G.FUNCS.overlay_menu({
        definition = create_UIBox_your_collection_jokers(),
      })
    end
  end, 

  abn_artist_credits = {
    artist = "CubeGetReal",
  },
}