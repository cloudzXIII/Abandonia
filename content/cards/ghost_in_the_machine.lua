SMODS.Joker {
  key = 'ghost_in_the_machine',
  rarity = 3,
  atlas = 'ABNJokerSheet2',
  pos = { x = 6, y = 5 },
  cost = 8,
  discovered = false,
  blueprint_compat = true,
  unlocked = true,
  
  in_pool = function(self)
    if not (G.GAME and G.GAME.hands) then return false end

    local solid_state_card_used = false
    if G.GAME.consumeable_usage then
        for _, v in pairs(G.GAME.consumeable_usage) do
            if v.set == 'solid_state' then
                solid_state_card_used = true
                break 
            end
        end
    end

    return solid_state_card_used
  end,

  calculate = function(self, card, context) 
    -- If using a solid state card
    if context.using_consumeable and context.consumeable.ability.set == "solid_state" and not context.blueprint then
      
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.4,
            func = function()
                -- Generate a random Spectral card
                local spectral_card = SMODS.add_card({
                    set = 'Spectral',
                    area = G.consumeables,
                    key_append = 'ghost',
                    edition = {negative = true} 
                })
                return true
            end
        }))
    end
  end,

  abn_artist_credits = {
    artist = "Vlambambo",
  },
}