SMODS.Joker {
    key = 'darknet_joker',
    rarity = 3, 
    atlas = 'ABNJokerSheet1',
    pos = { x = 2, y = 5 },   
    cost = 8,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1,
            xmultadd = 0.1,
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_abn_bit_rot
        return {
            vars = {
                card.ability.extra.xmultadd,
                card.ability.extra.xmult,
            }
        }
    end,
	
	in_pool = function(self)
        if G.GAME and G.GAME.hands then
            local hand_name = "abn_Divider Conquered"
            if G.GAME.hands[hand_name] and G.GAME.hands[hand_name].played > 0 then
                return true
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local real_scoring_hand = context.scoring_hand
            if not real_scoring_hand or #real_scoring_hand == 0 then
                real_scoring_hand = G.play and G.play.cards or {}
            end

            if context.scoring_name == "abn_Divider Conquered" and not context.blueprint then
                
                card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmultadd * #real_scoring_hand)
                
                
                card_eval_status_text(card, 'extra', nil, nil, nil, {
					message = localize('k_upgrade_ex'),
                })

                if G.GAME.current_round.hands_played == 0 and #real_scoring_hand > 0 then
                    local only_numbers = true
                    for _, scored_card in ipairs(real_scoring_hand) do
                        local id = scored_card:get_id()
                        if id == 11 or id == 12 or id == 13 or id == 14 then
                            only_numbers = false
                            break
                        end
                    end

                    if only_numbers then
                        for _, scored_card in ipairs(real_scoring_hand) do
                            scored_card:set_edition({abn_bit_rot = true}, true)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    scored_card:juice_up()
                                    return true
                                end,
                            }))
                        end
                    end
                end
            end

            -- Scoring
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end,

    abn_artist_credits = {
        artist = "Vlambambo",
    },
}