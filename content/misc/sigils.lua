loc_colour()
G.C.SIGILS = HEX("fd5f55")
G.C.SIGILS_SECONDARY = HEX("983f39")
G.ARGS.LOC_COLOURS["abn_Sigils"] = G.C.SIGILS

SMODS.ConsumableType {
  key = "sigils",
  collection_rows = { 6, 6 },
  shop_rate = 0.0,
  primary_colour = G.C.SIGILS,
  secondary_colour = G.C.SIGILS_SECONDARY,
  loc_txt = {
    collection = "Sigils",
    name = "Sigils",
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
    key = "bael",
    set = "sigils",
	config = { extra = { used = 0 } },
    pos = { x = 2, y = 0 },
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        -- Create the card as a Voucher to live in the voucher area
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_bael')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Pick a random index to keep using the game's seeded random
                    local survivor_index = pseudorandom('bael_survivor', 1, #G.play.cards)
                    
					if #G.play.cards > 1 then
						-- Loop through and dissolve all cards instantly EXCEPT the survivor
						for i = #G.play.cards, 1, -1 do
							if i ~= survivor_index then
								G.play.cards[i]:start_dissolve({ G.C.RED }, nil, 1.6, false)
								card.ability.extra.used = 1
							end
						end
						return true
					end
                end
            }))
            return true
        end
		
		--level up
		if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "High Card" then
			return {
				level_up = true,
			}
		end
		
		--kill self
		if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
			card:start_dissolve()
		end
    end,

    abn_artist_credits = {
        artist = "Robnnuy",
    },
}

SMODS.Consumable {
    key = "botis",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 3, y = 0 },
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_botis')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Check inside as requested
                    if G.play and G.play.cards and #G.play.cards >= 2 then
                        local indices = {}
                        for i = 1, #G.play.cards do table.insert(indices, i) end
                        
                        -- Pick Source
                        local k1 = pseudorandom_element(indices, pseudoseed('botis_s1'))
                        for k, v in ipairs(indices) do if v == k1 then table.remove(indices, k) break end end
                        
                        -- Pick Target
                        local k2 = pseudorandom_element(indices, pseudoseed('botis_s2'))

                        local s1 = G.play.cards[k1]
                        local s2 = G.play.cards[k2]

                        if s1 and s2 then
                            -- Dissolve others first
                            for i = #G.play.cards, 1, -1 do
                                local check_card = G.play.cards[i]
                                if check_card ~= s1 and check_card ~= s2 then
                                    check_card:start_dissolve({G.C.RED}, nil, 1.6)
                                end
                            end

                            -- update rank
                            local target_suit = s2.base.suit
                            local source_rank = s1.base.value
                            
                            SMODS.change_base(s2, target_suit, source_rank)

                            -- Visuals
                            s2:juice_up(0.3, 0.3)
                            play_sound('card1', 1)
                            card.ability.extra.used = 1
                        end
                    end
                    return true
                end
            }))
            return true
        end
        
        -- level up
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Pair" then
            return { level_up = true }
        end
        
        -- kill self
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}

SMODS.Consumable {
    key = "vinea",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 4, y = 0 },
    atlas = "AbandoniaSigils",
    cost = 6,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_vinea')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers and card.ability.extra.used == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.play and G.play.cards and #G.play.cards >= 4 then
                        local rank_list = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
                        
                        -- 1. Check for distinct ranks
                        local distinct_ranks = {}
                        for _, c in ipairs(G.play.cards) do
                            distinct_ranks[c.base.value] = true
                        end
                        
                        local count = 0
                        local current_rank = nil
                        for r, _ in pairs(distinct_ranks) do 
                            count = count + 1 
                            current_rank = r
                        end

                        -- 2. RANDOMIZED FORCED VARIETY
                        if count < 2 then
                            -- Filter rank_list to exclude the current rank
                            local possible_new_ranks = {}
                            for _, r in ipairs(rank_list) do
                                if r ~= current_rank then
                                    table.insert(possible_new_ranks, r)
                                end
                            end
                            
                            -- Pick a random rank from the remaining 12 options
                            local new_rank = pseudorandom_element(possible_new_ranks, pseudoseed('vinea_force_rank'))
                            
                            -- Transform the first card to this random new rank
                            SMODS.change_base(G.play.cards[1], G.play.cards[1].base.suit, new_rank)
                        end

                        -- 3. SELECTION LOGIC
                        local potential_indices = {}
                        for i = 1, #G.play.cards do table.insert(potential_indices, i) end
                        
                        -- Pick Source 1
                        local idx_s1 = pseudorandom_element(potential_indices, pseudoseed('vinea_s1'))
                        local s1 = G.play.cards[idx_s1]
                        for k, v in ipairs(potential_indices) do if v == idx_s1 then table.remove(potential_indices, k) break end end

                        -- Pick Source 2 (Guaranteed different rank now)
                        local diff_rank_indices = {}
                        for _, idx in ipairs(potential_indices) do
                            if G.play.cards[idx].base.value ~= s1.base.value then
                                table.insert(diff_rank_indices, idx)
                            end
                        end

                        local idx_s2 = pseudorandom_element(diff_rank_indices, pseudoseed('vinea_s2'))
                        local s2 = G.play.cards[idx_s2]
                        for k, v in ipairs(potential_indices) do if v == idx_s2 then table.remove(potential_indices, k) break end end

                        -- Pick Targets
                        local idx_t1 = pseudorandom_element(potential_indices, pseudoseed('vinea_t1'))
                        for k, v in ipairs(potential_indices) do if v == idx_t1 then table.remove(potential_indices, k) break end end
                        
                        local idx_t2 = pseudorandom_element(potential_indices, pseudoseed('vinea_t2'))
                        for k, v in ipairs(potential_indices) do if v == idx_t2 then table.remove(potential_indices, k) break end end

                        local t1 = G.play.cards[idx_t1]
                        local t2 = G.play.cards[idx_t2]

                        if s1 and s2 and t1 and t2 then
                            -- 4. DESTRUCTION
                            for i = #G.play.cards, 1, -1 do
                                local c = G.play.cards[i]
                                if c ~= s1 and c ~= s2 and c ~= t1 and c ~= t2 then
                                    c:start_dissolve({G.C.RED}, nil, 1.6)
                                end
                            end

                            -- 5. FINAL TRANSFORMATION
                            SMODS.change_base(t1, t1.base.suit, s1.base.value)
                            SMODS.change_base(t2, t2.base.suit, s2.base.value)

                            t1:juice_up(0.3, 0.3)
                            t2:juice_up(0.3, 0.3)
                            play_sound('card1', 1)
                            card.ability.extra.used = 1 
                        end
                    end
                    return true
                end
            }))
            return true
        end
        
        -- Level up Two Pair
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Two Pair" then
            return { level_up = true }
        end
        
        -- Kill self
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}

SMODS.Consumable {
    key = "morax",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 5, y = 0 },
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_morax')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers and card.ability.extra.used == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Validation: Must have at least 3 cards to make a 3-of-a-kind
                    if G.play and G.play.cards and #G.play.cards >= 3 then
                        local potential_indices = {}
                        for i = 1, #G.play.cards do table.insert(potential_indices, i) end
                        
                        -- 1. Pick Source (The Rank Provider)
                        local idx_s1 = pseudorandom_element(potential_indices, pseudoseed('morax_s1'))
                        local s1 = G.play.cards[idx_s1]
                        
                        -- Remove source from potential targets
                        for k, v in ipairs(potential_indices) do if v == idx_s1 then table.remove(potential_indices, k) break end end

                        -- 2. Pick Two Targets
                        local idx_t1 = pseudorandom_element(potential_indices, pseudoseed('morax_t1'))
                        for k, v in ipairs(potential_indices) do if v == idx_t1 then table.remove(potential_indices, k) break end end
                        
                        local idx_t2 = pseudorandom_element(potential_indices, pseudoseed('morax_t2'))
                        for k, v in ipairs(potential_indices) do if v == idx_t2 then table.remove(potential_indices, k) break end end

                        local t1 = G.play.cards[idx_t1]
                        local t2 = G.play.cards[idx_t2]

                        if s1 and t1 and t2 then
                            -- 3. Dissolve everything else (4th and 5th cards)
                            for i = #G.play.cards, 1, -1 do
                                local c = G.play.cards[i]
                                if c ~= s1 and c ~= t1 and c ~= t2 then
                                    c:start_dissolve({G.C.RED}, nil, 1.6)
                                end
                            end

                            -- 4. Transformation
                            -- Update both targets to the source rank
                            SMODS.change_base(t1, t1.base.suit, s1.base.value)
                            SMODS.change_base(t2, t2.base.suit, s1.base.value)

                            t1:juice_up(0.3, 0.3)
                            t2:juice_up(0.3, 0.3)
                            play_sound('card1', 1)
                            card.ability.extra.used = 1
                        end
                    end
                    return true
                end
            }))
            return true
        end
        
        -- Level up Three of a Kind
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Three of a Kind" then
            return { level_up = true }
        end
        
        -- Kill self
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}

SMODS.Consumable {
    key = "bune",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 6, y = 0 },
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_bune')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers and card.ability.extra.used == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Validation: Must have at least 4 cards to make a 4-of-a-kind
                    if G.play and G.play.cards and #G.play.cards >= 4 then
                        local potential_indices = {}
                        for i = 1, #G.play.cards do table.insert(potential_indices, i) end
                        
                        -- 1. Pick Source (The Rank Provider)
                        local idx_s1 = pseudorandom_element(potential_indices, pseudoseed('bune_s1'))
                        local s1 = G.play.cards[idx_s1]
                        
                        -- Remove source from potential targets list
                        for k, v in ipairs(potential_indices) do if v == idx_s1 then table.remove(potential_indices, k) break end end

                        -- 2. Pick Three Targets
                        local targets = {}
                        for i = 1, 3 do
                            local idx_t = pseudorandom_element(potential_indices, pseudoseed('bune_t'..i))
                            table.insert(targets, G.play.cards[idx_t])
                            -- Remove picked target so it isn't picked again
                            for k, v in ipairs(potential_indices) do if v == idx_t then table.remove(potential_indices, k) break end end
                        end

                        if s1 and #targets == 3 then
                            -- 3. Dissolve everything else (the 5th card if it exists)
                            for i = #G.play.cards, 1, -1 do
                                local c = G.play.cards[i]
                                local is_target = false
                                for _, t in ipairs(targets) do if c == t then is_target = true end end
                                
                                if c ~= s1 and not is_target then
                                    c:start_dissolve({G.C.RED}, nil, 1.6)
                                end
                            end

                            -- 4. Transformation
                            -- Update all three targets to match the source rank
                            for _, t in ipairs(targets) do
                                SMODS.change_base(t, t.base.suit, s1.base.value)
                                t:juice_up(0.3, 0.3)
                            end

                            play_sound('card1', 1)
                            card.ability.extra.used = 1
                        end
                    end
                    return true
                end
            }))
            return true
        end
        
        -- Level up Four of a Kind
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Four of a Kind" then
            return { level_up = true }
        end
        
        -- Kill self
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}

SMODS.Consumable {
    key = "furfur",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 7, y = 0 },
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_furfur')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers and card.ability.extra.used == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.play and G.play.cards and #G.play.cards == 5 then
                        local rank_list = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
                        local suit_list = {'Spades', 'Hearts', 'Clubs', 'Diamonds'}
                        
                        -- 1. Determine the Straight Ranks
                        local anchor_card = G.play.cards[1]
                        local anchor_rank_idx = 1
                        for i, v in ipairs(rank_list) do 
                            if v == anchor_card.base.value then anchor_rank_idx = i break end 
                        end

                        local start_idx = math.max(1, math.min(9, anchor_rank_idx - 2)) 
                        
                        -- 2. Apply Rank Transformations
                        for i = 1, 5 do
                            local target_rank = rank_list[start_idx + i - 1]
                            SMODS.change_base(G.play.cards[i], G.play.cards[i].base.suit, target_rank)
                        end

                        -- 3. ANTI-STRAIGHT-FLUSH CHECK
                        local suits_present = {}
                        for _, c in ipairs(G.play.cards) do
                            suits_present[c.base.suit] = true
                        end

                        local unique_suit_count = 0
                        local first_suit = nil
                        for s, _ in pairs(suits_present) do 
                            unique_suit_count = unique_suit_count + 1 
                            first_suit = s
                        end

                        -- If only 1 suit exists, it's a Straight Flush. Break it.
                        if unique_suit_count == 1 then
                            local break_idx = pseudorandom(pseudoseed('furfur_suit_break'), 1, 5)
                            local target_card = G.play.cards[break_idx]
                            
                            -- Pick a suit that isn't the current one
                            local new_suit = nil
                            for _, s in ipairs(suit_list) do
                                if s ~= first_suit then
                                    new_suit = s
                                    break
                                end
                            end
                            
                            SMODS.change_base(target_card, new_suit, target_card.base.value)
                        end

                        -- Visuals
                        for _, c in ipairs(G.play.cards) do c:juice_up(0.3, 0.3) end
                        play_sound('card1', 1)
                        card.ability.extra.used = 1
                    end
                    return true
                end
            }))
            return true
        end
        
        -- Level up Straight
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Straight" then
            return { level_up = true }
        end
        
        -- Cleanup
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}

SMODS.Consumable {
    key = "bifrons",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 8, y = 0 },
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_bifrons')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers and card.ability.extra.used == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Validation: Flushes require at least 5 cards
                    if G.play and G.play.cards and #G.play.cards >= 5 then
                        local potential_indices = {}
                        for i = 1, #G.play.cards do table.insert(potential_indices, i) end
                        
                        -- 1. Pick Source (The Suit Provider)
                        local idx_s1 = pseudorandom_element(potential_indices, pseudoseed('bifrons_s1'))
                        local s1 = G.play.cards[idx_s1]
                        local target_suit = s1.base.suit
                        
                        -- 2. Identify the 4 Targets
                        -- We remove the source so it doesn't try to transform into itself
                        for k, v in ipairs(potential_indices) do if v == idx_s1 then table.remove(potential_indices, k) break end end
                        
                        local targets = {}
                        -- We need exactly 4 more cards to make a 5-card flush
                        for i = 1, 4 do
                            local idx_t = pseudorandom_element(potential_indices, pseudoseed('bifrons_t'..i))
                            table.insert(targets, G.play.cards[idx_t])
                            for k, v in ipairs(potential_indices) do if v == idx_t then table.remove(potential_indices, k) break end end
                        end

                        if s1 and #targets == 4 then

                            -- If they played more than 5 cards dissolve the extras.
                            for i = #G.play.cards, 1, -1 do
                                local c = G.play.cards[i]
                                local is_target = false
                                for _, t in ipairs(targets) do if c == t then is_target = true end end
                                
                                if c ~= s1 and not is_target then
                                    c:start_dissolve({G.C.RED}, nil, 1.6)
                                end
                            end

                            -- 4. Transformation
                            -- Update all 4 targets to match the source's suit
                            for _, t in ipairs(targets) do
                                SMODS.change_base(t, target_suit, t.base.value)
                                t:juice_up(0.3, 0.3)
                            end

                            play_sound('card1', 1)
                            card.ability.extra.used = 1
                        end
                    end
                    return true
                end
            }))
            return true
        end
        
        -- Level up Flush
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Flush" then
            return { level_up = true }
        end
        
        -- Kill self
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}

SMODS.Consumable {
    key = "crocell",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 9, y = 0 },
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_crocell')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers and card.ability.extra.used == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.play and G.play.cards and #G.play.cards >= 5 then
                        local rank_list = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
                        local suit_list = {'Spades', 'Hearts', 'Clubs', 'Diamonds'}
                        
                        -- 1. Check for distinct ranks
                        local distinct_ranks = {}
                        for _, c in ipairs(G.play.cards) do
                            distinct_ranks[c.base.value] = true
                        end
                        
                        local count = 0
                        local current_rank = nil
                        for r, _ in pairs(distinct_ranks) do 
                            count = count + 1 
                            current_rank = r
                        end

                        -- 2. RANDOMIZED FORCED VARIETY
                        if count < 2 then
                            local possible_new_ranks = {}
                            for _, r in ipairs(rank_list) do
                                if r ~= current_rank then table.insert(possible_new_ranks, r) end
                            end
                            local new_rank = pseudorandom_element(possible_new_ranks, pseudoseed('crocell_force_rank'))
                            SMODS.change_base(G.play.cards[1], G.play.cards[1].base.suit, new_rank)
                        end

                        -- 3. SELECTION LOGIC
                        local potential_indices = {}
                        for i = 1, #G.play.cards do table.insert(potential_indices, i) end
                        
                        local idx_s1 = pseudorandom_element(potential_indices, pseudoseed('crocell_s1'))
                        local s1 = G.play.cards[idx_s1]
                        for k, v in ipairs(potential_indices) do if v == idx_s1 then table.remove(potential_indices, k) break end end

                        local diff_rank_indices = {}
                        for _, idx in ipairs(potential_indices) do
                            if G.play.cards[idx].base.value ~= s1.base.value then
                                table.insert(diff_rank_indices, idx)
                            end
                        end
                        local idx_s2 = pseudorandom_element(diff_rank_indices, pseudoseed('crocell_s2'))
                        local s2 = G.play.cards[idx_s2]
                        for k, v in ipairs(potential_indices) do if v == idx_s2 then table.remove(potential_indices, k) break end end

                        local triplet_targets = {}
                        for i = 1, 2 do
                            local idx = pseudorandom_element(potential_indices, pseudoseed('crocell_t_trip'..i))
                            table.insert(triplet_targets, G.play.cards[idx])
                            for k, v in ipairs(potential_indices) do if v == idx then table.remove(potential_indices, k) break end end
                        end

                        local idx_p = pseudorandom_element(potential_indices, pseudoseed('crocell_t_pair'))
                        local pair_target = G.play.cards[idx_p]
                        for k, v in ipairs(potential_indices) do if v == idx_p then table.remove(potential_indices, k) break end end

                        if s1 and s2 and pair_target and #triplet_targets == 2 then
                            -- 4. Dissolve Extras
                            local final_hand = {s1, s2, pair_target, triplet_targets[1], triplet_targets[2]}
                            for i = #G.play.cards, 1, -1 do
                                local c = G.play.cards[i]
                                local is_reserved = false
                                for _, fh in ipairs(final_hand) do if c == fh then is_reserved = true end end
                                if not is_reserved then c:start_dissolve({G.C.RED}, nil, 1.6) end
                            end

                            -- 5. Transformation (Ranks)
                            for _, t in ipairs(triplet_targets) do
                                SMODS.change_base(t, t.base.suit, s1.base.value)
                            end
                            SMODS.change_base(pair_target, pair_target.base.suit, s2.base.value)

                            -- 6. ANTI-FLUSH CHECK
                            local suits_present = {}
                            for _, c in ipairs(final_hand) do suits_present[c.base.suit] = true end

                            local unique_suit_count = 0
                            local first_suit = nil
                            for s, _ in pairs(suits_present) do 
                                unique_suit_count = unique_suit_count + 1 
                                first_suit = s
                            end

                            if unique_suit_count == 1 then
                                local break_idx = pseudorandom(pseudoseed('crocell_suit_break'), 1, 5)
                                local target_card = final_hand[break_idx]
                                local new_suit = nil
                                for _, s in ipairs(suit_list) do
                                    if s ~= first_suit then new_suit = s break end
                                end
                                SMODS.change_base(target_card, new_suit, target_card.base.value)
                            end

                            -- Visuals
                            for _, c in ipairs(final_hand) do c:juice_up(0.3, 0.3) end
                            play_sound('card1', 1)
                            card.ability.extra.used = 1 
                        end
                    end
                    return true
                end
            }))
            return true
        end
        
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Full House" then
            return { level_up = true }
        end
        
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}

SMODS.Consumable {
    key = "belial",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 0, y = 1 },
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_belial')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers and card.ability.extra.used == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.play and G.play.cards and #G.play.cards == 5 then
                        local rank_list = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
                        
                        -- 1. Identify all suits currently in the hand
                        local suits_in_hand = {}
                        for _, c in ipairs(G.play.cards) do
                            table.insert(suits_in_hand, c.base.suit)
                        end
                        
                        -- 2. Pick ONE random suit from those present
                        local target_suit = pseudorandom_element(suits_in_hand, pseudoseed('belial_suit'))

                        -- 3. Get Anchor Rank from the first card (to start the sequence)
                        local anchor_card = G.play.cards[1]
                        local anchor_rank_idx = 1
                        for i, v in ipairs(rank_list) do 
                            if v == anchor_card.base.value then anchor_rank_idx = i break end 
                        end

                        -- 4. Calculate valid start index for the 5-card sequence
                        local start_idx = math.max(1, math.min(9, anchor_rank_idx - 2)) 
                        
                        -- 5. Force the Straight Flush using the randomly chosen suit
                        for i = 1, 5 do
                            local current_card = G.play.cards[i]
                            local target_rank = rank_list[start_idx + i - 1]
                            
                            SMODS.change_base(current_card, target_suit, target_rank)
                            current_card:juice_up(0.3, 0.3)
                        end

                        play_sound('card1', 1)
                        card.ability.extra.used = 1
                    end
                    return true
                end
            }))
            return true
        end
        
        -- Level up Straight Flush
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Straight Flush" then
            return { level_up = true }
        end
        
        -- Cleanup
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}

SMODS.Consumable {
    key = "astaroth",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 1, y = 1 },
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_astaroth')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers and card.ability.extra.used == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.play and G.play.cards and #G.play.cards >= 5 then
                        local suit_list = {'Spades', 'Hearts', 'Clubs', 'Diamonds'}
                        local potential_indices = {}
                        for i = 1, #G.play.cards do table.insert(potential_indices, i) end
                        
                        -- 1. Pick Source (The Rank Provider)
                        local idx_s1 = pseudorandom_element(potential_indices, pseudoseed('astaroth_s1'))
                        local s1 = G.play.cards[idx_s1]
                        for k, v in ipairs(potential_indices) do if v == idx_s1 then table.remove(potential_indices, k) break end end

                        -- 2. Pick Four Targets
                        local targets = {}
                        for i = 1, 4 do
                            local idx_t = pseudorandom_element(potential_indices, pseudoseed('astaroth_t'..i))
                            table.insert(targets, G.play.cards[idx_t])
                            for k, v in ipairs(potential_indices) do if v == idx_t then table.remove(potential_indices, k) break end end
                        end

                        if s1 and #targets == 4 then
                            local final_hand = {s1, targets[1], targets[2], targets[3], targets[4]}

                            -- 3. Dissolve everything else
                            for i = #G.play.cards, 1, -1 do
                                local c = G.play.cards[i]
                                local is_reserved = false
                                for _, fh in ipairs(final_hand) do if c == fh then is_reserved = true end end
                                if not is_reserved then
                                    c:start_dissolve({G.C.RED}, nil, 1.6)
                                end
                            end

                            -- 4. Transformation (Ranks)
                            for _, t in ipairs(targets) do
                                SMODS.change_base(t, t.base.suit, s1.base.value)
                            end

                            -- 5. ANTI-FLUSH CHECK
                            local suits_present = {}
                            for _, c in ipairs(final_hand) do suits_present[c.base.suit] = true end

                            local unique_suit_count = 0
                            local first_suit = nil
                            for s, _ in pairs(suits_present) do 
                                unique_suit_count = unique_suit_count + 1 
                                first_suit = s
                            end

                            -- If it's a Flush Five, sabotage one suit
                            if unique_suit_count == 1 then
                                local break_idx = pseudorandom(pseudoseed('astaroth_suit_break'), 1, 5)
                                local target_card = final_hand[break_idx]
                                local new_suit = nil
                                for _, s in ipairs(suit_list) do
                                    if s ~= first_suit then new_suit = s break end
                                end
                                SMODS.change_base(target_card, new_suit, target_card.base.value)
                            end

                            -- Visuals
                            for _, c in ipairs(final_hand) do c:juice_up(0.3, 0.3) end
                            play_sound('card1', 1)
                            card.ability.extra.used = 1
                        end
                    end
                    return true
                end
            }))
            return true
        end
        
        -- Level up Five of a Kind
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Five of a Kind" then
            return { level_up = true }
        end
        
        -- Kill self
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}

SMODS.Consumable {
    key = "asmodeus",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 2, y = 1 }, 
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_asmodeus')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers and card.ability.extra.used == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.play and G.play.cards and #G.play.cards >= 5 then
                        local rank_list = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}
                        
                        -- 1. Determine Master Suit (Pick a random one from the hand)
                        local suits_in_hand = {}
                        for _, c in ipairs(G.play.cards) do table.insert(suits_in_hand, c.base.suit) end
                        local master_suit = pseudorandom_element(suits_in_hand, pseudoseed('asmodeus_suit'))

                        -- 2. Forced Rank Variety
                        local distinct_ranks = {}
                        for _, c in ipairs(G.play.cards) do distinct_ranks[c.base.value] = true end
                        
                        local count = 0
                        local current_rank = nil
                        for r, _ in pairs(distinct_ranks) do count = count + 1 current_rank = r end

                        if count < 2 then
                            local possible_new_ranks = {}
                            for _, r in ipairs(rank_list) do
                                if r ~= current_rank then table.insert(possible_new_ranks, r) end
                            end
                            local new_rank = pseudorandom_element(possible_new_ranks, pseudoseed('asmodeus_force_rank'))
                            SMODS.change_base(G.play.cards[1], G.play.cards[1].base.suit, new_rank)
                        end

                        -- 3. Selection Logic (1 Source for Trip, 1 Source for Pair)
                        local potential_indices = {}
                        for i = 1, #G.play.cards do table.insert(potential_indices, i) end
                        
                        local idx_s1 = pseudorandom_element(potential_indices, pseudoseed('asmodeus_s1'))
                        local s1 = G.play.cards[idx_s1]
                        for k, v in ipairs(potential_indices) do if v == idx_s1 then table.remove(potential_indices, k) break end end

                        local diff_rank_indices = {}
                        for _, idx in ipairs(potential_indices) do
                            if G.play.cards[idx].base.value ~= s1.base.value then table.insert(diff_rank_indices, idx) end
                        end
                        local idx_s2 = pseudorandom_element(diff_rank_indices, pseudoseed('asmodeus_s2'))
                        local s2 = G.play.cards[idx_s2]
                        for k, v in ipairs(potential_indices) do if v == idx_s2 then table.remove(potential_indices, k) break end end

                        -- 4. Assign Targets (2 for Trip, 1 for Pair)
                        local trip_targets = {}
                        for i = 1, 2 do
                            local idx = pseudorandom_element(potential_indices, pseudoseed('asmodeus_t_trip'..i))
                            table.insert(trip_targets, G.play.cards[idx])
                            for k, v in ipairs(potential_indices) do if v == idx then table.remove(potential_indices, k) break end end
                        end

                        local idx_p = pseudorandom_element(potential_indices, pseudoseed('asmodeus_t_pair'))
                        local pair_target = G.play.cards[idx_p]

                        if s1 and s2 and pair_target and #trip_targets == 2 then
                            local final_hand = {s1, s2, pair_target, trip_targets[1], trip_targets[2]}

                            -- 5. Dissolve Extras
                            for i = #G.play.cards, 1, -1 do
                                local c = G.play.cards[i]
                                local is_reserved = false
                                for _, fh in ipairs(final_hand) do if c == fh then is_reserved = true end end
                                if not is_reserved then c:start_dissolve({G.C.RED}, nil, 1.6) end
                            end

                            -- 6. Final Transformation (Force Suit AND Rank)
                            -- Transform Trip
                            SMODS.change_base(s1, master_suit, s1.base.value)
                            for _, t in ipairs(trip_targets) do
                                SMODS.change_base(t, master_suit, s1.base.value)
                            end
                            -- Transform Pair
                            SMODS.change_base(s2, master_suit, s2.base.value)
                            SMODS.change_base(pair_target, master_suit, s2.base.value)

                            for _, c in ipairs(final_hand) do c:juice_up(0.3, 0.3) end
                            play_sound('card1', 1)
                            card.ability.extra.used = 1 
                        end
                    end
                    return true
                end
            }))
            return true
        end
        
        -- Level up Flush House
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Flush House" then
            return { level_up = true }
        end
        
        -- Kill self
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}

SMODS.Consumable {
    key = "camio",
    set = "sigils",
    config = { extra = { used = 0 } },
    pos = { x = 3, y = 1 },
    atlas = "AbandoniaSigils",
    cost = 4,
    discovered = false,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        local _card = create_card('Voucher', G.vouchers, nil, nil, nil, nil, 'c_abn_camio')
        _card:add_to_deck()
        G.vouchers:emplace(_card)
    end,

    calculate = function(self, card, context)
        if context.press_play and card.area == G.vouchers and card.ability.extra.used == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Validation: Requires 5 cards
                    if G.play and G.play.cards and #G.play.cards >= 5 then
                        local potential_indices = {}
                        for i = 1, #G.play.cards do table.insert(potential_indices, i) end
                        
                        -- 1. Pick the Alpha (The Rank AND Suit Provider)
                        local idx_alpha = pseudorandom_element(potential_indices, pseudoseed('camio_alpha'))
                        local alpha = G.play.cards[idx_alpha]
                        local target_suit = alpha.base.suit
                        local target_rank = alpha.base.value
                        
                        -- Remove alpha from potential targets
                        for k, v in ipairs(potential_indices) do if v == idx_alpha then table.remove(potential_indices, k) break end end

                        -- 2. Identify the 4 Targets
                        local targets = {}
                        for i = 1, 4 do
                            local idx_t = pseudorandom_element(potential_indices, pseudoseed('camio_t'..i))
                            table.insert(targets, G.play.cards[idx_t])
                            for k, v in ipairs(potential_indices) do if v == idx_t then table.remove(potential_indices, k) break end end
                        end

                        if alpha and #targets == 4 then
                            -- 3. Dissolve Extras (keeping only the 5-card Flush Five)
                            for i = #G.play.cards, 1, -1 do
                                local c = G.play.cards[i]
                                local is_target = false
                                for _, t in ipairs(targets) do if c == t then is_target = true end end
                                
                                if c ~= alpha and not is_target then
                                    c:start_dissolve({G.C.RED}, nil, 1.6)
                                end
                            end

                            -- 4. The Grand Transformation
                            -- Force both Suit and Rank onto all 4 targets
                            for _, t in ipairs(targets) do
                                SMODS.change_base(t, target_suit, target_rank)
                                t:juice_up(0.3, 0.3)
                            end

                            play_sound('card1', 1)
                            card.ability.extra.used = 1
                        end
                    end
                    return true
                end
            }))
            return true
        end
        
        -- Level up Flush Five
        if context.before and card.area == G.vouchers and card.ability.extra.used == 1 and context.scoring_name == "Flush Five" then
            return { level_up = true }
        end
        
        -- Cleanup
        if context.final_scoring_step and card.area == G.vouchers and card.ability.extra.used == 1 then
            card:start_dissolve()
        end
    end,

    abn_artist_credits = { artist = "Robnnuy" },
}


local can_skip_booster_ref = G.FUNCS.can_skip_booster
G.FUNCS.can_skip_booster = function(e)
    -- Run the original logic first to handle standard UI states
    can_skip_booster_ref(e)

    -- Check if the pack contains sigils
    if G.pack_cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].config.center.set == 'sigils' then
        -- Grey out the button and remove the click functionality
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

local disabled = {
    --allow for disabling if needed
}

SMODS.Booster({
    key = 'sigilbooster',
    atlas = 'AbandoniaSigils',
    pos = { x = 4, y = 1 },
    loc_txt = {
        name = 'Sigil Pack',
        text = {
            'Select {C:attention}#1#{} of',
            '{C:attention}#2#{} {C:abn_sigil}Sigil{} cards to',
            'be used immediately',
			'{C:inactive}(cannot be skipped)'
        }
    },
    config = { extra = 3, choose = 1 },
    weight = 0.2,
    cost = 4,
    group_key = 'abn_sigilbooster',
    draw_hand = true,
    unlocked = true,
    discovered = true,
    create_card = function(self, card)
        local i = 0
        repeat
            i = i + 1  -- Increment to prevent infinite loop
            card = create_card("sigils", G.pack_cards, nil, nil, true, true, nil, "abn_sigils")  -- Long card creation logic
        until not disabled[card.config.center.key] or i > 100 or card:remove()  -- If the card is disabled, regenerate it or clean up after 100 attempts
        return card  -- Return the valid card
    end,
	
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
	
    ease_background_colour = function(self)
        local effects = {
            { new_colour = G.C.GREY, special_colour = G.C.RED, contrast = 3 },
        }
        local random_index = math.random(#effects)
        local chosen_effect = effects[random_index]
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.calamity_cards)
        ease_background_colour(chosen_effect)
    end
})