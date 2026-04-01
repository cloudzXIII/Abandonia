loc_colour()
G.C.CALAMITY = HEX("c39854")
G.C.CALAMITY_SECONDARY = HEX("c3a37a")
G.ARGS.LOC_COLOURS["abn_Calamity"] = G.C.CALAMITY

SMODS.ConsumableType {
  key = "calamity_cards",
  collection_rows = { 6, 6 },
  shop_rate = 0.0,
  primary_colour = G.C.CALAMITY,
  secondary_colour = G.C.CALAMITY_SECONDARY,
  loc_txt = {
    collection = "Calamity Cards",
    name = "Calamity",
    undiscovered = {
      name = "Not Discovered",
      text = {
        "Purchase or use",
        "this card in an",
        "unseeded run to",
        "learn what it does"
      }
    },
  },
}

SMODS.Consumable {
  key = "eruption",
  set = "calamity_cards",
  config = { extra = { amount = 10 } },
  pos = { x = 0, y = 0 },
  atlas = "AbandoniaCalamity",
  cost = 4,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_abn_fossil
    info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_sunscourge
    return { vars = { (card and card.ability.extra.amount or self.config.extra.amount) } }
  end,
  can_use = function(self, card)
    return #G.hand.cards > 0 
  end,
  use = function(self, card, area, copier)
    local used_tarot = copier or card
    
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        used_tarot:juice_up(0.3, 0.5)

        --Mass destroy existing cards
        local cards_to_destroy = {}
        for _, v in ipairs(G.playing_cards) do
          cards_to_destroy[#cards_to_destroy+1] = v
        end
        SMODS.destroy_cards(cards_to_destroy)

        --Filter the ranks (Non-face, non-Ace)
        -- We loop through G.P_CARDS to get the "fronts" (Suit + Rank)
        local valid_fronts = {}
        for k, v in pairs(G.P_CARDS) do
          local rank = v.value
          local is_face = (rank == 'Jack' or rank == 'Queen' or rank == 'King')
          if rank ~= 'Ace' and not is_face then
            table.insert(valid_fronts, v)
          end
        end

        --Create new cards
        local num_cards = card.ability.extra.amount
        for i = 1, num_cards do
          local chosen_front = pseudorandom_element(valid_fronts, pseudoseed('eruption'))
          
          -- Using create_playing_card ensures IDs and deck registration are handled.
          -- skip_edition = true prevents the "More than one edition" crash.
          local new_card = create_playing_card({
            front = chosen_front,
            center = G.P_CENTERS.c_base,
            skip_edition = true 
          }, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Tarot}) 

          -- Apply Fossil Enhancement
          new_card:set_ability(G.P_CENTERS.m_abn_fossil, true)
          
          -- Apply Sunscourge Edition
          new_card:set_edition('e_abn_sunscourge', true, true)
        end

        return true
      end
    }))
  end,
  abn_artist_credits = {
    artist = "Grass",
  },
}

SMODS.Consumable {
  key = "tsunami",
  set = "calamity_cards",
  config = { extra = { tags = 1 } },
  pos = { x = 1, y = 0 },
  atlas = "AbandoniaCalamity",
  cost = 4,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = { (card and card.ability.extra.tags or self.config.extra.tags) } }
  end,
  can_use = function(self, card)
    return #G.playing_cards > 0 
  end,
  use = function(self, card, area, copier)
    local used_tarot = copier or card
	
	for i = 1, card.ability.extra.tags do
        G.E_MANAGER:add_event(Event({
            func = function()
                local tag_key = get_next_tag_key('abn_guaranteed_hazard_tag')
                add_tag(Tag(tag_key))
                play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                return true
            end
        }))
    end
    
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        used_tarot:juice_up(0.3, 0.5)

        -- Iterate through every single card in the player's deck
        for i = 1, #G.playing_cards do
          local v = G.playing_cards[i]
          
          -- Visual feedback for the card being affected
          v:juice_up(0.3, 0.3)
          
          -- Flip the card
          if not v.ability.abn_perma_flipped then
			  if v.facing == 'front' then
				v:flip()
			  end
              v.ability.abn_perma_flipped = true
          end
        end

        return true
      end
    }))
  end,
  abn_artist_credits = {
    artist = "Grass", 
  },
}


SMODS.Consumable {
  key = "cyclone",
  set = "calamity_cards",
  config = { extra = {} },
  pos = { x = 2, y = 0 },
  atlas = "AbandoniaCalamity",
  cost = 4,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return { vars = {} }
  end,
  can_use = function(self, card)
    local edition = false
    for _, v in ipairs(G.jokers.cards) do
      if v.edition then
        edition = true
      end
    end
    for _, v in ipairs(G.playing_cards) do
      if v.edition then
        edition = true
      end
    end
    return edition
  end,
  use = function(self, card)
    for _, v in ipairs(G.jokers.cards) do
      if v.edition then
        SMODS.destroy_cards(v)
      end
    end
    for _, v in ipairs(G.playing_cards) do
      if v.edition then
        SMODS.destroy_cards(v)
      end
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('timpani')
        card:juice_up(0.3, 0.5)
        ease_dollars(G.GAME.dollars)
        return true
      end
    }))
    delay(0.6)
  end,
  abn_artist_credits = {
    artist = "Grass",
  },
}

SMODS.Consumable {
    key = "flood",
    set = "calamity_cards",
    config = { extra = { tags = 2 } },
    pos = { x = 3, y = 0 },
    atlas = "AbandoniaCalamity",
    cost = 4,
    discovered = false,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { (card and card.ability.extra.tags or self.config.extra.tags) } }
    end,    
	
	abn_artist_credits = {
		artist = "Grass",
	},
    
    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        --Add the Tags
        for i = 1, card.ability.extra.tags do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local tag_key = get_next_tag_key('abn_guaranteed_hazard_tag')
                    add_tag(Tag(tag_key))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
        end

        --Double the Deck
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5) -- Changed 'used_tarot' to 'card'

                local new_cards = {}
                -- Copy the current deck state into a temporary list
                local cards_to_copy = {}
                for _, v in ipairs(G.deck.cards) do
                    table.insert(cards_to_copy, v)
                end

                for i, source_card in ipairs(cards_to_copy) do
                    --Create the copy
                    local _card = copy_card(source_card)
                    
                    --Add to playing cards global table
                    _card:add_to_deck()
                    G.playing_cards = G.playing_cards or {} -- Safety check
                    table.insert(G.playing_cards, _card)
                    
                    --Put it in the deck
                    G.deck:emplace(_card)
                    
                    --Visual feedback
                    _card:start_materialize(nil, i == 1) 
                    table.insert(new_cards, _card)
                end

                --Notify Jokers
                playing_card_joker_effects(new_cards)
                
                return true
            end
        }))
    end
}

SMODS.Consumable {
    key = "tremor",
    set = "calamity_cards",
    config = { extra = { mult = 10 } },
    pos = { x = 5, y = 0 },
    atlas = "AbandoniaCalamity",
    cost = 4,
    discovered = false,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { (card and card.ability.extra.mult or self.config.extra.mult) } }
    end,    
    
    abn_artist_credits = {
        artist = "Grass",
    },
    
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end,

    use = function(self, card, area, copier)
        local rarity_3_jokers = {}
        local destroyed_count = 0

        -- 1. Identify targets and destroy sacrifices
        for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
            local rarity = j.config.center.rarity
            
            if rarity == 3 then
                table.insert(rarity_3_jokers, j)
            elseif rarity == 1 or rarity == 2 then
                destroyed_count = destroyed_count + 1
                j:start_dissolve()
            end
        end

        -- 2. Apply Mult using "Mythic-style" detection
        if destroyed_count > 0 and #rarity_3_jokers > 0 then
            local total_gain = destroyed_count * card.ability.extra.mult
            
            for _, j in ipairs(rarity_3_jokers) do

                j.ability.abn_perma_mult = (j.ability.abn_perma_mult or 0 ) + total_gain

                -- Feedback
                card_eval_status_text(j, 'extra', nil, nil, nil, {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.RED
                })
                j:juice_up()
            end
        end
    end
}

SMODS.Consumable {
  key = "avalanche",
  set = "calamity_cards",
  config = { extra = { amount = 13 } },
  pos = { x = 1, y = 1 }, 
  atlas = "AbandoniaCalamity",
  cost = 4,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return { vars = { (card and card.ability.extra.amount or self.config.extra.amount) } }
  end,
  can_use = function(self, card)
    --can always use
    return true
  end,
  use = function(self, card, area, copier)
    local used_tarot = copier or card
    
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound('tarot1')
        used_tarot:juice_up(0.3, 0.5)

        --Filter for Snow suit fronts
        local snow_fronts = {}
        for k, v in pairs(G.P_CARDS) do
          if v.suit == 'abn_Snow' then 
            table.insert(snow_fronts, v)
          end
        end

        --Create the cards
        local num_cards = card.ability.extra.amount
        for i = 1, num_cards do
          -- Select a random Snow card front
          local chosen_front = #snow_fronts > 0 and pseudorandom_element(snow_fronts, pseudoseed('avalanche_front')) or pseudorandom_element(G.P_CARDS, pseudoseed('avalanche_fallback'))
          
          -- Create the card directly into the deck/hand
          local new_card = create_playing_card({
            front = chosen_front,
            center = G.P_CENTERS.c_base,
            skip_edition = true -- We handle edition manually below
          }, G.deck, nil, i ~= 1, {G.C.SECONDARY_SET.Tarot}) 

          --Apply a random edition
          local random_edition = poll_edition('avalanche_edition', nil, false, true)
          new_card:set_edition(random_edition, true, true)
          
          new_card:juice_up(0.3, 0.3)
        end

        return true
      end
    }))
  end,
  abn_artist_credits = {
    artist = "Grass",
  },
}

SMODS.Consumable {
    key = "blizzard",
    set = "calamity_cards",
    config = { extra = { chips = 10, mult = 5 } },
    pos = { x = 2, y = 1 },
    atlas = "AbandoniaCalamity",
    cost = 4,
    discovered = false,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,  
    
    abn_artist_credits = {
        artist = "Grass",
    },
    
    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        for _, v in ipairs(G.playing_cards) do
			if v:is_suit("Diamonds") or v:is_suit("Hearts") then
				v.permadebuff = true
			elseif v:is_suit("Spades") or v:is_suit("Clubs") or v:is_suit("abn_Snow") then
				v.ability.perma_bonus = (v.ability.perma_bonus or 0) + card.ability.extra.chips
				v.ability.perma_mult = (v.ability.perma_mult or 0) + card.ability.extra.mult
			end
		end
    end
}


local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)
    
    --Check if we are actually in a run
    if not G or G.STAGE ~= G.STAGES.RUN then return end
    
    --check for playing cards
    if G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card.permadebuff then
                card:set_debuff(true)
            end
        end
    end
    
    --check for Jokers
    if G.jokers and G.jokers.cards then
        for _, card in ipairs(G.jokers.cards) do
            if card.permadebuff then
                card:set_debuff(true)
            end
        end
    end
end

SMODS.Consumable {
    key = "plague",
    set = "calamity_cards", -- Ensure this set is defined elsewhere in your mod
    config = { extra = { jokers = 1 } },
    pos = { x = 3, y = 1 },
    atlas = "AbandoniaCalamity",
    cost = 4,
    discovered = false,
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "perishable", set = "Other", vars = { 5 } }
        return { vars = { (card and card.ability.extra.jokers or self.config.extra.jokers) } }
    end,    
    
    abn_artist_credits = {
        artist = "Grass",
    },
    
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end,

    use = function(self, card, area, copier)
        -- Apply perishable to all current jokers
        for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
            -- Check if it's already perishable to avoid resetting the counter if desired
            if not j.ability.perishable then
                j:set_perishable(true)
            end
        end
        
        -- Get the count from extra
        local spawn_count = card.ability.extra.jokers
        
        -- Spawn Superrare
        for i = 1, spawn_count do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if #G.jokers.cards < G.jokers.config.card_limit then
                        play_sound('timpani')
                        
                        local card = SMODS.add_card({ 
                            set = 'Joker', 
                            rarity = "abn_SuperRare",
                        })
                        
                        -- Simple animation to show it appearing
                        card:juice_up(0.3, 0.5)
						card:set_edition(poll_edition('plague', nil, false, true))
                    end
                    return true
                end
            }))
        end
    end
}

SMODS.Consumable {
    key = "drought",
    set = "calamity_cards",
    config = { extra = { jokers = 2 } },
    pos = { x = 4, y = 1 },
    atlas = "AbandoniaCalamity",
    cost = 4,
    discovered = false,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { (card and card.ability.extra.jokers / 2 or self.config.extra.jokers / 2) } }
    end,    
    
    abn_artist_credits = {
        artist = "Grass",
    },
    
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end,

    use = function(self, card, area, copier)
        -- Permadebuff all current jokers
        for i = 1, #G.jokers.cards do
            local j = G.jokers.cards[i]
            j.ability.permadebuff = true
            j:set_debuff(true)
        end
        
        -- Lose all money
        ease_dollars(-G.GAME.dollars)
        
        -- Get the count from extra
        local spawn_count = card.ability.extra.jokers
        
        -- Spawning Logic Loop
        for i = 1, spawn_count do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4 * i,
                func = function()
                    if #G.jokers.cards < G.jokers.config.card_limit then
                        play_sound('timpani')
                        -- Alternates rarity
                        local target_rarity = (i % 2 == 1) and "abn_SuperRare" or "abn_ParallelRare"
                        
                        SMODS.add_card({ 
                            set = 'Joker', 
                            rarity = target_rarity 
                        })
                    end
                    return true
                end
            }))
        end
    end
}

SMODS.Consumable {
    key = "heatwave",
    set = "calamity_cards",
    config = { extra = { chips = 10, mult = 5 } },
    pos = { x = 5, y = 1 },
    atlas = "AbandoniaCalamity",
    cost = 4,
    discovered = false,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,  
    
    abn_artist_credits = {
        artist = "Grass",
    },
    
    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        for _, v in ipairs(G.playing_cards) do
			if v:is_suit("Spades") or v:is_suit("Clubs") or v:is_suit("abn_Snow") then
				v.permadebuff = true
			elseif v:is_suit("Diamonds") or v:is_suit("Hearts") then
				v.ability.perma_bonus = (v.ability.perma_bonus or 0) + card.ability.extra.chips
				v.ability.perma_mult = (v.ability.perma_mult or 0) + card.ability.extra.mult
			end
		end
    end
}

SMODS.Consumable {
    key = "humans",
    set = "calamity_cards",
    config = { extra = { jokers = 2 } },
    pos = { x = 0, y = 2 },
    atlas = "AbandoniaCalamity",
    cost = 4,
    discovered = false,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.jokers } }
    end,  
    
    abn_artist_credits = {
        artist = "Grass",
    },
    
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end,

    use = function(self, card, area, copier)
	
		--kill jokers
        for _, v in ipairs(G.jokers.cards) do
			v:start_dissolve()
		end
		
		--lose money
		G.GAME.dollars = -20
		
		--add joker slots
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokers
		
    end
}

SMODS.Consumable {
    key = "heatdeath",
    set = "calamity_cards",
    config = { extra = { mult = 3 } },
    pos = { x = 1, y = 2 },
    atlas = "AbandoniaCalamity",
    cost = 4,
    discovered = false,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,  
    
    abn_artist_credits = {
        artist = "Grass",
    },
    
    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
		
		--get hands
		for hand_name, hand_data in pairs(G.GAME.hands) do
			-- Use to_number to safely compare with Talisman BigNums
			local current_level = to_number(hand_data.level)
        
			if current_level > 1 then
            
				--set level back to 1
				local levels_to_lose = -(current_level - 1)

				SMODS.upgrade_poker_hands({
					hands = {hand_name},
					level_up = levels_to_lose,
					from = card,
				})
			end
		end
		
		
		--improve all cards
		for _, v in ipairs(G.playing_cards) do
			v.ability.perma_bonus = (v.ability.perma_bonus or 0) + v.base.nominal
			v.ability.perma_mult = (v.ability.perma_mult or 0) + card.ability.extra.mult
		end
		
    end
}


SMODS.Consumable {
    key = "rapture",
    set = "calamity_cards",
    config = { extra = { jokers = 2 } },
    pos = { x = 3, y = 2 },
    atlas = "AbandoniaCalamity",
    cost = 4,
    discovered = false,
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.jokers } }
    end,  
    
    abn_artist_credits = {
        artist = "Grass",
    },
    
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end,

    use = function(self, card, area, copier)
		local stickers = {"eternal", "perishable", "rental", "pinned"}
		
		--sticker + edition jokers
        for _, v in ipairs(G.jokers.cards) do
		
			local random_sticker = pseudorandom_element(stickers, pseudoseed('rapture'))
			
			v:set_edition(poll_edition('rapture', nil, false, true))
			v:add_sticker(random_sticker, true)
			
		end
		
    end
}


local disabled = {
    --allow for disabling if needed
}

SMODS.Booster({
    key = 'calamitybooster',
    atlas = 'AbandoniaCalamity',
    pos = { x = 0, y = 3 },
    loc_txt = {
        name = 'Calamity Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:abn_calamity}Calamity{} cards to',
            'be used immediately'
        }
    },
    config = { extra = 3, choose = 1 },
    weight = 1,
    cost = 4,
    group_key = 'abn_calamitybooster',
    draw_hand = true,
    unlocked = true,
    discovered = true,
    create_card = function(self, card)
        local i = 0
        repeat
            i = i + 1  -- Increment to prevent infinite loop
            card = create_card("calamity_cards", G.pack_cards, nil, nil, true, true, nil, "abn_calamity_cards")  -- Long card creation logic
        until not disabled[card.config.center.key] or i > 100 or card:remove()  -- If the card is disabled, regenerate it or clean up after 100 attempts
        return card  -- Return the valid card
    end,
	
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
	
    ease_background_colour = function(self)
        local effects = {
            { new_colour = G.C.GREEN, special_colour = G.C.PURPLE, contrast = 3 },
        }
        local random_index = math.random(#effects)
        local chosen_effect = effects[random_index]
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
        ease_background_colour(chosen_effect)
    end
})

local disabled = {
    --allow for disabling if needed
}

SMODS.Booster({
    key = 'calamitybooster2',
    atlas = 'AbandoniaCalamity',
    pos = { x = 1, y = 3 },
    loc_txt = {
        name = 'Calamity Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:abn_calamity}Calamity{} cards to',
            'be used immediately'
        }
    },
    config = { extra = 3, choose = 1 },
    weight = 1,
    cost = 4,
    group_key = 'abn_calamitybooster',
    draw_hand = true,
    unlocked = true,
    discovered = true,
    create_card = function(self, card)
        local i = 0
        repeat
            i = i + 1  -- Increment to prevent infinite loop
            card = create_card("calamity_cards", G.pack_cards, nil, nil, true, true, nil, "abn_calamity_cards")  -- Long card creation logic
        until not disabled[card.config.center.key] or i > 100 or card:remove()  -- If the card is disabled, regenerate it or clean up after 100 attempts
        return card  -- Return the valid card
    end,
	
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
	
    ease_background_colour = function(self)
        local effects = {
            { new_colour = G.C.GREEN, special_colour = G.C.PURPLE, contrast = 3 },
        }
        local random_index = math.random(#effects)
        local chosen_effect = effects[random_index]
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
        ease_background_colour(chosen_effect)
    end
})

local disabled = {
    --allow for disabling if needed
}

SMODS.Booster({
    key = 'calamitybooster_j',
    atlas = 'AbandoniaCalamity',
    pos = { x = 2, y = 3 },
    loc_txt = {
        name = 'Jumbo Calamity Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:abn_calamity}Calamity{} cards to',
            'be used immediately'
        }
    },
    config = { extra = 5, choose = 1 },
    weight = 1,
    cost = 6,
    group_key = 'abn_calamitybooster_j',
    draw_hand = true,
    unlocked = true,
    discovered = true,
    create_card = function(self, card)
        local i = 0
        repeat
            i = i + 1  -- Increment to prevent infinite loop
            card = create_card("calamity_cards", G.pack_cards, nil, nil, true, true, nil, "abn_calamity_cards")  -- Long card creation logic
        until not disabled[card.config.center.key] or i > 100 or card:remove()  -- If the card is disabled, regenerate it or clean up after 100 attempts
        return card  -- Return the valid card
    end,
	
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
	
    ease_background_colour = function(self)
        local effects = {
            { new_colour = G.C.GREEN, special_colour = G.C.PURPLE, contrast = 3 },
        }
        local random_index = math.random(#effects)
        local chosen_effect = effects[random_index]
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
        ease_background_colour(chosen_effect)
    end
})

local disabled = {
    --allow for disabling if needed
}

SMODS.Booster({
    key = 'calamitybooster_m',
    atlas = 'AbandoniaCalamity',
    pos = { x = 3, y = 3 },
    loc_txt = {
        name = 'Mega Calamity Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:abn_calamity}Calamity{} cards to',
            'be used immediately'
        }
    },
    config = { extra = 5, choose = 2 },
    weight = 1,
    cost = 8,
    group_key = 'abn_calamitybooster_m',
    draw_hand = true,
    unlocked = true,
    discovered = true,
    create_card = function(self, card)
        local i = 0
        repeat
            i = i + 1  -- Increment to prevent infinite loop
            card = create_card("calamity_cards", G.pack_cards, nil, nil, true, true, nil, "abn_calamity_cards")  -- Long card creation logic
        until not disabled[card.config.center.key] or i > 100 or card:remove()  -- If the card is disabled, regenerate it or clean up after 100 attempts
        return card  -- Return the valid card
    end,
	
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
	
    ease_background_colour = function(self)
        local effects = {
            { new_colour = G.C.GREEN, special_colour = G.C.PURPLE, contrast = 3 },
        }
        local random_index = math.random(#effects)
        local chosen_effect = effects[random_index]
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
        ease_background_colour(chosen_effect)
    end
})






