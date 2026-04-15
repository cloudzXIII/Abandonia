SMODS.Joker {
    key = 'prenatural_joker',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { numerator, denominator, card.ability.extra.xchipsadd, card.ability.extra.xchips } }
    end,

    rarity = 2,
    atlas = 'AbandoniaJokers',
    pos = { x = 5, y = 23 },
    cost = 6,
    discovered = false,
    blueprint_compat = true,
    config = { extra = { xchips = 0.1, xchipsadd = 0.1, odds = 10 } },

    in_pool = function(self)
        if not G.playing_cards then return false end
        local count = 0
        for _, card in ipairs(G.playing_cards) do
            if card.config and card.config.center and card.config.center ~= G.P_CENTERS.c_base then
                count = count + 1
            end
            if count >= 10 then return true end
        end
        return false
    end,

    calculate = function(self, card, context)
        -- Trigger when an individual card is scored
        if context.individual and context.cardarea == G.play then
            local currentCard = context.other_card
            local rank = currentCard:get_id()
            local is_odd = (rank >= 2 and rank <= 10 and rank % 2 ~= 0) or rank == 14

            if is_odd then
                if SMODS.pseudorandom_probability(card, 'prenatural_vouch', 1, card.ability.extra.odds) then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.4,
                        func = function()
                            local _pool = get_current_pool('Voucher')
                            local _voucher_key = nil
                            
                            -- Check if pool is empty or only contains UNAVAILABLE
                            if #_pool > 0 then
                                local iv = 1
                                _voucher_key = pseudorandom_element(_pool, pseudoseed('prenatural_vouch'))
                                
                                -- Safety loop for Tier 2 requirements
                                while _voucher_key == 'UNAVAILABLE' or (
                                    G.P_CENTERS[_voucher_key] and 
                                    G.P_CENTERS[_voucher_key].requires and 
                                    (not G.P_CENTERS[G.P_CENTERS[_voucher_key].requires] or not G.P_CENTERS[G.P_CENTERS[_voucher_key].requires].redeemed)
                                ) do
                                    iv = iv + 1
                                    _voucher_key = pseudorandom_element(_pool, pseudoseed('prenatural_vouch' .. '_resample' .. iv))
                                    -- If we've tried too many times, break to avoid infinite loop
                                    if iv > 100 then _voucher_key = 'v_blank'; break end
                                end
                            end

                            -- Fallback to Blank if nothing valid was found
                            if not _voucher_key or _voucher_key == 'UNAVAILABLE' then 
                                _voucher_key = 'v_blank' 
                            end

                            local voucher_card = create_card('Voucher', G.play, nil, nil, nil, nil, _voucher_key, 'pre')
                            voucher_card:juice_up(0.3, 0.5)
                            voucher_card:redeem()
                            G.GAME.dollars = G.GAME.dollars + 10
                            
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after', delay = 0.5,
                                func = function() voucher_card:remove() return true end
                            }))
                            return true
                        end
                    }))
				else
					card_eval_status_text(card, 'extra', nil, nil, nil, {
						message = localize('k_nope_ex'),
						colour = G.C.SECONDARY_SET.Tarot,
					})
                end

                card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsadd

                -- If it's Enhanced, return the XChips to the score
                if currentCard.config.center.set == "Enhanced" then
                    return {
                        x_chips = card.ability.extra.xchips,
                        card = card
                    }
                else
                    return {
						message = localize('k_upgrade_ex'),
						colour = G.C.BLUE,
						card = card
					}
                end
            elseif currentCard then
				card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsadd
				return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.BLUE,
					card = card
                }
			end
        end
    end,

    abn_artist_credits = { artist = "WarpedCloset" },
}
