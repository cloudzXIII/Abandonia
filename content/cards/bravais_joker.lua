SMODS.Joker {
    key = 'bravais_joker',
    rarity = 1,
    atlas = 'AbandoniaJokers',
    pos = { x = 9, y = 17 },
    cost = 5,
    discovered = false,
    blueprint_compat = true, 
    
    config = { extra = { chips = 0, mult = 0, chipsadd = 10, multadd = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.chips, 
            card.ability.extra.mult, 
            card.ability.extra.chipsadd, 
            card.ability.extra.multadd 
        } }
    end,
	
	in_pool = function(self)
		if not G.playing_cards then return false end
            
		for _, card in ipairs(G.playing_cards) do
			if card and card.config and card.config.center and card.config.center == G.P_CENTERS.m_wild or card and card.config and card.config.center and card.config.center == G.P_CENTERS.m_abn_mercurial then
				return true
			end
		end
        return false
    end,

    calculate = function(self, card, context)
        -- SCALING LOGIC: Happens 'before' the hand scores
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            -- List of valid hands that trigger scaling
            local valid_hands = {
                ["abn_Spectrum"] = true, 
                ["abn_Specflush"] = true, 
                ["abn_Straight Specflush"] = true, 
                ["abn_Specflush House"] = true, 
                ["abn_Specflush Five"] = true, 
                ["abn_Specflush Six"] = true
            }

            if valid_hands[context.scoring_name] then
                for _, scoring_card in ipairs(context.scoring_hand) do
                    local triggered = false
                    
                    -- Check for Wild Cards
                    if scoring_card.config.center == G.P_CENTERS.m_wild then
                        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsadd
                        if card.edition then
                            scoring_card.ability.perma_bonus = (scoring_card.ability.perma_bonus or 0) + card.ability.extra.chipsadd
                        end
                        triggered = true
                    end

                    -- Check for Mercurial Cards
                    if scoring_card.config.center == G.P_CENTERS.m_abn_mercurial then
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multadd
                        if card.edition then
                            scoring_card.ability.perma_mult = (scoring_card.ability.perma_mult or 0) + card.ability.extra.multadd
                        end
                        triggered = true
                    end

                    -- Visual notification over the card being upgraded
                    if triggered then
                        card_eval_status_text(scoring_card, 'extra', nil, nil, nil, {message = "Upgrade!", colour = G.C.Mult})
                        card:juice_up()
                    end
                end
            end
        end
        
        -- scoring logic
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
                card = card
            }
        end
    end,

    abn_artist_credits = {
        artist = "Samuran",
    },
}