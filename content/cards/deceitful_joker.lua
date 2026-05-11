SMODS.Joker {
  key = 'deceitful_joker',
  rarity = 1,
  atlas = 'ABNJokerSheet8',
  pos = { x = 3, y = 4 },
  cost = 6,
  discovered = false,
  blueprint_compat = true,
  config = {
    extra = { xmult = 2 }
  },
  
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "abn_flipped_card", set = "Other" }
    return { vars = { card.ability.extra.xmult } }
  end, 
  
  add_to_deck = function(self, card)
	--pick a random suit when added to deck
	G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                local all_cards = G.playing_cards
                if #all_cards > 0 then
                    -- Identify which suits actually exist in the deck
                    local available_suits = {}
                    local seen = {}
                    for _, c in ipairs(all_cards) do
                        local s = c.base.suit
                        if not seen[s] then
                            table.insert(available_suits, s)
                            seen[s] = true
                        end
                    end

                    -- Pick a random suit from the available ones
                    if #available_suits > 0 then
                        -- FIX: Seed now includes game state variables to ensure a new result each round
                        local seed_str = 'deceitful' .. (G.GAME.round_resets.ante or 1) .. (G.GAME.round_resets.blind_states.Boss or 'none')
                        local chosen_suit = pseudorandom_element(available_suits, pseudoseed(seed_str))
                        
                        -- Get name and color for the suit
                        local suit_text = localize(chosen_suit, 'suits_plural')

                        -- Flip all cards of that suit
                        for _, c in ipairs(all_cards) do
                            if c:is_suit(chosen_suit) then
                                c.ability.abn_perma_flipped = true
                                c:flip()
                            end
                        end
                        
                        -- Display picked suit using the Joker as the source
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = suit_text .. '!'})
                    end
                end
                return true
            end
        }))
  end,

  calculate = function(self, card, context)
    -- When ante changes
    if context.end_of_round and G.GAME.blind.boss and context.game_over == false and context.main_eval and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                local all_cards = G.playing_cards
                if #all_cards > 0 then
                    -- Identify which suits actually exist in the deck
                    local available_suits = {}
                    local seen = {}
                    for _, c in ipairs(all_cards) do
                        local s = c.base.suit
                        if not seen[s] then
                            table.insert(available_suits, s)
                            seen[s] = true
                        end
                    end

                    -- Pick a random suit from the available ones
                    if #available_suits > 0 then
                        -- FIX: Seed now includes game state variables to ensure a new result each round
                        local seed_str = 'deceitful' .. (G.GAME.round_resets.ante or 1) .. (G.GAME.round_resets.blind_states.Boss or 'none')
                        local chosen_suit = pseudorandom_element(available_suits, pseudoseed(seed_str))
                        
                        -- Get name and color for the suit
                        local suit_text = localize(chosen_suit, 'suits_plural')

                        -- Flip all cards of that suit
                        for _, c in ipairs(all_cards) do
                            if c:is_suit(chosen_suit) then
                                c.ability.abn_perma_flipped = true
                                c:flip()
                            end
                        end
                        
                        -- Display picked suit using the Joker as the source
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = suit_text .. '!'})
                    end
                end
                return true
            end
        }))
    end
    
    -- Scoring logic
    if context.joker_main then
        return {
            message = localize{type='variable', key='a_xmult', vars={card.ability.extra.xmult}},
            Xmult_mod = card.ability.extra.xmult
        }
    end
  end,

  abn_artist_credits = {
    artist = "Dylan hall",
  },
}