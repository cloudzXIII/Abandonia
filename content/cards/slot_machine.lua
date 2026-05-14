
local old_prob = SMODS.pseudorandom_probability
function SMODS.pseudorandom_probability(trigger_obj, seed, base_numerator, base_denominator, identifier, no_mod)
    local cards = SMODS.find_card("j_abn_slot_machine")
    
    -- Check if slot machine exists
    if next(SMODS.find_card("j_abn_slot_machine")) then 
		if not next(SMODS.find_card("j_golden")) then 
			ease_dollars(-5)
		end
        return true -- Force succeed
    end

    -- Otherwise, do normal probabilities
    return old_prob(trigger_obj, seed, base_numerator, base_denominator, identifier, no_mod)
end


SMODS.Joker {
    key = 'slot_machine',
    rarity = 3,
    atlas = 'ABNJokerSheet7',
    pos = { x = 2, y = 4 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { repetitions = 1 } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,
    
    in_pool = function(self)
        if not G.playing_cards then return false end
        if G.GAME.consumeable_usage['c_wheel_of_fortune'] and 
           G.GAME.consumeable_usage['c_wheel_of_fortune'].count > 0 then
            return true
        end
        return false
    end,

    calculate = function(self, card, context)
        -- Level up 
        if context.before and context.scoring_name == "Straight Flush" then
            local is_royal = true
            local counts = {['10'] = 0, ['11'] = 0, ['12'] = 0, ['13'] = 0, ['14'] = 0}
            
            for i = 1, #context.scoring_hand do
                local rank = context.scoring_hand[i].base.id
                if not counts[tostring(rank)] then
                    is_royal = false
                    break
                end
            end

            if is_royal then
                return {
                    level_up = true,
                    message = localize('k_level_up_ex'),
                }
            end
        end

        -- Retrigger
        if context.repetition and context.cardarea == G.play then
            -- check for Royal Flush
            if context.scoring_name == "Straight Flush" then
                local is_royal = true
                local counts = {['10'] = 0, ['11'] = 0, ['12'] = 0, ['13'] = 0, ['14'] = 0}
                
                for i = 1, #context.scoring_hand do
                    local rank = context.scoring_hand[i].base.id
                    if not counts[tostring(rank)] then
                        is_royal = false
                        break
                    end
                end

                if is_royal then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = 1,
                        card = card
                    }
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Littleroot",
    },
}