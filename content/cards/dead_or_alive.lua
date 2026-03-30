-- knockoff idol card selector (called each round)
function reset_dead_card()
    -- Initialize the table structure
    G.GAME.current_round.dead_card = { rank = 'Ace', suit = 'Spades', id = 14 }
    
    local valid_dead_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
            valid_dead_cards[#valid_dead_cards + 1] = playing_card
        end
    end

    local chosen_card = pseudorandom_element(valid_dead_cards, pseudoseed('idol' .. (G.GAME.round_resets.ante or 1)))
    
    if chosen_card then
        -- Use chosen_card consistently here
        G.GAME.current_round.dead_card.rank = chosen_card.base.value
        G.GAME.current_round.dead_card.suit = chosen_card.base.suit
        G.GAME.current_round.dead_card.id = chosen_card.base.id
    end
end

-- Hook run start
local start_run_ref = Game.start_run
function Game:start_run(args)
    start_run_ref(self, args)
    -- Ensure the card is generated at the start of the run
	if not next(SMODS.find_card('j_abn_dead_or_alive')) then
		reset_dead_card()
	end
end

-- Dead or Alive Joker
SMODS.Joker {
    key = 'dead_or_alive',
    rarity = 2,
    atlas = 'AbandoniaJokers',
    pos = { x = 4, y = 12 },
    cost = 5,
    blueprint_compat = true,
    config = { extra = { money = 0 } }, -- Changed config to reflect money focus

    loc_vars = function(self, info_queue, card)
        local target = G.GAME.current_round.dead_card or { rank = 'Ace', suit = 'Spades' }
        return {
            vars = {
                localize(target.rank, 'ranks'),
                localize(target.suit, 'suits_plural'),
                colours = { G.C.SUITS[target.suit] }
            }
        }
    end,
	
	abn_artist_credits = {
		artist = "Pooper McFart",
	},

    calculate = function(self, card, context)
        local target = G.GAME.current_round.dead_card
        
        -- Trigger when the specific card is played and scored
        if target and context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == target.id and context.other_card:is_suit(target.suit) then
				context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + context.other_card.base.nominal
                return {
                    -- context.other_card.base.nominal is the numeric value (2-11)
					message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    dollars = context.other_card.base.nominal,
                    card = card
                }
            end
        end
        
        --reset end of round
        if context.end_of_round and not context.blueprint and not context.repetition then
            reset_dead_card()
        end
    end
}