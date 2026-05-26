local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)

    -- Detect clicks on Collection items during Legends Remade sequence
    local target = G.CONTROLLER.hovering.target
    if G.GAME.legends_remade_active and target and target.config and love.mouse.isDown(1) then
        
        -- Process selection if player clicks a valid Joker card center
        if target.config.center and target.config.center.set == 'Joker' then
            local rarity = target.config.center.rarity
            local card_key = target.config.center.key
            
            -- Legendary only
            if rarity == 4 and target.config.center.discovered then
                
                -- Spawn the chosen Legendary Joker
                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, card_key)
                card:add_to_deck()
                G.jokers:emplace(card)
                
                -- Reset tracker state and cleanly dismiss the collection menu
                G.GAME.legends_remade_active = nil
                G.FUNCS.exit_overlay_menu()
            end
        end
    end
end

SMODS.Joker {
    key = 'legends_remade',
    rarity = 3, -- Rare
    atlas = 'ABNJokerCracked',
    pos = { x = 0, y = 0 }, 
    cost = 10,
    discovered = false,
    blueprint_compat = false, 
    unlocked = true,

    -- Only allows the card to appear if the player owns a Legendary Joker
    in_pool = function(self, args)
        if G.jokers and G.jokers.cards then
            for _, v in ipairs(G.jokers.cards) do
                if v.config.center.rarity == 4 then
                    return true
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context) 
        if context.selling_self and not context.blueprint then
            -- Verify they still own a Legendary at the exact moment of selling
            local has_legendary = false
            if G.jokers and G.jokers.cards then
                for _, v in ipairs(G.jokers.cards) do
                    -- Check rarity 4, making sure we don't count this card itself
                    if v.config.center.rarity == 4 and v ~= card then
                        has_legendary = true
                        break
                    end
                end
            end

            if has_legendary then
                -- Set our dedicated separate system tracker flag
                G.GAME.legends_remade_active = true
                
                -- Open up the Joker Collection Overlay
                G.FUNCS.overlay_menu({
                    definition = create_UIBox_your_collection_jokers(),
                })
            end
        end
    end, 

    abn_artist_credits = {
        artist = "Kars",
    },
}