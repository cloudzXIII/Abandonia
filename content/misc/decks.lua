
SMODS.Back{
    key = 'CrimsonDeck',
    atlas = 'AbandoniaDecks',
    pos = {x = 0, y = 0},
    loc_txt = {
        name = 'Crimson Deck',
        text = {
            'Base {C:chips}Chips{} for Poker hands are {C:attention}halved{}',
			'{X:mult,C:white}X2{} Mult',
			'All Blinds are {X:mult,C:white}X1.7{} bigger',
        },
    },

    config = {
        hand_size = 0
    },

    apply = function ()
        G.E_MANAGER:add_event(Event({

            func = function ()
				
				-- Halve base chips for all hands
                for k, v in pairs(G.GAME.hands) do
                    v.chips = v.chips / 2
                end
				
				local known_hands = {}
				for hand, data in pairs(G.GAME.hands) do
					if data.visible then
						known_hands[#known_hands + 1] = hand
					end
				end

				-- If somehow nothing is known yet, do nothing safely
				if #known_hands == 0 then return end
				
				SMODS.upgrade_poker_hands({
				hands = known_hands,
				parameters = { "chips", "mult" },
				level_up = 0,
				instant = true,

				from = card,
        })

                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.8
				
				
                return true
            end
        }))
    end,
	
	calculate = function(self, card, context)
	
		if context.final_scoring_step then
			return {
                xmult = 2,
                card = card,
            }
		end
	end,
}


SMODS.Back{
    key = 'AzulDeck',
    atlas = 'AbandoniaDecks',
    pos = {x = 1, y = 0},
    loc_txt = {
        name = 'Azul Deck',
        text = {
            'Can {C:chips}play{} and {C:mult}discard{} {C:attention}6{} cards',
			'lose {C:money}$3{} when playing less then {C:attention}6{} cards',
        },
    },

    config = {
        hand_size = 0
    },

    apply = function ()
        G.E_MANAGER:add_event(Event({

            func = function ()
				
				SMODS.change_play_limit(1)
				SMODS.change_discard_limit(1)
				
                return true
            end
        }))
    end,
	
	calculate = function(self, card, context)
	
		if context.final_scoring_step then
			if context.full_hand and #context.full_hand < 6 then
				return {
					dollars = -3,
					colour = G.C.MONEY,
				}
			end
		end		
	end,
}

SMODS.Back{
    key = 'EvenOddDeck',
    atlas = 'AbandoniaDecks',
    pos = {x = 1, y = 2},
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
    pos = {x = 4, y = 2},
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
                local diamonds = {}
                for _, v in pairs(G.playing_cards) do
                    if v.base.suit == 'Diamonds' then
                        table.insert(diamonds, v)
                    end
                end

                for _, card in ipairs(diamonds) do
                    local new_card = copy_card(card)
                    
                    new_card:change_suit('abn_Snow')
                    
                    new_card:add_to_deck()
                    G.deck:emplace(new_card)
                    table.insert(G.playing_cards, new_card)
                end

                G.deck.config.card_limit = #G.playing_cards
                return true
            end
        }))
    end
}

SMODS.Back{
    key = 'PenumbraDeck',
    atlas = 'AbandoniaDecks',
    pos = {x = 0, y = 1},
    loc_txt = {
        name = 'Penumbra Deck',
        text = {
            'Start with a set',
			'of {C:abn_penumbra}Penumbra{} cards',
        },
    },
    config = {
        hand_size = 0,
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                local diamonds = {}
                for _, v in pairs(G.playing_cards) do
                    if v.base.suit == 'Diamonds' then
                        table.insert(diamonds, v)
                    end
                end

                for _, card in ipairs(diamonds) do
                    local new_card = copy_card(card)
                    
                    new_card:change_suit('abn_Penumbra')
                    
                    new_card:add_to_deck()
                    G.deck:emplace(new_card)
                    table.insert(G.playing_cards, new_card)
                end

                G.deck.config.card_limit = #G.playing_cards
                return true
            end
        }))
    end
}