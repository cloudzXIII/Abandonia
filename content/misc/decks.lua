SMODS.Back{
    key = 'EvenOddDeck',
    atlas = 'AbandoniaDecks',
    pos = {x = 3, y = 1},
    loc_txt = {
        name = 'Even and Odd deck',
        text = {
            'Only {C:attention}numbered{} cards',
        },
    },

    config = {
        hand_size = 0
    },

    apply = function ()
        G.E_MANAGER:add_event(Event({

            func = function ()

                for _, card in pairs(G.playing_cards) do
					if card:get_id() > 10 then
						card:start_dissolve()
					end
				end

                return true
            end
        }))
    end,
}

SMODS.Back{
    key = 'SnowDeck',
    atlas = 'AbandoniaDecks',
    pos = {x = 3, y = 2},
    loc_txt = {
        name = 'Snow Deck',
        text = {
            'Start with a set',
			'of {C:abn_snow}Snow{} cards',
        },
    },
    config = {
        hand_size = 0,
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                -- 1. Find all Diamonds currently in the deck
                local diamonds = {}
                for _, v in pairs(G.playing_cards) do
                    if v.base.suit == 'Diamonds' then
                        table.insert(diamonds, v)
                    end
                end

                -- 2. Create the Snow copies
                for _, card in ipairs(diamonds) do
                    -- Create a copy of the card (preserving Rank)
                    local new_card = copy_card(card)
                    
                    -- Change the suit to Snow
                    -- Ensure 'abn_Snow' matches exactly what you named your SMODS.Suit key
                    new_card:change_suit('abn_Snow')
                    
                    -- Properly register the card into the deck containers
                    new_card:add_to_deck()
                    G.deck:emplace(new_card)
                    table.insert(G.playing_cards, new_card)
                end

                -- 3. Update the UI and Sort the deck
                G.deck.config.card_limit = #G.playing_cards
                return true
            end
        }))
    end
}