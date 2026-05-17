SMODS.Joker {
    key = 'jurian',
    rarity = "abn_ParallelRare",
    atlas = 'AbandoniaParallel',
    pos = { x = 2, y = 6 },
    soul_pos = { x = 3, y = 6 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { xchips = 2, } },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
            }
        }
    end,
    
    calculate = function(self, card, context)
		
		-- Discards
        if context.discard and context.other_card then
            context.other_card.ability.jurian = (context.other_card.ability.jurian or 0) + card.ability.extra.xchips
        end
        
        -- Retriggers
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card and context.other_card == card then
            local jurian_count = 0
            for _, c in ipairs(G.playing_cards) do
                if c and c.ability and c.ability.jurian and c.ability.jurian >= 1 then
                    jurian_count = jurian_count + 1
                end
            end

            if jurian_count >= 2 then
                local reps = jurian_count - 1
                return {
                    repetitions = reps,
                    message = localize('k_again_ex'),
                }
            end
        end
        
        -- Scoring
        if context.joker_main then
            for _, c in ipairs(G.playing_cards) do
                if c and c.ability and c.ability.jurian and c.ability.jurian >= 1 then
                    return {
                        xchips = c.ability.jurian,
                    }
                end
            end
        end
        
        -- Cleanup
        if context.selling_self or context.drawing_cards and card.ability.jurian and card.ability.juriantriggered and card.ability.juriantriggered == 1 or context.end_of_round then
            for _, p_card in ipairs(G.playing_cards) do
                if p_card and p_card.ability and p_card.ability.jurian then
                    p_card.ability.juriantriggered = 0
                    p_card.ability.jurian = 0
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Bunnet",
    },
}