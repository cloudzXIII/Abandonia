SMODS.Joker {
    key = 'globalist_joker',
    atlas = 'ABNJokerSheet24',
    pos = { x = 9, y = 1 },
    rarity = 3, 
    cost = 10,
    blueprint_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    
    config = { 
        extra = { 
            continents_used = 0,
            trigger = 7,
            unique_continents = 0,
            xmult = 1,
			xmultadd = 1,
        } 
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.trigger - card.ability.extra.continents_used,
                card.ability.extra.xmultadd,
                card.ability.extra.xmult
            }
        }
    end,

    update = function(self, card, dt)
        local count = 0
        if G.GAME and G.GAME.consumeable_usage then
            for _, v in pairs(G.GAME.consumeable_usage) do
                if v.set == 'continent' then
                    count = count + 1
                end
            end
        end

        card.ability.extra.unique_continents = count
        card.ability.extra.xmult = 1 + ( count * card.ability.extra.xmultadd )
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            if context.consumeable.ability.set == 'continent' then
				if card.ability.extra.continents_used < card.ability.extra.trigger then
					card.ability.extra.continents_used = card.ability.extra.continents_used + 1
				end

                G.E_MANAGER:add_event(Event({
                    func = function()
                        local new_card = create_card('Consumeables', G.consumeables)
						new_card:set_edition({ negative = true }, true)
						new_card:add_to_deck()
						G.consumeables:emplace(new_card)
                        return true
                    end
                }))
				
				if card.ability.extra.continents_used < card.ability.extra.trigger then
					card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
				elseif card.ability.extra.continents_used >= card.ability.extra.trigger then
					card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_active_ex') })
				end
            end
        end

        if context.cardarea == G.jokers and context.before and not context.blueprint then
            if card.ability.extra.continents_used >= card.ability.extra.trigger then
                local spectrum_hands = {
                    "abn_Spectrum",
                    "abn_Specflush",
                    "abn_Straight Specflush",
                    "abn_Specflush House",
                    "abn_Specflush Five",
                    "abn_Specflush Six"
                }

                local is_spectrum = false
                for _, hand_type in ipairs(spectrum_hands) do
                    if context.poker_hands[hand_type] and next(context.poker_hands[hand_type]) then
                        is_spectrum = true
                        break
                    end
                end

                if is_spectrum then
                    local valid_stamps = {}
                    for stamp_key, _ in pairs(SMODS.Stickers) do
                        if ABN_is_stamp(stamp_key) then
                            table.insert(valid_stamps, stamp_key)
                        end
                    end

                    if #valid_stamps > 0 then
                        for _, scoring_card in ipairs(context.scoring_hand) do
                            local chosen_stamp = pseudorandom_element(valid_stamps, pseudoseed('globalist_stamp'))
                            abn_add_stamp(scoring_card, chosen_stamp)
                        end

                        card.ability.extra.continents_used = 0

                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_reset') })
                    end
                end
            end
        end

        if context.joker_main then
            return {
				xmult = card.ability.extra.xmult
            }
        end
    end,

    abn_artist_credits = {
        artist = "Scruffymusic",
    },
}