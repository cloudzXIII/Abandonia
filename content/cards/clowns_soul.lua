local start_run_ref = Game.start_run
function Game:start_run(args)
    start_run_ref(self, args)
	G.jokers.config.highlighted_limit = 9999
	G.consumeables.config.highlighted_limit = 9999
end

SMODS.Joker {
  key = 'clowns_soul',
  rarity = 3,
  atlas = 'ABNJokerSheet11',
  pos = { x = 7, y = 4 },
  cost = 10,
  discovered = false,
  blueprint_compat = false,
  config = { extra = { dollars = 20, } },

  abn_use_config = { colour = G.C.RED, text = "REROLL" },
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars } }
  end,
  
  can_use = function(self, card)
    if G.jokers and G.jokers.highlighted and #G.jokers.highlighted > 0 then
      local valid_targets = 0
      for i = 1, #G.jokers.highlighted do
        if G.jokers.highlighted[i] ~= card then
          valid_targets = valid_targets + 1
        end
      end
      return valid_targets == 1 and G.GAME.dollars >= card.ability.extra.dollars
    end
    return false
  end,
  
  use = function(self, card)
    ease_dollars(-card.ability.extra.dollars)
    
    local targets = {}
    for i = 1, #G.jokers.highlighted do
      local j = G.jokers.highlighted[i]
      if j ~= card then
        table.insert(targets, j)
      end
    end
    
    for k, v in ipairs(G.jokers.highlighted) do
        v.highlighted = false
    end
    G.jokers.highlighted = {}
    
    for _, target_joker in ipairs(targets) do
      local saved_edition = nil
      if target_joker.edition then
        saved_edition = copy_table(target_joker.edition)
      end
      
      -- Sticker saving
      local saved_stickers = {}
      for _, sticker in ipairs(SMODS.Sticker.obj_buffer) do
        if target_joker.ability[sticker] then
          -- Save sticker state (handles count/tally for things like perishable)
          saved_stickers[sticker] = {
            val = target_joker.ability[sticker],
            perish_tally = target_joker.ability.perish_tally
          }

        end
      end
      
      local saved_seal = target_joker.seal
      
      G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          target_joker:juice_up(0.5, 0.5)
          
          local replacement = create_card('Joker', G.jokers, false, nil, nil, nil, nil, "mno")
          
          -- Find exactly where the old joker lived in the layout
          local idx = 1
          for i, j in ipairs(G.jokers.cards) do
            if j == target_joker then idx = i; break end
          end
          
          target_joker:remove()
          
          if saved_edition then
            replacement:set_edition(saved_edition, true, true)
          end
          
          if saved_seal then
            replacement:set_seal(saved_seal, true, true)
          end
          
          -- Re-apply saved stickers using SMODS API
          for sticker_key, sticker_data in pairs(saved_stickers) do
            replacement:add_sticker(sticker_key, true)
            -- Preserve data parameters like remaining rounds for Perishable
            if sticker_key == 'perishable' and sticker_data.perish_tally then
              replacement.ability.perish_tally = sticker_data.perish_tally
            end
          end

          replacement:add_to_deck()
          G.jokers:emplace(replacement)
          
          -- Swap positions inside G.jokers.cards so it slots perfectly into the old index
          local current_idx = #G.jokers.cards
          if current_idx ~= idx then
             local temp = G.jokers.cards[idx]
             G.jokers.cards[idx] = G.jokers.cards[current_idx]
             G.jokers.cards[current_idx] = temp
          end
          
          G.jokers:set_ranks()
          replacement:juice_up(0.6, 0.6)
          return true
        end
      }))
    end
  end,
  
  abn_artist_credits = {
    artist = "Flote"
  },
}