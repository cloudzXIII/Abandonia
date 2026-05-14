
local start_dissolve_original = Card.start_dissolve

function Card:start_dissolve(dissolve_colours, silent)
    -- Check if the card being destroyed has a seal
    if self.seal and next(SMODS.find_card("j_abn_clown_degree")) then
        local saved_seal = self.seal
        local valid_targets = {}

        -- Gather all playing cards that DO NOT have a seal
        for k, v in ipairs(G.playing_cards) do
            if not v.seal then 
                table.insert(valid_targets, v)
            end
        end

        -- If we found eligible cards, pick one at random
        if #valid_targets > 0 then
            -- Use the 'generic' seed or create a specific one for your mod
            local target_card = valid_targets[pseudorandom('seal_move', 1, #valid_targets)] or valid_targets[math.random(#valid_targets)]
            
            -- Apply the saved seal to the new card
            target_card:set_seal(saved_seal, true)
            
            -- Visual feedback
            target_card:juice_up(0.3, 0.3)
        end
    end

    -- Call the original function
    return start_dissolve_original(self, dissolve_colours, silent)
end

SMODS.Joker {
  key = 'clown_degree',
  rarity = 2,
  atlas = 'ABNJokerSheet5',
  pos = { x = 3, y = 3 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  
  in_pool = function(self)
    if not G.playing_cards then return false end
    local seal_count = 0
    for _, card in ipairs(G.playing_cards) do
      if card.seal then
        seal_count = seal_count + 1
      end
      if seal_count >= 2 then return true end
    end
    return false
  end,

  abn_artist_credits = {
    artist = "Morphine Milkshake",
  },
}