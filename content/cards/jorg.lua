SMODS.Joker {
    key = 'jorg',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 2, y = 5 },
    soul_pos = { x = 3, y = 5},
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { xmult = 2, } },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,
    
    calculate = function(self, card, context)
		
		-- Discards
        if context.discard and context.other_card then
            context.other_card.ability.jorg = (context.other_card.ability.jorg or 0) + card.ability.extra.xmult
        end
        
        -- Retriggers
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card and context.other_card == card then
            local jorg_count = 0
            for _, c in ipairs(G.playing_cards) do
                if c and c.ability and c.ability.jorg and c.ability.jorg >= 1 then
                    jorg_count = jorg_count + 1
                end
            end

            if jorg_count >= 2 then
                local reps = jorg_count - 1
                return {
                    repetitions = reps,
                    message = localize('k_again_ex'),
                }
            end
        end
        
        -- Scoring
        if context.joker_main then
            for _, c in ipairs(G.playing_cards) do
                if c and c.ability and c.ability.jorg and c.ability.jorg >= 1 then
                    return {
                        xmult = c.ability.jorg,
                    }
                end
            end
        end
        
        -- Cleanup
        if context.selling_self or context.drawing_cards and card.ability.jorg and card.ability.jorgtriggered and card.ability.jorgtriggered == 1 or context.end_of_round then
            for _, p_card in ipairs(G.playing_cards) do
                if p_card and p_card.ability and p_card.ability.jorg then
                    p_card.ability.jorgtriggered = 0
                    p_card.ability.jorg = 0
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}