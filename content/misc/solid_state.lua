-- Solid State Consumables (coded by cloudzXIII + EricTheToon)
SMODS.ConsumableType {
  key = "solid_state",
  primary_colour = HEX("709795"),
  secondary_colour = HEX("709795"),
  collection_rows = { 5, 5 },
  shop_rate = 0,
}

ABN.SolidState = SMODS.Consumable:extend({
  set = 'solid_state',
  cost = 4,
  atlas = "abn_AbandoniaSolidState",
  pos = { x = 0, y = 0 },
})

ABN.SolidState {
  key = "paste",
  pos = { x = 0, y = 0 },
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_fragile", set = "Other", vars = { 1, 4 } }
  end,
  
  can_use = function(self, card)
    return G.jokers and #G.jokers.highlighted == 1 and #G.jokers.cards < G.jokers.config.card_limit
  end,

  use = function(self, card, area, copier)
    local selected = G.jokers.highlighted[1]

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        local copy = copy_card(selected, nil, nil, nil, selected.edition)
        copy:add_to_deck()
        G.jokers:emplace(copy)
        copy:start_materialize()
        play_sound('card1', 1.2, 1.2)
        
        for _, joker in ipairs(G.jokers.cards) do
          if joker ~= selected and joker ~= copy then
            joker:add_sticker("abn_fragile", true)
            joker:juice_up(0.3, 0.3) 
          end
        end

        return true
      end
    }))
    delay(0.5)
    G.jokers:unhighlight_all()
  end,

  abn_artist_credits = {
    artist = "Feli"
  },
}

ABN.SolidState {
  key = "power",
  pos = { x = 1, y = 0 },
  hidden = true,
  soul_set = "Planet",
  soul_rate = 0.005,
  
  can_use = function(self, card)
    local max_level = 1
    if G.GAME and G.GAME.hands then
      for _, hand_data in pairs(G.GAME.hands) do
        if hand_data.level > max_level then
          max_level = hand_data.level
        end
      end
    end
    return max_level > 1
  end,

  use = function(self, card, area, copier)
    -- Get levels 
    local max_level = 1
    if G.GAME and G.GAME.hands then
      for _, hand_data in pairs(G.GAME.hands) do
        if hand_data.level and hand_data.level > max_level then
          max_level = hand_data.level
        end
      end
    end

    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
      { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
    
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = true
        return true
      end
    }))

    update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
    
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.9,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        return true
      end
    }))

    update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
    
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.9,
      func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = nil
        return true
      end
    }))

    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '-> '..max_level })
    delay(1.3)

    if G.GAME and G.GAME.hands then
      for hand_name, hand_data in pairs(G.GAME.hands) do
        local current_level = hand_data.level or 1
        local level_diff = max_level - current_level
        
        if level_diff > 0 then
          hand_data.level = max_level
          hand_data.mult = hand_data.mult + hand_data.l_mult * level_diff
          hand_data.chips = hand_data.chips + hand_data.l_chips * level_diff
        end
      end
    end

    update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
      { mult = 0, chips = 0, handname = '', level = '' })
  end,

  abn_artist_credits = {
    artist = "Feli" 
  },
}

ABN.SolidState {
  key = "hotspot",
  pos = { x = 2, y = 0 },
  
  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 then
      return true
    end
    return false
  end,

  use = function(self, card, area, copier)
	G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    local target_card = G.hand.highlighted[1]
    local target_rank_key = target_card.base.value

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        if card then card:juice_up(0.3, 0.5) end
        return true
      end
    }))

    if G.hand and G.hand.cards then
      for i = 1, #G.hand.cards do
        local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
        local hand_card = G.hand.cards[i]
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            hand_card:flip()
            play_sound('card1', percent)
            hand_card:juice_up(0.3, 0.3)
            return true
          end
        }))
      end
    end

    delay(0.2)

    if G.hand and G.hand.cards then
      for i = 1, #G.hand.cards do
        local hand_card = G.hand.cards[i]
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.1,
          func = function()
            local full_suit = hand_card.base.suit
            local lookup_key = ""
            local rank_obj = SMODS.Ranks[target_rank_key]
            
            if rank_obj and rank_obj.key and not rank_obj.modName then
              local suit_prefix = string.sub(full_suit, 1, 1)
              local rank_shorthand = target_rank_key
              if target_rank_key == 'Ace' then rank_shorthand = 'A'
              elseif target_rank_key == 'King' then rank_shorthand = 'K'
              elseif target_rank_key == 'Queen' then rank_shorthand = 'Q'
              elseif target_rank_key == 'Jack' then rank_shorthand = 'J'
              elseif target_rank_key == '10' then rank_shorthand = 'T'
              end
              lookup_key = suit_prefix .. '_' .. rank_shorthand
            else
              lookup_key = full_suit .. '_' .. target_rank_key
            end
            
            if G.P_CARDS[lookup_key] then
              hand_card:set_base(G.P_CARDS[lookup_key])
            else
              local fallback_key = string.sub(full_suit, 1, 1) .. '_' .. target_rank_key
              if G.P_CARDS[fallback_key] then
                hand_card:set_base(G.P_CARDS[fallback_key])
              end
            end
            return true
          end
        }))
      end
    end

    if G.hand and G.hand.cards then
      for i = 1, #G.hand.cards do
        local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
        local hand_card = G.hand.cards[i]
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.15,
          func = function()
            hand_card:flip()
            play_sound('tarot2', percent, 0.6)
            hand_card:juice_up(0.3, 0.3)
            return true
          end
        }))
      end
    end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.hand:unhighlight_all()
        return true
      end
    }))
    delay(0.5)
  end,

  abn_artist_credits = {
    artist = "Feli" 
  },
}

ABN.SolidState {
  key = 'bookmark',
  pos = { x = 3, y = 0 }, 
  config = { max_highlighted = 1 },

  can_use = function(self, card)
    if G.hand and G.hand.highlighted and #G.hand.highlighted == 1 then
      local target = G.hand.highlighted[1]
      if target:is_face() then
        return true
      end
    end
    return false
  end,

  use = function(self, card, area, copier)
    local target_card = G.hand.highlighted[1]


    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        if card then card:juice_up(0.3, 0.5) end
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        target_card:start_dissolve()
        return true
      end
    }))


    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        local target_ranks = { ['abn_11'] = true, ['abn_12'] = true, ['abn_13'] = true, ['abn_14'] = true }
        local valid_pool = {}

        for _, card_def in pairs(G.P_CARDS) do
          if card_def.value and target_ranks[card_def.value] then
            table.insert(valid_pool, card_def)
          end
        end

        if #valid_pool == 0 then
          for _, card_def in pairs(G.P_CARDS) do
            table.insert(valid_pool, card_def)
          end
        end

        for i = 1, 3 do
          local chosen_front = pseudorandom_element(valid_pool, pseudoseed('bookmark_pool'))

          if chosen_front then
            local new_card = create_playing_card(
              {
                front = chosen_front,
                center = G.P_CENTERS.c_base
              },
              G.hand
            )

            new_card:set_seal(SMODS.poll_seal({key = 'bookmark', guaranteed = true}), true)
          end
        end

        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.hand:unhighlight_all()
        return true
      end
    }))
    delay(0.5)
  end,

  abn_artist_credits = {
    artist = "Feli" 
  },
}

ABN.SolidState {
  key = "translate",
  pos = { x = 4, y = 0 },

  can_use = function(self, card)
    return G.jokers and #G.jokers.cards > 0
  end,

  use = function(self, card, area, copier)

    local jokers_to_reroll = {}
    for _, j in ipairs(G.jokers.cards) do
      table.insert(jokers_to_reroll, j)
    end


    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        for _, j in ipairs(jokers_to_reroll) do
          j:flip()
          j:juice_up(0.3, 0.3)
        end
        play_sound('card1', 1)
        return true
      end
    }))


    G.E_MANAGER:add_event(Event({
      func = function()
        for _, j in ipairs(jokers_to_reroll) do

          local current_rarity = ABN.get_rarity(j)
          local pool = SMODS.get_clean_pool("Joker", current_rarity, false)
          local new_key = pseudorandom_element(pool, "abn_digitization")
          

          j:set_ability(G.P_CENTERS[new_key])
          

          local new_edition = poll_edition('abn_edition_reroll', nil, false, true)
          j:set_edition(new_edition, true, true)
        end
        return true
      end
    }))


    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        for _, j in ipairs(jokers_to_reroll) do
          j:flip()
          j:juice_up(0.3, 0.3)
        end
        play_sound('tarot2', 1, 0.6)
        return true
      end
    }))
  end,
  abn_artist_credits = {
    artist = "Feli"
  },
}

function ABN.get_rarity(card)
  if not card then return end

  local rarity = card.config.center.rarity

  if rarity then
    local rarities = { "Common", "Uncommon", "Rare", "Legendary" }
    if type(rarity) == "number" then
      return rarities[rarity]
    end
    return rarity
  end

  return "Common"
end

ABN.SolidState {
  key = "digitization",
  pos = { x = 5, y = 0 },
  config = { max_highlighted = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_digitization_upgrades", set = "Other" }
  end,

  can_use = function(self, card)
    local digitization_upgrades = {
      Common = "Uncommon",
      Uncommon = "Rare",
      Rare = "abn_SuperRare",
      Legendary = "abn_ParallelRare"
    }

    return G.jokers and #G.jokers.highlighted == 1 and digitization_upgrades[ABN.get_rarity(G.jokers.highlighted[1])]
  end,
  use = function(self, card, area, copier)
    local selected = G.jokers.highlighted[1]

    local digitization_upgrades = {
      Common = "Uncommon",
      Uncommon = "Rare",
      Rare = "abn_SuperRare",
      Legendary = "abn_ParallelRare"
    }

    local upper_rarity = digitization_upgrades[ABN.get_rarity(selected)]

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        selected:flip()
        play_sound('card1', 1)
        selected:juice_up(0.3, 0.3)
        return true
      end
    }))

    local pool = SMODS.get_clean_pool("Joker", upper_rarity, false)
    local new_key = pseudorandom_element(pool, "abn_digitization")
    G.E_MANAGER:add_event(Event({
      func = function()
        selected:set_ability(G.P_CENTERS[new_key])
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        selected:flip()
        play_sound('tarot2', 1, 0.6)
        selected:juice_up(0.3, 0.3)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('timpani')
        if G.GAME.dollars ~= -10 then
          ease_dollars(-(G.GAME.dollars + 10), true)
        end
        return true
      end
    }))

    delay(0.5)
    G.jokers:unhighlight_all()
  end,
  abn_artist_credits = {
    artist = "Muddz"
  },
}

ABN.SolidState {
  key = "incognito",
  pos = { x = 0, y = 1 },
  
  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    info_queue[#info_queue + 1] = G.P_SEALS.abn_brown
  end,
  
  can_use = function(self, card)
    return G.hand and #G.hand.cards > 0
  end,

  use = function(self, card, area, copier)
    for i = 1, #G.hand.cards do
      local target_card = G.hand.cards[i]

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          target_card:set_seal('abn_brown', true)
          
          if not target_card.ability.abn_perma_flipped then
            if target_card.facing == 'front' then
              target_card:flip()
            end
            target_card.ability.abn_perma_flipped = true
          end

          play_sound('tarot2', 1, 0.6)
          target_card:juice_up(0.3, 0.3)
          return true
        end
      }))
    end

    delay(0.5)
  end,

  abn_artist_credits = {
    artist = "Muddz"
  },
}

ABN.SolidState {
  key = "upload",
  pos = { x = 1, y = 1 }, 

  can_use = function(self, card)
    return G.jokers and G.jokers.cards[1] and #G.consumeables.cards < G.consumeables.config.card_limit
  end,

  use = function(self, card, area, copier)
    local target_joker = G.jokers.cards[1]

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        play_sound('card1', 1)
        target_joker:juice_up(0.3, 0.3)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.jokers:remove_card(target_joker)
        
        G.consumeables:emplace(target_joker)
		
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
        
        return true
      end
    }))

    delay(0.5)
  end,

  abn_artist_credits = {
    artist = "Muddz"
  },
}

ABN.SolidState {
  key = "brightness",
  pos = { x = 1, y = 2 }, 

  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
	info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_bright
	return { vars = {} }
  end,

  can_use = function(self, card)
    return #G.hand.cards > 0 
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        play_sound('card1', 1)
        card:juice_up(0.3, 0.3)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local destroyed_cards = {}

        for i = #G.hand.cards, 1, -1 do
          local target_card = G.hand.cards[i]
          
          if ABN.is_light(target_card) then
            target_card:set_edition({ abn_bright = true }, true)
            target_card:juice_up(0.3, 0.3)
		  end
          if ABN.is_dark(target_card) then
            table.insert(destroyed_cards, target_card)
          end
        end

        if #destroyed_cards > 0 then
          for _, c in ipairs(destroyed_cards) do
            c:start_dissolve()
          end
        end

        return true
      end
    }))

    delay(0.5)
  end,

  abn_artist_credits = {
    artist = "Muddz"
  },
}

ABN.SolidState {
  key = "dark_web",
  pos = { x = 0, y = 2 }, 

  loc_vars = function(self, info_queue, card)
	info_queue[#info_queue + 1] = { key = "abn_light_suit", set = "Other" }
	info_queue[#info_queue + 1] = { key = "abn_dark_suit", set = "Other" }
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_dark
	return { vars = {} }
  end,

  can_use = function(self, card)
    return #G.hand.cards > 0 
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.15,
      func = function()
        play_sound('card1', 1)
        card:juice_up(0.3, 0.3)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local destroyed_cards = {}

        for i = #G.hand.cards, 1, -1 do
          local target_card = G.hand.cards[i]
          
          if ABN.is_dark(target_card) then
            target_card:set_edition({ abn_dark = true }, true)
            target_card:juice_up(0.3, 0.3)
		  end
          if ABN.is_light(target_card) then
            table.insert(destroyed_cards, target_card)
          end
        end

        if #destroyed_cards > 0 then
          for _, c in ipairs(destroyed_cards) do
            c:start_dissolve()
          end
        end

        return true
      end
    }))

    delay(0.5)
  end,

  abn_artist_credits = {
    artist = "Muddz"
  },
}

local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)

    -- Detect clicks on Collection items during the Solid State process
    local target = G.CONTROLLER.hovering.target
    if G.GAME.dark_web_active and target and target.config and love.mouse.isDown(1) then
        
        -- Verify the player clicked a valid, discovered Joker card
        if target.config.center and target.config.center.set == 'Joker' and target.config.center.discovered then
            local rarity = target.config.center.rarity
            local card_key = target.config.center.key
            local allowed_rarity = G.GAME.dark_web_active.allowed_rarity
            
            -- Enforce that the clicked card exactly matches the rarity tier of the destroyed Joker
            if rarity == allowed_rarity then
                
                -- Spawn the chosen Joker directly into your joker slots
                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, card_key)
                card:add_to_deck()
                G.jokers:emplace(card)
                
                -- Clear tracker data and close out the collection panel safely
                G.GAME.dark_web_active = nil
                G.FUNCS.exit_overlay_menu()
            end
        end
    end
end

ABN.SolidState {
  key = "database",
  pos = { x = 4, y = 1 }, 

  can_use = function(self, card)
    return G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 1 
  end,

  use = function(self, card, area, copier)
    local target_joker = G.jokers.highlighted[1]
    
    if target_joker then
      local target_rarity = target_joker.config.center.rarity

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
          play_sound('card1', 1)
          card:juice_up(0.3, 0.3)
          return true
        end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
          target_joker:juice_up(0.3, 0.3)
          target_joker:start_dissolve()


          G.GAME.dark_web_active = {
            allowed_rarity = target_rarity
          }
          

          G.FUNCS.overlay_menu({
            definition = create_UIBox_your_collection_jokers(),
          })

          return true
        end
      }))
    end

    delay(0.5)
  end,

  abn_artist_credits = {
    artist = "La Ginger & Gfs"
  },
}