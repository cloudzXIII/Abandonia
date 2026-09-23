SMODS.Joker {
    key = 'comedy_gold',
    rarity = 3,
    atlas = 'ABNJokerSheet10',
    pos = { x = 9, y = 4},
    cost = 15,
    discovered = false,
    blueprint_compat = true,
    
    config = { 
        extra = { 
            hands_played = 0,
            hands_required = 6,
            xmult_add = 0.1,
            asc_add = 0.1,
        } 
    },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands_played, card.ability.extra.hands_required, card.ability.extra.xmult_add, card.ability.extra.asc_add } }
    end,

    in_pool = function(self, args)
        local gold_count = 0
        if G and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center == G.P_CENTERS.m_gold then
                    gold_count = gold_count + 1
                end
            end
        end
        return gold_count >= 6
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-1)
    end,

    calculate = function(self, card, context)
        if context.before then
            local all_gold = true
            if context.scoring_name ~= "High Card" then
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card.config.center ~= G.P_CENTERS.m_gold then
                        all_gold = false
                        break
                    end
                end
            else
                all_gold = false
            end

            if all_gold then
                local money_chunks = math.max(0, math.floor(G.GAME.dollars / 20))
                
                local scaled_xmult = card.ability.extra.xmult_add * money_chunks
                local scaled_asc = card.ability.extra.asc_add * money_chunks

                ease_dollars(G.GAME.dollars)
				
				if #context.scoring_hand >= 6 then
					card.ability.extra.hands_played = card.ability.extra.hands_played + 1
				end
                
                for _, scored_card in ipairs(context.scoring_hand) do
                    scored_card.ability.perma_x_mult = (scored_card.ability.perma_x_mult or 1) + scaled_xmult
                    scored_card.ability.abn_perma_asc = (scored_card.ability.abn_perma_asc or 0) + scaled_asc
                end
                
                if card.ability.extra.hands_played >= card.ability.extra.hands_required then
                    G.jokers.config.card_limit = G.jokers.config.card_limit * 2
                    card:start_dissolve()
                end
            end
        end
    end,

    abn_artist_credits = {
        artist = "Comykel",
    },
}