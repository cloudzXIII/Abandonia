SMODS.Joker {
    key = 'motocross_joker',
    rarity = 2,
    atlas = 'ABNJokerSheet8',
    pos = { x = 2, y = 3 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    abn_coder = "LasagnaFelidae",
    config = { extra = { xmult_mod = 0.1, xmult = 1, chips = 1, dollars = 1} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS["m_wild"]
        local suit = (G.GAME.current_round.abn_motocross_card or {}).suit or 'Spades'
        return { vars = { card.ability.extra.xmult_mod, localize(suit, 'suits_singular'), card.ability.extra.xmult, card.ability.extra.chips, card.ability.extra.dollars } }
    end,

    countWilds = function(self, card)
        local ct = 0
        if G.playing_cards then
            for i, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, "m_wild") then ct = ct + 1 end
            end
        end
        return ct
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local ct = self.countWilds()
            
            if context.other_card:is_suit(G.GAME.current_round.abn_motocross_card.suit) then
                card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod)
                SMODS.calculate_effect({message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult_mod } },
                    colour = G.C.RED,
                }, card)
            end
            if SMODS.has_enhancement(context.other_card, "m_wild") then
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
                    card.ability.extra.chips*ct
                context.other_card.ability.perma_dollars = (context.other_card.ability.perma_dollars or 0) +
                    card.ability.extra.dollars*ct
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.FILTER
                }
            end
        end
        if context.joker_main and context.scoring_name == card.ability.extra.poker_hand then
			return {
                xmult = card.ability.extra.xmult
            }
		end
        if context.after then
            G.E_MANAGER:add_event(Event({
                func = function() 
                        ABN.reset_abn_motocross_card()
                    return true
                end
			}))
            
        end

    end,

    
    
    abn_artist_credits = {
        artist = "Nice Cream & Superb Thing",
    },
}


function ABN.reset_abn_motocross_card()
    G.GAME.current_round.abn_motocross_card = G.GAME.current_round.abn_motocross_card or { suit = 'Spades' }
    local motocross_card = pseudorandom_element(SMODS.Suits, 'abn_motocross' .. G.GAME.round_resets.ante).key
    G.GAME.current_round.abn_motocross_card.suit = motocross_card
end
