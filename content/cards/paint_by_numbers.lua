
SMODS.Joker {
    key = 'paint_by_numbers',
    abn_coder = "LasagnaFelidae",
    
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { } 
        }
    end,
    
    rarity = 3,
    atlas = 'ABNJokerSheet4',
    pos = { x = 3, y = 0 },
    cost = 10,
    discovered = false,
    blueprint_compat = true,
    
    config = { extra = { chips = 10, mult = 3 } },
    calculate = function(self, card, context)
        
        if context.repetition and context.cardarea == G.play and #context.scoring_hand > 1 then
            local is_ret = true
            if G.GAME.current_round.hands_played == 0 then
                for i = 1, #context.scoring_hand do
                    if not (context.scoring_hand[i].base.suit == "abn_suitless" and ABN.is_number(context.scoring_hand[i])) then
                        is_ret = false
                        break
                    end
                end
            elseif G.GAME.current_round.hands_played == 1 then
                for i = 1, #context.scoring_hand do
                    if not (ABN.is_number(context.scoring_hand[i])) then
                        is_ret = false
                        break
                    end
                    if (context.scoring_hand[i].base.suit == "abn_suitless") then
                        is_ret = false
                        break
                    end
                end
            else
                is_ret = false
            end
            if is_ret == true then
                return { repetitions = 1}
            end
        end
        if context.joker_main then
            local is_ret = true
            if G.GAME.current_round.hands_played == 0 then
                for i = 1, #context.scoring_hand do
                    if not (context.scoring_hand[i].base.suit == "abn_suitless" and ABN.is_number(context.scoring_hand[i])) then
                        is_ret = false
                        break
                    end
                end
            elseif G.GAME.current_round.hands_played == 1 then
                for i = 1, #context.scoring_hand do
                    if not (ABN.is_number(context.scoring_hand[i])) then
                        is_ret = false
                        break
                    end
                end
            else
                is_ret = false
            end
            if is_ret == true then
                SMODS.upgrade_poker_hands({hands = context.scoring_name})
            end
        end
    end,
    abn_artist_credits = {
        artist = "HyperReal63",
    },
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card.base.suit == "abn_suitless" then
                return true
            end
        end
        return false
    end
}
