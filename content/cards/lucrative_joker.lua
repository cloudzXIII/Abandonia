--i'll be honest this is probably NOT the best way to do this shit but this is what i've got and its somewhat functional

-- Hook into Card:use_consumeable using SMODS logic
local use_consumeable_ref = Card.use_consumeable
function Card:use_consumeable(area, copier)
    local used_tarot = copier or self
    
    -- Check for lucrative joker
    local has_lucrative = next(SMODS.find_card("j_abn_lucrative_joker"))

    -- Logic for The Hermit
    if self.ability.name == 'The Hermit' and has_lucrative then
        stop_use()
        if not copier then set_consumeable_usage(self) end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            -- Remove the math.min cap, just use G.GAME.dollars
            ease_dollars(math.max(0, G.GAME.dollars), true)
            return true end }))
        delay(0.6)
        return
    end

    -- Run the original function for everything else
    return use_consumeable_ref(self, area, copier)
end

-- Save the original function reference
local g_p_d_ref = Card.get_p_dollars

-- Hook the function correctly
function Card:get_p_dollars()
    -- Call the original
    local ret = g_p_d_ref(self)

    -- Check for Lucrative and Slot Machine
    if not self.debuff and self.seal == 'Gold' then
        if next(SMODS.find_card("j_abn_lucrative_joker")) and next(SMODS.find_card("j_abn_slot_machine")) then
            -- Add the extra $3 to the return value
            ret = ret + 3
            
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + 3
            G.E_MANAGER:add_event(Event({
                func = (function() 
                    G.GAME.dollar_buffer = 0; 
                    return true 
                end)
            }))
        end
    end

    return ret
end

local original_game_update = Game.update
function Game:update(dt)
    original_game_update(self, dt)
    
    -- Only run during a run
    if not G.STAGE or G.STAGE ~= G.STAGES.RUN then return end
    if not G.playing_cards or not G.jokers then return end

    -- Check if Lucrative Joker is owned
    local has_lucrative = next(SMODS.find_card("j_abn_lucrative_joker"))
	local has_slot_machine = next(SMODS.find_card("j_abn_slot_machine"))

    -- Iterate through every card in the deck
    for _, c in ipairs(G.playing_cards) do
        local is_gold = c.config.center == G.P_CENTERS.m_gold
        local should_be_doubled = has_lucrative and has_slot_machine and is_gold

        -- APPLY DOUBLE
        if should_be_doubled and not c.ability.lucratived then
            
            -- fortlatro griddy function
            if c.ability then
                -- Target extra table if it exists (Gold cards use ability.h_dollars)
                if c.ability.h_dollars then 
                    c.ability.h_dollars = c.ability.h_dollars * 2 
                end
                
            end

            c.ability.lucratived = true

        -- REVERT DOUBLE
        elseif not should_be_doubled and c.ability.lucratived then
            print('Lucrative: Reverting a card')

            if c.ability then
                if c.ability.h_dollars then 
                    c.ability.h_dollars = math.max(0, c.ability.h_dollars / 2) 
                end
            end

            c.ability.lucratived = nil
            c:juice_up()
        end
    end
end

SMODS.Joker {
    key = 'lucrative_joker',
    rarity = 3,
    atlas = 'ABNJokerSheet7',
    pos = { x = 8, y = 3 },
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { repetitions = 1 } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,
    
    in_pool = function(self)
        if not G.playing_cards then return false end
        for _, card in ipairs(G.playing_cards) do
            if card and card.seal and card.seal == 'Gold' then
                return true
            end
            return false
        end
    end,
	
	add_to_deck = function(self, card)
        G.GAME.interest_cap = G.GAME.interest_cap + 999999999999
    end,

    remove_from_deck = function(self, card)
        G.GAME.interest_cap = G.GAME.interest_cap - 999999999999
    end,

    abn_artist_credits = {
        artist = "Littlesamu",
    },
}